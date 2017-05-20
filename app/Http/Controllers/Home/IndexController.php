<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Employee;
use App\Models\Template;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\URL;

class IndexController extends Controller
{

    public function index()
    {
        return view('home.index');
    }

    /* 微信分享JS-API */
    //获取微信公众号access_token
    public function wx_get_token(){

        $AppID ='wx80cfbb9a1b347f47';
        $AppSecret ='002d277233e21b95d367a5161c4a39d8';
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        //使用crul模拟
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);//执行发送
        $jsoninfo = json_decode($output, true);
        $access_token = $jsoninfo["access_token"];
        return $access_token;//access_token有效期未7200s

    }

    //获取微信公众号jsapi_ticket
    public function wx_get_jsapi_ticket(){

        $url = sprintf("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi", $this->wx_get_token());
        //使用crul模拟
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);//执行发送
        $jsoninfo = json_decode($output, true);
        $jsapi_ticket = $jsoninfo["ticket"];
        return $jsapi_ticket;
    }

    //生成签名
    public function getSignPackage(){
        $wx = array();
        $wx['AppID'] = 'wx80cfbb9a1b347f47';
        //生成签名的时间戳
        $wx['timestamp'] = time();
        //生成签名的随机串
        $wx['noncestr'] = 'Wm3WZYTPz0wzccnW';
        //jsapi_ticket是公众号用于调用微信JS接口的临时票据。正常情况下，jsapi_ticket的有效期为7200秒，通过access_token来获取。
        $wx['jsapi_ticket'] = $this->wx_get_jsapi_ticket();
        //分享的地址，注意：这里是指当前网页的URL，不包含#及其后面部分
        $wx['url'] = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $string = sprintf("jsapi_ticket=%s&noncestr=%s&timestamp=%s&url=%s", $wx['jsapi_ticket'], $wx['noncestr'], $wx['timestamp'], $wx['url']);
        //生成签名
        $wx['signature'] = sha1($string);
        return $wx;
    }
    /* 微信分享JS-API */

    /* 名片预览展示 */
    public function cardview()
    {
        $geturl = URL::current();
        $server_name = $_SERVER['SERVER_NAME'];
        /* 获取分享js-api参数 */
        $sign_package = $this-> getSignPackage();
        $AppID=$sign_package['AppID'];
        $timestamp=$sign_package['timestamp'];
        $noncestr=$sign_package['noncestr'];
        $signature=$sign_package['signature'];
        $jsapi_ticket=$sign_package['jsapi_ticket'];
        /* 获取分享js-api参数结束 */
        $id = Input::get('id');
        $com = Input::get('com');
        $emp = Input::get('emp');
        $qrcodeurl = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $geturl . '?com=' . $com . '%26%26emp=' . $emp;
        $useable_type = 'company';
        if ($emp != '') {
            $employee = Employee::find($emp);
            if ($com != '') {
                $company = Company::find($com);
                /*目前模板选择只开放公司选择，默认useable_type=company,TODO*/
                $template_id = DB::table('template_useable')->where('useable_type', 'company')->where('useable_id', $com)->pluck('template_id');
                if ($template_id != null) {
                    $template_name = Template::find($template_id)->pluck('name');
                    $template_name = $template_name[0];
                } else {
                    $template_name = 'W0001PCN01';
                }

            } else {

                $company_id = $employee->company_id;
                $company = Company::find($company_id);
                /*目前模板选择只开放公司选择，默认useable_type=company,TODO*/
                $template_id = DB::table('template_useable')->where('useable_type', 'company')->where('useable_id', $company_id)->pluck('template_id');
                if ($template_id != null) {
                    $template_name = Template::find($template_id)->pluck('name');
                    $template_name = $template_name[0];
                } else {
                    $template_name = 'W0001PCN01';
                }

            }
        } else {
            return redirect()->route('errorview')->with('com', '$com');
        }
        $employee = Employee::find($emp);
        $message="BEGIN:VCARD%0AVERSION:3.0%0AN:".$employee->name."%0ALOGO;VALUE=:http://".$server_name."/".$company->logo."%0ATEL;type=CELL;type=pref:".$employee->mobile."%0AADR;type=WORK;type=pref:".$company->address."%0AORG:".$company->name."%0ATITLE:".$employee->title."%0ANOTE:来自G宝盆名片.%0AEND:VCARD";
        //dd($message);
        $mpqrcodeurl = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $message;
        return view($template_name . '.index')->with([
            'template_name' => $template_name,
            'employee' => $employee,
            'company' => $company,
            'qrcodeurl' => $qrcodeurl,
            'mpqrcodeurl' => $mpqrcodeurl,
            'server_name' => $server_name,
            'AppID'=> $AppID,
            'noncestr'=> $noncestr,
            'signature'=> $signature,
            'timestamp'=> $timestamp,
        ]);
    }

    public function errorview()
    {
        return view('errors.errorview');
    }


}

