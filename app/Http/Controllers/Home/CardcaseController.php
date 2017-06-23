<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Cardcase;
use App\Models\Employee;
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
//            return view('mobile.cardcase.index')->with([
//                'cardcases' => $cardcases,
//                'word' => $word,
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

        $cardcases = Cardcase::with('follower')->where('user_id', Auth::id())->get()->toArray();
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
                    'id' => $k,
                    'name' => $v,
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
     *
     * @return mixed
     */
    private function getPinyin($data)
    {
        if (is_array($data)) {
            foreach ($data as $k => &$v) {
                $v['follower']['pinyin'] = $this->pinyin($v['follower']['nickname']) . ' ' . $this->pinyin($v['follower']['nickname'], 'abbr');
            }
        }
        return $data;
    }


    /**
     * 收藏/取消收藏
     *
     * @param Request $request
     * @param         $params   类型-ID
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function follow(Request $request, $params)
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

        /* 无法关注自己 */
        if ($param[0] == 'e') {
            if (Auth::user()->employee && $param[1] == Auth::user()->employee->id) {
                $err_code = 701; // 收藏失败
            }
        } elseif ($param[0] == 'u') {
            if ($param[1] == Auth::id()) {
                $err_code = 701; // 收藏失败
            }
        }


        /* 查看数据库是否有数据 */
        $query = Cardcase::query();
        foreach ($data as $key => $value) {
            $query->where($key, $value);
        }
        $cardcase = $query->first();

        /* ajax收藏 */
        if ($request->ajax()) {
            if (!isset($err_code)) {
                if ($cardcase) { // 有，删除
                    if ($cardcase->delete()) {
                        $err_code = 750; // 取消收藏成功
                    } else {
                        $err_code = 751; // 取消收藏失败
                    }
                } else { // 无，收藏
                    /* 添加名片到名片夹 */
                    if (Cardcase::create($data)) {
                        $err_code = 700; // 收藏成功
                    } else {
                        $err_code = 701; // 收藏失败
                    }
                }
            }
            Config::set('global.ajax.err', $err_code);
            Config::set('global.ajax.msg', config('global.msg.' . $err_code));
            return Config::get('global.ajax');
        }

        /* url收藏 */
        if (!isset($err_code)) {
            if ($request->isMethod('get')) {
                if ($cardcase) { // 有，删除
                    $err_code = 702; // 收藏失败
                } elseif (Cardcase::create($data)) {
                    $err_code = 700; // 收藏成功
                }
            }
        }
        return redirect('cardcase')->with('info', config('global.msg.' . $err_code));
    }

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
     *
     * @return $this|\Illuminate\Http\RedirectResponse
     */
    public function show($type = 'u')
    {
        if ($type == 'e') {
            $param = $type . '-' . Auth::user()->employee->id;
        } elseif ($type == 'u') {
            $param = $type . '-' . Auth::id();
        }
        return $this->cardview($param);

    }

    public function edit($id)
    {
        return view('admin.cardcase.edit')->with([]);
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }

    public function cardshow($id)
    {
        $employee = Employee::with('company', 'department', 'user')->find($id);
        return $employee;
    }
}

