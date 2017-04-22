@extends('home.common.layout')
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
            <form action="" class="lt">
                <div class="file-img rt  col-sm-12">
                    @if(!empty($user->avatar))
                        <img src="{{ asset($user->avatar) }}" alt="">
                    @else
                        <img src="{{ asset('static/home/image/icon12.png') }}" alt="">
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