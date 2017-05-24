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
//        return redirect('');
        return view('home.index');
    }

    /* 微信分享JS-API */
    //获取微信公众号access_token
    public function wx_get_token()
    {
        $AppID = env('WEIXIN_KEY');
        $AppSecret = env('WEIXIN_SECRET');
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $AppID . '&secret=' . $AppSecret;
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
    public function wx_get_jsapi_ticket()
    {
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
    public function getSignPackage()
    {
        $wx = array();
        $wx['AppID'] = env('WEIXIN_KEY');
        //生成签名的时间戳
        $wx['timestamp'] = time();
        //生成签名的随机串
        $wx['noncestr'] = 'Wm3WZYTPz0wzccnW';
        //jsapi_ticket是公众号用于调用微信JS接口的临时票据。正常情况下，jsapi_ticket的有效期为7200秒，通过access_token来获取。
        $wx['jsapi_ticket'] = $this->wx_get_jsapi_ticket();
        //分享的地址，注意：这里是指当前网页的URL，不包含#及其后面部分
        $wx['url'] = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
        $string = sprintf("jsapi_ticket=%s&noncestr=%s&timestamp=%s&url=%s", $wx['jsapi_ticket'], $wx['noncestr'], $wx['timestamp'], $wx['url']);
        //生成签名
        $wx['signature'] = sha1($string);
        return $wx;
    }
    /* 微信分享JS-API */

    /**
     * 名片预览展示
     *
     * @param $params 类型-ID，u-个人，e-员工，
     * @return $this|\Illuminate\Http\RedirectResponse
     */
    public function cardview($params)
    {
        /* 获取参数 */
        $param = explode('-', $params);
        switch ($param[0]) {
            case 'e':
                $data['type'] = 'App\Models\Employee';
                $person = Employee::find($param[1]);
                $templates = $person->templates;
                if (count($templates) <= 0) { // 没有员工模板，使用公司模板
                    $templates = Employee::find($param[1])->company->templates;
                }
                if (count($templates) <= 0) { // 没有公司模板，使用默认模板
                    $template = Template::where('type', '!=', 1)->first();
                } else {
                    $template = $templates[0];
                }
                break;
            case 'u':
                $data['type'] = 'App\Models\User';
                $person = User::find($param[1]);
                $templates = $person->templates;
                if (count($templates) <= 0) { // 没有个人模板，使用默认模板
                    $template = Template::where('type', '!=', 2)->first();
                } else {
                    $template = $templates[0];
                }
                break;
            default:
                break;
        }
        $geturl = URL::current();
        $server_name = $_SERVER['SERVER_NAME'];
        /* 获取分享js-api参数 */
        $sign_package = $this->getSignPackage();
        $AppID = $sign_package['AppID'];
        $timestamp = $sign_package['timestamp'];
        $noncestr = $sign_package['noncestr'];
        $signature = $sign_package['signature'];
//        $jsapi_ticket = $sign_package['jsapi_ticket'];

        /* 二维码 */
        $qrcodeurl['QRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $geturl;
        if (!$template) {
            return redirect()->route('errorview')->with('com', '$com');
        }
        /* 二维码名片信息 */
//        $message = "BEGIN:VCARD%0AVERSION:3.0%0AN:" . $employee->name. "%0ALOGO;VALUE=:http://" . $server_name . "/" . $company->logo . "%0ATEL;type=CELL;type=pref:" . $employee->mobile . "%0AADR;type=WORK;type=pref:" . $company->address . "%0AORG:" . $company->name . "%0ATITLE:" . $employee->title . "%0ANOTE:来自G宝盆名片.%0AEND:VCARD";
        $message = "BEGIN:VCARD%0A"
            . "VERSION:3.0%0A"
            . "N:" . $person->name . "%0A"
//            . "LOGO;VALUE=:" . $person->avatar . "%0A"
            . "TEL;type=CELL;type=pref:" . $person->mobile . "%0A"
//            . "ADR;type=WORK;type=pref:" . $person->address . "%0A"
//            . "ORG:" . $person->company->name . "%0A"
//            . "TITLE:ceshi%0A"
            . "NOTE:来自G宝盆名片.%0A"
            . "END:VCARD";
        //dd($message);
        $qrcodeurl['mpQRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $message;
        return view($template->name . '.index')->with([
            'template' => $template,
            'person' => $person,
            'type' => $param[0],
//            'employee' => $employee,
//            'company' => $company,
            'qrcodeurl' => $qrcodeurl,
            'server_name' => $server_name,
            'AppID' => $AppID,
            'noncestr' => $noncestr,
            'signature' => $signature,
            'timestamp' => $timestamp,
        ]);
    }

    public function errorview()
    {
        return view('errors.errorview');
    }

    private function wechatShare()
    {

    }


}

