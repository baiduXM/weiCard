<?php

namespace App\Http\Controllers\Common;

use App\Models\Cardcase;
use App\Models\Company;
use App\Models\Employee;
use App\Models\Group;
use App\Models\Link;
use App\Models\Template;
use App\Models\TemplateGroup;
use App\Models\User;
use App\Models\UserFollower;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use function MongoDB\BSON\toJSON;


class HomeController extends Controller
{

    public function __construct()
    {

    }


    public function showQrcode()
    {
        return view('mobile.common.qrcode');
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
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
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
                    'expires_in'   => $expires_in,
                    'update_time'  => $time,
                ]);
            } else {
                $access_token = $row->access_token; //返回查询的token
            }
        } else {
            //如不存在token数据
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
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
                'expires_in'   => $expires_in,
                'update_time'  => $time,
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
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);//执行发送
        $jsoninfo = json_decode($output, true);

        //dd($jsoninfo);
        //$jsapi_ticket = $jsoninfo["ticket"];
        if (isset($jsoninfo["ticket"])) {
            $jsapi_ticket = $jsoninfo["ticket"];
            return $jsapi_ticket;
        } else {
            $AppID = env('WEIXIN_KEY');
            $AppSecret = env('WEIXIN_SECRET');
            $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $AppID . '&secret=' . $AppSecret;
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
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
                'expires_in'   => $expires_in,
                'update_time'  => $time,
            ]);
            $url = sprintf("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi", $access_token);
            //使用crul模拟
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $output = curl_exec($ch);
            curl_close($ch);//执行发送
            $jsoninfo = json_decode($output, true);
            //dd($jsoninfo);
            $jsapi_ticket = $jsoninfo["ticket"];
            return $jsapi_ticket;
        }


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
                $cardcases = Cardcase::where('user_id', Auth::id())
                    ->where('follower_type', $data['type'])
                    ->where('follower_id', $param[1])
                    ->get();
                $count_cardcase = count($cardcases);
                $person = Employee::find($param[1]);
                if (!$person) { // 获取交接人信息
                    $res = $this->getOwner($param[1]);
                    /* 跳转提示页 */
                    // TODO:跳转提示页

                    if (!$res['data']) { // 无交接人，报404
                        return redirect()->back()->with('error', $res['msg']);
                    }
                    $person = $res['data'];
                }
                $templategroup = TemplateGroup::where('id', $person->templategroup_id)->first();
                /* 企业模板使用优先级：员工自主选择>模板组选择>公司选择 */
                /* 查询员工是否自主选择企业模板 */
                if (count($person->templates) > 0) {
                    $templates = $person->templates;//员工自主选择模板的信息
                } else {
                    /* 员工没有自主选择企业模板则查询员工是否使用模板组 */
                    if (count($templategroup) > 0) {
                        $template_id = $templategroup->template_id;
                        $templates = Template::where('id', $template_id)->first();//员工使用模板组的模板信息
                    } else {
                        $templates = $person->templates;
                    }
                }
                if (count($templates) > 0) {
                    if (count($person->templates) > 0) {
                        $template = $templates[0];
                    } else {
                        if (count($templategroup) > 0) {
                            /* 模板组所选模板 */
                            $template = $templates;
                        } else {
                            $template = null;
                        }
                    }
                } else {
                    /* 若员工没有自主选择以及模板组无选择，则使用公司选择模板 */
                    if (count($templates) <= 0) { // 没有员工模板，使用公司模板
                        $templates = Employee::find($person->id)->company->templates;
                    }
                    /* 若公司没有选择模板，则默认企业模板第一套 */
                    if (count($templates) <= 0) { // 没有公司模板，使用默认模板
                        $template = Template::whereIn('type', [0, 2])->first();
                    } else {
                        $template = $templates[0];
                    }
                }
                /* 地图导航地址 */
                $person['map'] = 'http://api.map.baidu.com/marker?location='
                    . $person->company['coordinate_lat'] . ','
                    . $person->company['coordinate_lng'] . '&title=目标位置&content='
                    . $person->company['address'] . '&output=html';
                /* 发票二维码 */
                $invoiceurl = url('invoice/' . $person->company['id']);
//                $qrcodeimg['invoice'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $invoiceurl;
                $targetPath = 'uploads/company/' . $person->company['id'];
                if (!file_exists($targetPath  . "/invoice" . $person->company_id.'.png')) {
                    $this->createQrcode($invoiceurl, $targetPath, ['name' => 'invoice'.$person->company_id]);
                    $qrcodeimg['invoice']=$targetPath . '/invoice' . $person->company_id.'.png';
                }else{
                    $qrcodeimg['invoice']=$targetPath . '/invoice' . $person->company_id.'.png';
                }


                /* 二维码 */
                $targetPath = 'uploads/company/' . $person->company['id'] . '/qrcode';
                if (!file_exists($targetPath . '/' . $person->nickname . $person->number.'.png')) {
                    $this->createQrcode(url('cardview/e-' . $person->id), $targetPath, ['name' => $person->nickname . $person->number]);
                    $qrcodeimg['QRcode']=$targetPath . '/' . $person->nickname . $person->number.'.png';
                }else{
                    $qrcodeimg['QRcode']=$targetPath . '/' . $person->nickname . $person->number.'.png';
                }
//                $url = url('cardview/' . $param[0] . '-' . $person->id);
//                $qrcodeimg['QRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $url;
                /* 二维码名片信息 */
                $title = $person->positions ? $person->positions : ($person->position ? $person->position->name : '');
//                $message =
//                    "BEGIN:VCARD%0A"
//                    . "VERSION:3.0%0A"
//                    . "N:" . $person->nickname . "%0A"
//                    . "TEL;type=CELL;type=pref:" . $person->mobile . "%0A"
//                    . "ORG:" . $person->company->display_name . "%0A"
//                    . "TITLE:" . $title . "%0A"
//                    . "EMAIL:" . $person->email . "%0A"
//                    . "URL:" . url('cardview/' . $param[0] . '-' . $person->id) . "%0A"
//                    . "NOTE:来自G宝盆名片.%0A"
//                    . "END:VCARD";

//                $qrcodeimg['mpQRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $message;
                $display_name = $person->company->display_name;
                $mpurl = url('cardview/e-' . $person->id);
                $message =
                    "BEGIN:VCARD%0A
                    VERSION:3.0%0A
                    N:$person->nickname
                    TEL;type=CELL;type=pref:$person->mobile
                    ORG:$display_name
                    TITLE:$title
                    EMAIL: $person->email
                    URL: $mpurl
                    NOTE:来自G宝盆名片
                    END:VCARD";
                $targetPath = 'uploads/company/' . $person->company['id'] . '/messsage' ;
                if (!file_exists($targetPath . '/message' . $person->id . $person->number.'.png')) {
                    $this->createQrcode($message,$targetPath ,['name' => 'message' .$person->id . $person->number]);
                    $qrcodeimg['mpQRcode']=$targetPath . '/message' . $person->id . $person->number.'.png';
                }else{
                    $qrcodeimg['mpQRcode']=$targetPath . '/message' . $person->id . $person->number.'.png';
                }
                //底部link
                // dd($person->company['id']);
                $link = $person->company->links;
                //底部-一键拨号
                $link_phone = $link->where('default_link', 'phone');
                if (count($link_phone) <= 0) {
                    $phone_input = [
                        'company_id' => $person->company['id'],
                        'link_name' => '一键拨号',
                        'link_url' => 'javascript:;',
                        'link_img' => '&#xe644',
                        'class' => 'mp-tel-btn same animated fadeInLeftBig go',
                        'class_id' => '',
                        'sort' => '1',
                        'is_open' => '1',
                        'default_link' => 'phone',
                    ];
                    $input_phone = Link::create($phone_input);
                    $person = Employee::find($param[1]);
                }
                //底部-名片夹
                $link_cardcase = $link->where('default_link', 'cardcase');
                if (count($link_cardcase) <= 0) {
                    $phone_input = [
                        'company_id' => $person->company['id'],
                        'link_name' => '名片夹',
                        'link_url' => '',
                        'link_img' => '&#xe617',
                        'class' => 'name same animated fadeInLeftBig go',
                        'class_id' => '',
                        'sort' => '2',
                        'is_open' => '1',
                        'default_link' => 'cardcase',
                    ];
                    $input_cardcase = Link::create($phone_input);
                    $person = Employee::find($param[1]);
                }
                //底部-关注
                $link_follow = $link->where('default_link', 'follow');
                if (count($link_follow) <= 0) {
                    $phone_input = [
                        'company_id' => $person->company['id'],
                        'link_name' => '关注',
                        'link_url' => '',
                        'link_img' => '&#xe642',
                        'class' => 'mp-follow-btn follow same animated fadeInRightBig go',
                        'class_id' => 'done',
                        'sort' => '3',
                        'is_open' => '1',
                        'default_link' => 'follow',
                    ];
                    $input_follow = Link::create($phone_input);
                    $person = Employee::find($param[1]);
                }
                //底部-发票信息
                $link_invoice = $link->where('default_link', 'invoice');
                if (count($link_invoice) <= 0) {
                    $phone_input = [
                        'company_id' => $person->company['id'],
                        'link_name' => '发票信息',
                        'link_url' => 'javascript:;',
                        'link_img' => '&#xe6d0',
                        'class' => 'same animated fadeInRightBig qy-mess-btn',
                        'class_id' => '',
                        'sort' => '4',
                        'is_open' => '1',
                        'default_link' => 'invoice',
                    ];
                    $input_invoice = Link::create($phone_input);
                    $person = Employee::find($param[1]);
                }
                //底部-留言板
                $link_message = $link->where('default_link', 'message');
                if (count($link_message) <= 0) {
                    $phone_input = [
                        'company_id' => $person->company['id'],
                        'link_name' => '留言板',
                        'link_url' => 'javascript:;',
                        'link_img' => '&#xe63d',
                        'class' => '',
                        'class_id' => '',
                        'sort' => '5',
                        'is_open' => '1',
                        'default_link' => 'message',
                    ];
                    $input_message = Link::create($phone_input);
                    $person = Employee::find($param[1]);
                }
                //$link_phone = Link::where('company_id',"=",$person->company['id'])->where('default_link',"=",'phone')->get();
                $top_link = Link::where('company_id',"=",$person->company['id'])->orderBy('sort','asc')->take(4)->get();
                $top_ids = Link::where('company_id',"=",$person->company['id'])->orderBy('sort','asc')->take(4)->pluck('id');
                $left_link =Link::where('company_id',"=",$person->company['id'])->orderBy('sort','asc')->whereNotIn('id', $top_ids)->get();
                //dd($left_link);
                break;
            case 'u':
                $data['type'] = 'App\Models\User';
                $cardcases = Cardcase::where('user_id', Auth::id())
                    ->where('follower_type', $data['type'])
                    ->where('follower_id', $param[1])
                    ->get();
                $count_cardcase = count($cardcases);
                //dd($count_cardcase);
                $person = User::find($param[1]);
//               dd($person->company->id);
                    if(count($person->address)<= 0 ){
                        $person->address = '尚未填写';
                    }
                $templates = $person->templates;
                if (count($templates) <= 0) { // 没有个人模板，使用默认模板
                    $template = Template::whereIn('type', [0, 1])->first();
                } else {
                    $template = $templates[0];
                }
                /* 二维码 */
                $targetPath = 'uploads/user/' . $person->id ;
                if (!file_exists($targetPath . '/' . $person->id . $person->name.'.png')) {
                    $this->createQrcode(url('cardview/u-' . $person->id), $targetPath, ['name' => $person->id . $person->name]);
                    $qrcodeimg['QRcode']=$targetPath . '/' . $person->id . $person->name.'.png';
                }else{
                    $qrcodeimg['QRcode']=$targetPath . '/' . $person->id . $person->name.'.png';
                }

//                if(count($person->qrcode_path)>0){
//                    $qrcodeimg['QRcode']=$person->qrcode_path;
//                }else{
//                    $user = User::find($param[1]);
//                    $user->qrcode_path = $this->createQrcode(url('cardview/' . $param[0] . '-' . $user->id), 'uploads/user/'.$user->id);
//                    $user->save();
//                    $user = User::find($param[1]);
//                    $qrcodeimg['QRcode']=$user->qrcode_path;
//                }

                /* 二维码名片信息 */
//                $message =
//                    "BEGIN:VCARD%0A"
//                    . "VERSION:3.0%0A"
//                    . "N:" . $person->nickname . "%0A"
//                    . "TEL;type=CELL;type=pref:" . $person->mobile . "%0A"
//                    . "EMAIL:" . $person->email . "%0A"
//                    . "URL:" . url('cardview/' . $param[0] . '-' . $person->id) . "%0A"
//                    . "NOTE:来自G宝盆名片.%0A"
//                    . "END:VCARD";
                $mpurl = url('cardview/u-' . $person->id);
                $message =
                    "BEGIN:VCARD%0A
                    VERSION:3.0%0A
                    N:$person->nickname
                    TEL;type=CELL;type=pref:$person->mobile
                    EMAIL: $person->email 
                    URL: $mpurl
                    NOTE:来自G宝盆名片
                    END:VCARD";
                $targetPath = 'uploads/user/' . $person->id .'/message' ;
                if (!file_exists($targetPath . '/message' . $person->id . $person->name.'.png')) {
                    $this->createQrcode($message,$targetPath ,['name' => 'message' .$person->id . $person->name]);
                    $qrcodeimg['mpQRcode']=$targetPath . '/message' . $person->id . $person->name.'.png';
                }else{
                    $qrcodeimg['mpQRcode']=$targetPath . '/message' . $person->id . $person->name.'.png';
                }
//                $qrcodeimg['mpQRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $message;
                $top_link ='';
                $left_link='';
                break;
            default:
                break;
        }
        /* 获取分享js-api参数 */
        $sign_package = $this->getSignPackage();
        /* 二维码 */
//        $url = url('cardview/' . $param[0] . '-' . $person->id);
//        $qrcodeimg['QRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $url;
        if (!$template) {
            return redirect()->route('errorview')->with('com', '$com');
        }
//        $qrcodeimg['mpQRcode'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $message;

        //dd($person->company->links);
        return view($template->name . '.index')->with([
            'template'       => $template, // 模板数据
            'person'         => $person, // 对象，用户/员工
            'type'           => $param[0], // 类型
            'qrcodeimg'      => $qrcodeimg, // 二维码图片
            'sign_package'   => $sign_package, // 微信签名包
            'count_cardcase' => $count_cardcase, // 是否关注
            'top_link'       => $top_link, // 企业版底部导航
            'left_link'      => $left_link, // 底部
        ]);
    }

    /* 发票信息 */

    public function invoice($params)
    {
        $id = $params;
        $company = Company::find($id);
        return view('common.invoice')->with([
            'company' => $company, // 公司数据
        ]);
    }


    /* 公司信息 */
    public function companyinfo($params)
    {

        $id = $params;
        $company = Company::find($id);
        /* 二维码 */
        $url = url('invoice/' . $id);
        $qrcodeimg['invoice'] = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $url;
        //dd($company);
        return view('common.companyinfo')->with([
            'company'   => $company, // 公司数据
            'qrcodeimg' => $qrcodeimg, // 二维码图片
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
     * @return mixed 分组数组
     */
    public function getGroups($user_id)
    {
        $groups = Group::where('user_id', $user_id)->select('id', 'name', 'order')->get()->toArray();
        $group = array(
            'id'    => 0,
            'name'  => '默认分组',
            'order' => 0,
        );
        array_unshift($groups, $group); // 将默认数组加入到$groups中
        return $groups;
    }

    /**
     * 移动分组
     *
     * @param array $params 数组参数
     */
    public function moveGroup(array $params)
    {
        $default = $this->getDefaultGroup();

        $user_id = isset($params['follower_id']) ? $params['follower_id'] : Auth::id(); // 用户ID，必填
        $followed_id = isset($params['followed_id']) ? $params['followed_id'] : null; // 关注用户ID，可选|删除分组可为空，移动分组需要
        $group_id = isset($params['group_id']) ? $params['group_id'] : null; // 当前分组ID，可选|删除分组需要，移动分组可为空
        $to_group_id = isset($params['to_group_id']) ? $params['to_group_id'] : $default->id; // 移动目标分组，必填|删除分组可为默认，移动分组需要
        if ($followed_id) { // 移动分组
            $res = UserFollower::where('follower_id', $user_id)
                ->where('followed_id', $followed_id)
                ->first();
            $res->group_id = $to_group_id;
            $res = $res->save();
        }
        if ($group_id) { // 删除分组
            $res = UserFollower::where('follower_id', $user_id)
                ->where('group_id', $group_id)
                ->update(['group_id' => $to_group_id]);
        }
        return $res;
    }

    public function getDefaultGroup()
    {
        return Group::where('user_id', null)->where('name', '默认组')->first();
    }

    /**
     * 将ip地址转换成int型
     *
     * @param $ip  ip地址
     * @return number 返回数值
     */
    function get_iplong($ip)
    {
        //bindec(decbin(ip2long('这里填ip地址')));
        //ip2long();的意思是将IP地址转换成整型 ，
        //之所以要decbin和bindec一下是为了防止IP数值过大int型存储不了出现负数。
        return bindec(decbin(ip2long($ip)));
    }


    /**
     * 获取交接人信息
     *
     * @param int $id 员工ID
     * @return mixed 返回交接人信息
     */
    public function getOwner($id)
    {
        $employee = Employee::withTrashed()->with('department')->where('id', $id)->first();
        if (!$employee) {
            return array( // 后续跳转个人名片
                'msg'  => '员工不存在',
                'data' => null,
            );
        }
        /* 员工未归属部门or所在部门未设置交接人 */
        if (!$employee->department || !$employee->department->owner) { // 无公司管理员
            /* 续跳公司管理员个人名片 */
            return array(
                'msg'  => '员工已离职',
                'data' => null,
            );
        }
        return array(
            'msg'  => '员工已离职，跳转交接人名片',
            'data' => $employee->department->owner,
        );

    }


}

