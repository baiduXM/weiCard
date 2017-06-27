<?php

namespace App\Http\Controllers\Common;

use App\Models\Cardcase;
use App\Models\Employee;
use App\Models\Group;
use App\Models\Template;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class HomeController extends Controller
{
    public $is_owner = false; // 是否公司老板

    public function __construct()
    {

    }


    /**
     * 判断是否是公司管理人员
     *
     * @return bool
     */
    public function isCompanyOwner()
    {
        if (Auth::user()->company) {
            $this->is_owner = true;
        }
        return $this->is_owner ? true : false;
    }



    /* 微信分享JS-API */
    //获取微信公众号access_token
    public function wx_get_token()
    {
        $AppID = env('WEIXIN_KEY');
        $AppSecret = env('WEIXIN_SECRET');
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $AppID . '&secret=' . $AppSecret;
        $token = DB::table('token')->get();
        //查询数据库是否存在token数据
        if ($token)//如果存在token数据
        {
            $row = DB::table('token')->first();
            $righttime = time();
            if ($row->expires_in + $row->update_time < $righttime)//如果token数据过期
            {
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                $output = curl_exec($ch);
                curl_close($ch);//执行发送
                $jsoninfo = json_decode($output, true);
                $access_token = $jsoninfo["access_token"];
                //更新的token
                $expires_in = '300';
                $time = time();
                //将更新的access_token存入数据库
                DB::table('token')->update([
                    'access_token' => $access_token,
                    'expires_in' => $expires_in,
                    'update_time' => $time,
                ]);
            } else {
                $access_token = $row->access_token; //返回查询的token
            }
        } else {
            //如不存在token数据
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $output = curl_exec($ch);
            curl_close($ch);//执行发送
            $jsoninfo = json_decode($output, true);
            $access_token = $jsoninfo["access_token"];//返回新建的token
            $expires_in = '300';
            $time = time();
            //将新建的access_token存入数据库
            DB::table('token')->insert([
                'access_token' => $access_token,
                'expires_in' => $expires_in,
                'update_time' => $time,
            ]);
        }
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
        //dd($jsoninfo);
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
     *
     * @return $this|\Illuminate\Http\RedirectResponse
     */
    public function cardview($params)
    {
        /* 获取参数 */
        $param = explode('-', $params);
//        $type = $param[0] == 'e' ? 'App\Models\Employee' : 'App\Models\User';
//        $cardcases = Cardcase::where('user_id', Auth::id())
//            ->where('follower_type', $type)
//            ->where('follower_id', $param[1])
//            ->get();
//        dd(count($cardcases));
        switch ($param[0]) {
            case 'e':
                $data['type'] = 'App\Models\Employee';
                $cardcases = Cardcase::where('user_id', Auth::id())
                    ->where('follower_type', $data['type'])
                    ->where('follower_id', $param[1])
                    ->get();
                $count_cardcase=count($cardcases);
                //dd($count_cardcase);

                $person = Employee::find($param[1]);
                $templates = $person->templates;
                if (count($templates) <= 0) { // 没有员工模板，使用公司模板
                    $templates = Employee::find($param[1])->company->templates;
                }
                if (count($templates) <= 0) { // 没有公司模板，使用默认模板
                    $template = Template::whereIn('type', [0, 2])->first();
                } else {
                    $template = $templates[0];
                }
                /* 地图导航地址 */
                $person['map'] = 'http://api.map.baidu.com/marker?location='
                    . $person->company['coordinate_lat'] . ','
                    . $person->company['coordinate_lng'] . '&title=目标位置&content='
                    . $person->company['address'] . '&output=html';
                /* 二维码名片信息 */
                if (count($person->position_id) <= 0) { // 判断职位是否为空
                    $title = '';
                } else {
                    $title = $person->position->name;
                }
                $message =
                    "BEGIN:VCARD%0A"
                    . "VERSION:3.0%0A"
                    . "N:" . $person->nickname . "%0A"
                    . "TEL;type=CELL;type=pref:" . $person->mobile . "%0A"
                    . "ORG:" . $person->company->display_name . "%0A"
                    . "TITLE:" . $title . "%0A"
                    . "EMAIL:" . $person->email . "%0A"
                    . "URL:" . url('cardview/' . $param[0] . '-' . $person->id) . "%0A"
                    . "NOTE:来自G宝盆名片.%0A"
                    . "END:VCARD";
                break;
            case 'u':
                $data['type'] = 'App\Models\User';
                $cardcases = Cardcase::where('user_id', Auth::id())
                    ->where('follower_type', $data['type'])
                    ->where('follower_id', $param[1])
                    ->get();
                $count_cardcase=count($cardcases);
                //dd($count_cardcase);
                $person = User::find($param[1]);
                $templates = $person->templates;
                if (count($templates) <= 0) { // 没有个人模板，使用默认模板
                    $template = Template::whereIn('type', [0, 1])->first();
                } else {
                    $template = $templates[0];
                }
                /* 二维码名片信息 */
                $message =
                    "BEGIN:VCARD%0A"
                    . "VERSION:3.0%0A"
                    . "N:" . $person->nickname . "%0A"
                    . "TEL;type=CELL;type=pref:" . $person->mobile . "%0A"
                    . "EMAIL:" . $person->email . "%0A"
                    . "URL:" . url('cardview/' . $param[0] . '-' . $person->id) . "%0A"
                    . "NOTE:来自G宝盆名片.%0A"
                    . "END:VCARD";
                break;
            default:
                break;
        }
        /* 获取分享js-api参数 */
        $sign_package = $this->getSignPackage();
//        $sign_package = array(
//            "AppID" => "wx80cfbb9a1b347f47",
//            "timestamp" => time(),
//            "noncestr" => "Wm3WZYTPz0wzccnW",
//            "jsapi_ticket" => "kgt8ON7yVITDhtdwci0qeUk5Ue2owadlxSNoqP5FXpiaJXd1Ij1ITsYew5Q_2Rv3TaiKSZqTCEA262Jb4_o3GQ",
//            "url" => "http://weicard.example.com/cardcase/show/e",
//            "signature" => "82866806f6df43458e6277c1a5d1b8053e37bf12",
//        );
//        dump($sign_package);
        /* 二维码 */
        $url = url('cardview/' . $param[0] . '-' . $person->id);
        $qrcodeimg['QRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $url;
        if (!$template) {
            return redirect()->route('errorview')->with('com', '$com');
        }
        $qrcodeimg['mpQRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $message;

        //dd($person->company->links);
        return view($template->name . '.index')->with([
            'template' => $template, // 模板数据
            'person' => $person, // 对象，用户/员工
            'type' => $param[0], // 类型
            'qrcodeimg' => $qrcodeimg, // 二维码图片
            'sign_package' => $sign_package, // 微信签名包
            'count_cardcase'=> $count_cardcase, // 是否关注
        ]);
    }

    public function errorview()
    {
        return view('errors.errorview');
    }

    /**
     * 获取用户分组
     *
     * @param int $user_id 用户ID
     *
     * @return mixed 分组数组
     */
    public function getGroups($user_id)
    {
        $groups = Group::where('user_id', $user_id)->select('id', 'name', 'order')->get()->toArray();
        $group = array(
            'id' => 0,
            'name' => '默认分组',
            'order' => 0,
        );
        array_unshift($groups, $group); // 将默认数组加入到$groups中
        return $groups;
    }
}

