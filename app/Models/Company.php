<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/4/7
 * Time: 11:03
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Company extends CommonModel
{

//    use SoftDeletes; // 软删除

    const VERIFIED_ING = 0; // 待审核
    const VERIFIED_SUCCEED = 1; // 审核通过
    const VERIFIED_FAILED = 2; // 审核失败

    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at',
    ];

    protected $hidden = [
    ];

    /**
     * 关系模型(一对一) - 用户
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 关系模型(多对一) - 管理员
     */
    public function manager()
    {
        return $this->belongsTo('App\Models\Manager');
    }

    /**
     * 关系模型(一对多) - 员工
     */
    public function employees()
    {
        return $this->hasMany('App\Models\Employee');
    }

    /**
     * 关系模型(一对多) - 部门
     */
    public function departments()
    {
        return $this->hasMany('App\Models\Department');
    }

    /**
     * 关系模型(一对多) - 产品
     */
    public function products()
    {
        return $this->hasMany('App\Models\Product');
    }

    /**
     * 关系模型(多对多,多态) - 模板
     */
    public function templates()
    {
        return $this->morphToMany('App\Models\Template', 'useable', 'template_useable');
    }

    /**
     * 获取状态
     *
     * @param null $index
     * @return array|mixed
     */
    public function getStatus($index = null)
    {
        $array = [
            self::VERIFIED_ING => '待审核',
            self::VERIFIED_SUCCEED => '审核通过',
            self::VERIFIED_FAILED => '审核失败',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }

    /**
     * 公司关联用户
     *
     * @param $code
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function binding($code, $id)
    {
        $company = Company::find($id);
        if ($company->user) {
            return 105;// 绑定失败 - 公司已绑定用户
        }
        $user = User::where('name', '=', $code)->where('is_active', 1)->first();
        if (!$user) {
            return 106; // 绑定失败 - 用户不存在
        }
        if ($user->company) { // 用户关联公司
            return 107; // 绑定失败 - 用户已关联公司
        }
        if (count($company->employees)) { // 公司关联员工
            return 108; // 绑定失败 - 绑定码不完整，未包含员工信息
        }
        $employee = new Employee();
        $employee->number = strtoupper(substr($company->name, 0, 1)) . '00001';
        $employee->name = $user ? ($user->nickname ? $user->nickname : $user->name) : '创始人';
        $company->employees()->save($employee); // 员工关联公司
        $user->company()->save($company); // 公司关联用户
        $user->employee()->save($employee); // 员工关联用户
        return 100;
    }

}