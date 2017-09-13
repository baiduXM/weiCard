<?php

namespace App\Models;


class Tag extends CommonModel
{

    /**
     * 多标签模式
     * true：开启/多标签模式
     * false：关闭/单标签模式
     */
    const TAG_MULTI = false;

    protected $guarded = [
        'id'
    ];

    /**
     * 表明模型是否应该被打上时间戳
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * 可允许的查询字段
     *
     * @var array key=>列名，value=>操作符
     */
    public $query = [
        'user_id' => '=',
        'template_id' => '=',
    ];


    /**
     * 关系模型(多对一) - 用户
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }


    /**
     * 关系模型(多对多，多态) - 名片夹
     *
     * @return \Illuminate\Database\Eloquent\Relations\MorphToMany
     */
    public function cardcases()
    {
        return $this->morphedByMany('App\Models\Cardcase', 'taggable');
    }

    /**
     * 关系模型(多对多，多态) - 模板
     *
     * @return \Illuminate\Database\Eloquent\Relations\MorphToMany
     */
    public function templates()
    {
        return $this->morphedByMany('App\Models\Template', 'taggable');
    }
}
