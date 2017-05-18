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
//        dd(1);
        return view('home.index');
    }

    /* 微信分享JS-API */
    public function get_curl_contents($url,$method ='GET',$data = array()){
        if($method == 'POST') {
            $ch = curl_init();
            //设置选项，包括URL
            curl_setopt($ch, CURLOPT_URL, "$url");
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_TIMEOUT, 5);  //定义超时3秒钟
            // POST数据
            curl_setopt($ch, CURLOPT_POST, 1);
            // POST参数
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            //执行并获取url地址的内容
            $result = curl_exec($ch);
            //释放curl句柄
            curl_close($ch);
        }
            else{
            //初始化
            $ch = curl_init();
            //设置选项，包括URL
            curl_setopt($ch, CURLOPT_URL, "$url");
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            //执行并获取HTML文档内容
            $result = curl_exec($ch);
            //释放curl句柄
            curl_close($ch);
            }
            return $result;
        }

    //获取微信公众号access_token
    public function wx_get_token(){

        $AppID ='wx80cfbb9a1b347f47';
        $AppSecret ='002d277233e21b95d367a5161c4a39d8';
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$AppID.'&secret='.$AppSecret;
        //dd($url);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);
        $jsoninfo = json_decode($output, true);
        $access_token = $jsoninfo["access_token"];
        //dd($access_token);
        //$res = $this->get_curl_contents($url);
        //dd($res);
        //$res = json_decode($res,true);
        //dd($res);
        //return $res['access_token'];
        return $access_token;
    }

    //获取微信公从号ticket
    public function wx_get_jsapi_ticket(){
        $url = sprintf("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi", $this->wx_get_token());
        //dd($url);
        //$res = $this->get_curl_contents($url);
        //$res = json_decode($res, true);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);
        $jsoninfo = json_decode($output, true);
        //dd($jsoninfo);
        $jsapi_ticket = $jsoninfo["ticket"];
        //dd($jsapi_ticket);
        return $jsapi_ticket;
    }

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
        $string = sprintf("jsapi_ticket=%s&noncestr=%s×tamp=%s&url=%s", $wx['jsapi_ticket'], $wx['noncestr'], $wx['timestamp'], $wx['url']);
        //生成签名
        $wx['signature'] = sha1($string);
        return $wx;
    }






    /* 微信分享JS-API结束 */

    /* 名片预览展示 */
    public function cardview()
    {
        $geturl = URL::current();
        $server_name = $_SERVER['SERVER_NAME'];
        $sign_package = $this-> getSignPackage();
        $AppID=$sign_package['AppID'];
        $timestamp=$sign_package['timestamp'];
        $noncestr=$sign_package['noncestr'];
        $url=$sign_package['url'];
        $signature=$sign_package['signature'];
        $jsapi_ticket=$sign_package['jsapi_ticket'];
        //dd($jsapi_ticket);
        $id = Input::get('id');
        $com = Input::get('com');
        $emp = Input::get('emp');
        $qrcodeurl = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $geturl . '?com=' . $com . '%26%26emp=' . $emp;
        $useable_type = 'company';
        if ($emp != '') {
            $employee = Employee::find($emp);
            //dd(11);
            if ($com != '') {
                //dd(222);
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


        //dd($employee);
        return view($template_name . '.index')->with([
            'template_name' => $template_name,
            'employee' => $employee,
            'company' => $company,
            'qrcodeurl' => $qrcodeurl,
            'server_name' => $server_name,
            'AppID'=> $AppID,
            'noncestr'=> $noncestr,
            'url'=> $url,
            'signature'=> $signature,
            'timestamp'=> $timestamp,
        ]);
    }

    public function errorview()
    {
        return view('errors.errorview');
    }


}

