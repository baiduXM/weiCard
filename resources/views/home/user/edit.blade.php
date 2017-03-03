@extends('home.common.layout')
@section('title', '用户')
@section('content')
    <div class="side-right wow bounceInRight animated">
        <form action="{{ url('user/'.$user->id) }}" method="post">
            {{ method_field('put') }}
            {{ csrf_field() }}
            <div class="mess">
            <span>账号：
                <input name="name" type="text" class="inputt" value="{{ $user->name }}"
                       onfocus="ChangeStyle_hb(this,1,1)"
                       onblur="ChangeStyle_hb(this,2,1)">
            </span>
                <span>邮箱：
                <input name="email" type="text" class="inputt" value="{{ $user->email }}"
                       onfocus="ChangeStyle_hb(this,1,1)"
                       onblur="ChangeStyle_hb(this,2,1)">
            </span>
                <span>电话：
                <input name="mobile" type="text" class="inputt" value="{{ $user->mobile }}"
                       onfocus="ChangeStyle_hb(this,1,1)"
                       onblur="ChangeStyle_hb(this,2,1)">
            </span>
                <span>头像：
                <img src="{{ asset($user->avatar) }}"/>
                <a href="javascript:;" class="file"><input type="file" class="logoimg" value="">上传图片</a>
            </span>
                <span>性别：
                <input name="sex" type="text" class="inputt" value="{{ $user->sex }}" onfocus="ChangeStyle_hb(this,1,1)"
                       onblur="ChangeStyle_hb(this,2,1)">
            </span>
                <span>年龄：
                <input name="age" type="text" class="inputt" value="{{ $user->age }}" onfocus="ChangeStyle_hb(this,1,1)"
                       onblur="ChangeStyle_hb(this,2,1)">
            </span>
                <span>昵称：
                <input name="nickname" type="text" class="inputt" value="{{ $user->nickname }}"
                       onfocus="ChangeStyle_hb(this,1,1)"
                       onblur="ChangeStyle_hb(this,2,1)">
            </span>
                <span>个人简介：
                <input name="description" type="text" class="inputt" value="{{ $user->description }}"
                       onfocus="ChangeStyle_hb(this,1,1)"
                       onblur="ChangeStyle_hb(this,2,1)">
            </span>
                <div class="inp">
                    <a href="javascript:;"><input type="submit" class="not" value="取消"></a>
                    <a href="javascript:;"><input type="submit" class="sub" value="编辑"></a>
                </div>
            </div>
        </form>
    </div>
@stop