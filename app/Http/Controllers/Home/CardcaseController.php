<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Cardcase;
use App\Models\Employee;
use App\Models\Group;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
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
     * 首页
     */
    public function index()
    {

        // TODO:后期优化分页
        if ($this->is_mobile) {

            $data = $this->index4Mobile();
            return view('mobile.cardcase.index')->with([
                'data' => $data,
            ]);

//            $word = Input::query('word') ? Input::query('word') : '';
//            $cardcases = Cardcase::with(['follower' => function ($query) use ($word) {
//                if (isset($word) && $word != '') {
//                    $query->where('nickname', 'like', '%' . $word . '%');
//                }
//            }])->where('user_id', Auth::id())->get();
//            foreach ($cardcases as $key => $cardcase) {
//                if (!$cardcase->follower) {
//                    unset($cardcases[$key]);
//                }
//            }
//            return view('mobile.cardcase.indexbak')->with([
//                'cardcases' => $cardcases,
//                'word'      => $word,
//            ]);


        } else {
            $cardcases = Cardcase::with('follower')->where('user_id', Auth::id())->paginate();
            return view('web.cardcase.index')->with([
                'cardcases' => $cardcases,
            ]);
        }

    }


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
//        if ($request->ajax()) {
        if ($cardcase) { // 有，删除
            if ($cardcase->delete()) {
                $err_code = 750; // 取消收藏成功
            } else {
                $err_code = 751; // 取消收藏失败
            }
        }
//        Config::set('global.ajax.err', $err_code);
//        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
//        return Config::get('global.ajax');
//        }
        return redirect('cardcase')->with('info', config('global.msg.' . $err_code));

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
            } else {
                $res = $this->getHeirById(Auth::id());
                if ($res['type'] == 'user') {
                    $type = 'u';
                } else {
                    $type = 'e';
                }
                if ($res['data']) {
                    $id = $res['data']->id;
                } else {
                    $id = Auth::id();
                }
            }
            $param = $type . '-' . $id;
        } elseif ($type == 'u') {
            $param = $type . '-' . Auth::id();
        }

        return $this->cardview($param);
    }

    /**
     * @param Request $request
     * @param         $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function ajaxShow(Request $request, $id)
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
        if ($request->ajax()) {
            $cardcase = Cardcase::find($id);
            if ($cardcase->delete()) {
                return response()->json('删除成功');
            }
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
    public function move(Request $request, $id)
    {
        if ($request->ajax()) {
            $group_id = $request->input('group_id');
            $cardcase = Cardcase::find($id);
            $cardcase->group_id = $group_id == 0 ? null : $group_id;
            if ($cardcase->save()) {
                return response()->json('移动成功');
            }
        }
        return redirect()->route('cardcase.index');


    }
}

