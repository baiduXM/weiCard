@extends('web.common.layout')
@section('title', '用户')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('user.show') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a>个人信息</a>
            </li>
        </ul><!--tab标签-->
        <div class="myCard-content  main-cont">
            <p class="phone-show">个人信息</p>
            <div class="side-right wow bounceInRight animated">
                <form action="{{ url('user') }}" method="post">
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

            <form action="" class="lt">
                <div class="file-img rt  col-sm-12">
                    @if(!empty($user->avatar))
                        <img src="{{ asset($user->avatar) }}" alt="">
                    @else
                        <img src="{{ asset('static/home/images/icon12.png') }}" alt="">
                    @endif

                </div>
                <div class="input rt ">
                    <div>
                        <span>个人姓名 : </span>
                        <input type="text" value="{{ $user->name }}" readonly>
                    </div>
                    <div class="file">
                        <span>头像 : </span>
                        <input type="file">
                    </div>
                    <div>
                        <span>地址 : </span>
                        <input type="text">
                    </div>
                    <div>
                        <span>联系电话 : </span>
                        <input type="text">
                    </div>
                    <div>
                        <span>个人简介 : </span>
                        <input class="user-j" type="text">
                    </div>
                    <input type="text" value="确认">
                </div>

            </form>
        </div>
    </div>
@stop