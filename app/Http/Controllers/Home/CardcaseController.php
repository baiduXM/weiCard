<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Cardcase;
use App\Models\Employee;
use App\Models\Group;
use App\Models\User;
use App\Models\UserFollower;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;


class CardcaseController extends HomeController
{

    public function __construct()
    {
        $this->isMobile();
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('cardcase', function ($breadcrumbs) {
            $breadcrumbs->push('名片夹', route('cardcase.index'));
        });
    }


    /**
     * 消息列表
     */
    public function index()
    {
        // TODO:后期优化分页
        if ($this->is_mobile) {
            $groups = Group::where('user_id', Auth::id())->get();
            return view('mobile.cardcase.gz-index')->with([
                'groups' => $groups,

            ]);
        } else {
            $cardcases = Cardcase::with('follower')->where('user_id', Auth::id())->paginate();
            return view('web.cardcase.index')->with([
                'cardcases' => $cardcases,
            ]);
        }
    }

    public function mp()
    {
        if ($this->is_mobile) {
            $groups = Group::where('user_id', Auth::id())->get();
            return view('mobile.cardcase.mp-index')->with([
                'groups' => $groups,
            ]);
        }
//        $this->getFollowerAjax($request);
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function mpAjax(Request $request)
    {
        if ($request->ajax()) {
            /* 获取分组 */
            $groups = Auth::user()->groups()->orderBy('id', 'desc')->get();
            $default = Group::find(0);
//            $default->id = null;
            $default->user_id = Auth::id();
            $groups->prepend($default); // prepend() 添加数据项到集合开头
            foreach ($groups as $group) {
                $group->count = $group->followers()->where('follower_id', Auth::id())->has('followed')->count(); // has('followed') 判断用户是否存在
            }
            return response()->json(['err' => 0, 'msg' => 'success', 'data' => $groups]);
        }
    }


    /* 根据分组获取用户 */
    public function getFollowerAjax(Request $request)
    {
        if ($request->ajax()) {
            $group_id = $request->input('group_id') or null; // id
            if ($group_id) {
                $followers = UserFollower::with('followed', 'employee')->has('followed')
                    ->where('follower_id', Auth::id())
                    ->where('group_id', $group_id)
                    ->get();
            } else {
                $followers = UserFollower::with('followed', 'employee')->has('followed')
                    ->where('follower_id', Auth::id())
                    ->where('group_id', $group_id)
                    ->orWhere('group_id', null)
                    ->get();
            }
            foreach ($followers as $follower) {
                $follower->avatar = asset($follower->followed->avatar);
                $follower->company = $follower->employee ? $follower->employee->company : null;
            }
            return response()->json(['err' => 0, 'msg' => 'success', 'data' => $followers]);
        }
    }

//    public function getFollower($group_id = null)
//    {
////        $group_id = $request->input('group_id') ? $request->input('group_id') : null; // id
//        $followers = UserFollower::has('followed')->where('follower_id', Auth::id())->where('group_id', $group_id)->get();
//        return $followers;
////        return response()->json(['err' => 0, 'msg' => 'success', 'data' => $followers]);
//    }


    /**
     * 名片夹首页 - 移动端
     *
     * @return array|mixed 返回数据
     */
    public function index4Mobile()
    {
        /* 排序方式 */
        $sort = Input::query('sort') ? Input::query('sort') : 'group';
        /* 排序顺序 */
//        $order = $request->input('order') ? $request->input('order') : 'asc';

        $cardcases = Cardcase::with('group', 'follower')->where('user_id', Auth::id())->get()->toArray();
        if (count($cardcases) > 0) {
            $cardcases = $this->getPinyin($cardcases);
        }
        if ($sort == 'group') {
            $field = 'order';
            $groups = $this->getGroups(Auth::id());
            if (count($groups) > 0) {
                $groups = $this->sortArray($groups, $field);
                foreach ($groups as $k => &$v) {
                    if (count($cardcases) > 0) {
                        foreach ($cardcases as $ck => $vk) {
                            if ($v['id'] == $vk['group_id']) {
                                $v['cardcases'][] = $vk;
                            }
                        }
                    }
                    if (!isset($v['cardcases'])) {
                        $v['cardcases'] = array();
                    }
                }
            }
            $data = $groups;

        } elseif ($sort == 'alphabet') {
            $alph = range('A', 'Z');
            foreach ($alph as $k => $v) {
                $groups[$v] = array(
                    'id'        => $k,
                    'name'      => $v,
                    'cardcases' => array(),
                );
            }
            foreach ($cardcases as $k => $v) {
                $groups[strtoupper(substr($v['follower']['pinyin'], 0, 1))]['cardcases'][] = $v;
            }
            foreach ($groups as $k => $v) {
                if (count($v['cardcases']) <= 0) {
                    unset($groups[$k]);
                }
            }
            $data = $groups;
        } elseif ($sort == 'time') {
            // TODO:时间排序怎么分组

        }
        return $data;


    }

    /**
     * 字符串转拼音
     *
     * @param array $data
     * @return mixed
     */
    private function getPinyin($data)
    {
        if (is_array($data)) {
            foreach ($data as $k => &$v) {
                $nickname = $v['follower']['nickname'];
                $v['follower']['pinyin'] = $this->pinyin($nickname) . ' ' . $this->pinyin($nickname, 'abbr');
            }
        } else {
            foreach ($data as $k => &$v) {
                if (isset($v->follower)) {
                    $nickname = $v->follower->nickname;
                    $v->follower->pinyin = $this->pinyin($nickname) . ' ' . $this->pinyin($nickname, 'abbr');
                }
            }
        }
        return $data;
    }


    /**
     * 收藏/取消收藏
     *
     * @param Request $request
     * @param         $params   类型-ID
     * @return \Illuminate\Http\RedirectResponse
     */
    public function follow(Request $request, $params)
    {
        /* 获取参数 */
        $param = explode('-', $params);

        /* add */
        if ($param[0] == 'u') {
            $user_id = $param[1];
        } else {
            $employee = Employee::find($param[1]);
            $user_id = $employee->user_id;
        }

        if (Auth::id() == $user_id) {
            return response()->json(array('err' => 1, 'msg' => '不能关注自己'));
        }
        if (Auth::user()->isFollow($user_id)) {
            return response()->json(array('err' => 1, 'msg' => '已关注'));
        }
        if (Auth::user()->followThisUser($user_id)) {
//                $follower = UserFollower::where('follower_id', $user_id)->first();
//                $follower->group_id = $group_id;
//                $follower->save();
            return response()->json(array('err' => 0, 'msg' => '关注成功'));
        }

        /* add-end */


        /* 无法关注自己 */
        if ($param[0] == 'e') {
            if (Auth::user()->employee) {
                if ($param[1] == Auth::user()->employee->id) {
                    $err_msg = '不能关注自己';
                }
            }
        } elseif ($param[0] == 'u') {
            if ($param[1] == Auth::id()) {
                $err_msg = '不能关注自己';
            }
        }

        if (isset($err_msg)) {
            if ($request->ajax()) {
                return response()->json($err_msg);
            } else {
                return redirect('cardcase')->with('info', $err_msg);
            }
        }

        switch ($param[0]) {
            case 'e':
                $data['follower_type'] = 'App\Models\Employee';
                break;
            case 'u':
                $data['follower_type'] = 'App\Models\User';
                break;
            default:
                break;
        }
        $data['follower_id'] = $param[1];
        $data['user_id'] = Auth::id();

        /* 查看数据库是否有数据 */
        $query = Cardcase::query();
        foreach ($data as $key => $value) {
            $query->where($key, $value);
        }
        $cardcase = $query->first();
        if ($cardcase) {
            $err_msg = '已关注';
        } else { // 无，收藏
            if (Cardcase::create($data)) {
                $err_msg = '关注成功';
            }
        }


        /* ajax收藏 */
        if ($request->ajax()) {
            return response()->json($err_msg);
        } else {
            return redirect('cardcase')->with('info', $err_msg);
        }

    }


    /**
     * 取消关注
     *
     * @param Request $request
     * @param         $params
     * @return \Illuminate\Http\RedirectResponse
     */
    public function unfollow(Request $request, $params)
    {
        /* 获取参数 */
        $param = explode('-', $params);
        switch ($param[0]) {
            case 'e':
                $data['follower_type'] = 'App\Models\Employee';
                break;
            case 'u':
                $data['follower_type'] = 'App\Models\User';
                break;
            default:
                break;
        }
        $data['follower_id'] = $param[1];
        $data['user_id'] = Auth::id();

        /* 查看数据库是否有数据 */
        $query = Cardcase::query();
        foreach ($data as $key => $value) {
            $query->where($key, $value);
        }
        $cardcase = $query->first();
        /* ajax收藏 */
        if ($cardcase) { // 有，删除
            if ($cardcase->delete()) {
                $err_msg = '取消关注成功';
            } else {
                $err_msg = '取消关注失败';
            }
        } else {
            $err_msg = '取消关注失败 - 未关注';
        }
        if ($request->ajax()) {
            return response()->json($err_msg);
        } else {
            return redirect('cardcase')->with('info', $err_msg);

        }
    }


    public function create()
    {

        return view('admin.cardcase.create')->with([
        ]);

    }

    public function store(Request $request)
    {

    }

    /**
     * 展示名片
     *
     * @param string $type 名片类型，u-个人，e-员工，c-公司
     * @return $this|\Illuminate\Http\RedirectResponse
     */
    public function show($type = 'u')
    {
        if ($type == 'e') {
            if (Auth::user()->employee) {
                $type = 'e';
                $id = Auth::user()->employee->id;
                $param = $type . '-' . $id;
            }
        } elseif ($type == 'u') {
            $param = $type . '-' . Auth::id();
        }
        if (isset($param)) {
            return $this->cardview($param);
        }
        return redirect('company/employee');
    }

    public function showuser($user_id)
    {
        $user = User::find($user_id);
        if ($user->employee) {
            $param = 'e-' . $user->employee->id;
        } else {
            $param = 'u-' . $user_id;
        }
        if (isset($param)) {
            return $this->cardview($param);
        }
        return redirect('company/employee');
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function ajaxShow(Request $request)
    {
        if ($request->ajax()) {

        }
        /* 删除/编辑后跳回主页 */
        return redirect()->route('cardcase.index');

    }

    public function edit($id)
    {
        return view('admin.cardcase.edit')->with([]);
    }

    public function update(Request $request, $id)
    {

    }


    /**
     * 删除名片/取消关注
     *
     * @param Request $request
     * @param         $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Request $request, $id)
    {
        $cardcase = Cardcase::find($id);
        if ($cardcase) {
            if ($cardcase->delete()) {
                if ($request->ajax()) {
                    return response()->json(['err' => 0, 'msg' => '删除成功', 'data' => url('cardcase')]);
//                    return response()->json('删除成功');
                }
                return redirect()->route('cardcase.index')->with('success', '删除成功');
            }
        }
        if ($request->ajax()) {
            return response()->json('删除失败');
        }
        return redirect()->route('cardcase.index')->with('error', '删除失败，无数据');
    }

    public function batchDestroy(Request $request)
    {
        $ids = explode(',', $request->input('ids'));
        $res = Cardcase::whereIn('id', $ids)->delete();
        if ($res) {
            if ($request->ajax()) {
                return response()->json('删除成功');
            }
            return redirect()->route('cardcase.index')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            if ($request->ajax()) {
                return response()->json('删除失败');
            }
            return redirect()->route('cardcase.index')->with('error', '删除失败');
        }
    }

    public function cardshow($id)
    {
        $employee = Employee::with('company', 'department', 'user')->find($id);
        return $employee;
    }


    /**
     * 移动分组
     *
     * @param Request $request
     * @param int     $id 名片ID
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function move(Request $request, $id = 0)
    {
        if ($request->ajax()) {
            $group_id = $request->input('group_id');
            $cardcase = Cardcase::find($id);
            $cardcase->group_id = $group_id == 0 ? null : $group_id;
            if ($cardcase->save()) {
                return response()->json(['err' => 0, 'msg' => '移动成功', 'data' => url('cardcase')]);
            }
        }
//        return redirect()->route('cardcase.index');
    }

    public function moveAjax(Request $request, $id)
    {
        if ($request->ajax()) {
            $group_id = $request->input('group_id');
            $cardcase = Cardcase::find($id);
            $cardcase->group_id = $group_id == 0 ? null : $group_id;
            if ($cardcase->save()) {
                return response()->json(['err' => 0, 'msg' => '移动成功', 'data' => url('cardcase')]);
            }
        }
    }

    public function fans(Request $request, $type = null)
    {
        $followIds = Auth::user()->followings()->pluck('id')->toArray(); // 我关注的用户ID数组
        $fanIds = Auth::user()->fans()->pluck('id')->toArray(); // 我关注的用户ID数组
        if (!$type) {
            $ids = array_unique(array_merge($followIds, $fanIds));
            $fans = User::with('employee')->whereIn('id', $ids)->paginate();

        } else {
            if (!$type || $type == 'followed') { // 被关注，粉丝
                $fans = Auth::user()->fans();
            }
            if ($type == 'following') { // 关注的人
                $fans = Auth::user()->followings();
            }
            if ($type == 'together') { // 相互关注
                $fans = Auth::user()->fans()->whereIn('follower_id', $followIds);
            }
            $fans = $fans->with('employee')->orderBy('created_at', 'desc')->paginate(); // 关注我的人（粉丝）
        }
        foreach ($fans as &$item) {
            $item->avatar = asset($item->avatar);
            $item->company = $item->employee ? $item->employee->company : null;
            $item->isFollow = Auth::user()->isFollow($item->id); // 我是否关注
            $item->isFollowMe = $item->isFollow(Auth::id()); // 是否关注我
        }

        if ($request->ajax()) {
            $jsonArray = array('err' => 0, 'msg' => '粉丝列表', 'data' => array(
                'fans' => $fans,
            ));
            return response()->json($jsonArray);
        }
        return view('mobile.cardcase.fans')->with([
            'fans' => $fans,
        ]);
    }

    /**
     * (临时) 收藏的名片夹添加到关注列表
     * 遍历名片夹中收藏的名片，加到关注列表
     */
    protected function cardcase2follow($id = null)
    {
//        $user = $id ? User::find($id) : Auth::user(); // 用户对象
//        $cardcases = $user->cardcases;
        $cardcases = Cardcase::get();
        $stat['count'] = 0;
        $stat['attach'] = 0;
        $stat['detach'] = 0;
        foreach ($cardcases as $cardcase) {
            if ($cardcase->follower_type == 'App\Models\User') {
                $id = $cardcase->follower ? $cardcase->follower->id : null;
            }
            if ($cardcase->follower_type == 'App\Models\Employee') {
                $id = $cardcase->follower ? $cardcase->follower->user_id : null;
            }
            if ($id) {
                $user = $cardcase->user;
                $res = $user->followThisUser($id);
                if ($res) {
                    if ($res > 0) {
                        $stat['attach']++;
                    } else {
                        $stat['detach']++;
                    }
                    $stat['count']++;
                }
//                dump($user->following);
//                dump($user->following()->toggle($id));
            }
        }
//        dump($stat);
    }

    public function indexAjax(Request $request)
    {
        if ($request->ajax()) {
            $type = $request->input('type');
            if (!$type || $type == 'followed') { // 关注我的，粉丝
                $fans = Auth::user()->fans();
            }
            if ($type == 'following') { // 我关注的
                $fans = Auth::user()->followings();
            }
            $fans = $fans->with('employee', 'group')->orderBy('created_at', 'desc')->paginate(); // 关注我的人（粉丝）

            foreach ($fans as &$item) {
                $item->avatar = asset($item->avatar);
                $item->company = $item->employee ? $item->employee->company : null;
                $item->isLeave = $item->employee ? null : $this->isLeaveEmployee($item->id);
                $item->isFollow = Auth::user()->isFollow($item->id); // 我是否关注
                $item->isFollowMe = $item->isFollow(Auth::id()); // 是否关注我
            }
            return response()->json(['err' => 0, 'msg' => 'success', 'data' => $fans]);
        }
    }

    public function unfollowAjax(Request $request)
    {
        // TODO
        if ($request->ajax()) {
            $user_id = $request->input('user_id');


            return response()->json(['err' => 0, 'msg' => 'test', 'data' => null]);
        }

    }

    public function rules(Request $request)
    {

    }

}

