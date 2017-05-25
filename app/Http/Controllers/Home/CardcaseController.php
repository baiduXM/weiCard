<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Cardcase;
use App\Models\Employee;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Input;

class CardcaseController extends Controller
{

    public function __construct()
    {
        parent::isMobile();
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
            $cardcases = Cardcase::with(['follower' => function ($query) {
                $params = Input::query();
                if (isset($params['name']) && $params['name'] != '') {
                    $query->where('name', 'like', '%' . $params['name'] . '%');
                }
            }])->where('user_id', Auth::id())->get();
            foreach ($cardcases as $key => $cardcase) {
                if (!$cardcase->follower) {
                    unset($cardcases[$key]);
                }
            }
            return view('mobile.cardcase.index')->with([
                'cardcases' => $cardcases,
            ]);
        } else {
            $cardcases = Cardcase::where('user_id', Auth::id())->paginate();
            return view('home.cardcase.index')->with([
                'cardcases' => $cardcases,
            ]);
        }
    }

    /**
     * 收藏/取消收藏
     *
     * @param $params
     * @return mixed|string
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

        /* 查看数据库是否有数据 */
        $query = Cardcase::query();
        foreach ($data as $key => $value) {
            $query->where($key, $value);
        }
        $cardcase = $query->first();

        /* ajax收藏 */
        if ($request->ajax()) {
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
            Config::set('global.ajax.err', $err_code);
            Config::set('global.ajax.msg', config('global.msg.' . $err_code));
            return Config::get('global.ajax');
        }

        /* url收藏 */
        if ($request->isMethod('get')) {
            if ($cardcase) { // 有，删除
                $err_code = 702; // 收藏失败
            } elseif (Cardcase::create($data)) {
                $err_code = 700; // 收藏成功
            }
        }
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
     * @param $type 名片类型，u-个人，e-员工，c-公司
     * @return $this
     */
    public function show($type = 'u')
    {
        if ($type == 'e') {
            $param = $type . '-' . Auth::user()->employee->id;
        } elseif ($type == 'u') {
            $param = $type . '-' . Auth::id();
        }
        $indexController = new IndexController();
        return $indexController->cardview($param);

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

