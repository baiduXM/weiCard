@extends('layouts.login-layout')
@section('title', '登录')
@section('content')
    <div class="login">
        <form action="{{ url('/login') }}" method="post">
            {{ csrf_field() }}
            <h1>微名片登录</h1>
            <div class="user input">
                <img src="{{ asset('static/home/images/icon.png') }}" alt="" title="账号">
                <input type="text" name="username" placeholder="用户名/邮箱" value="{{ old('username') }}">
            </div>

            <div class="pass input">
                <img src="{{ asset('static/home/images/icon3.png') }}" alt="" title="密码">
                <input type="password" name="password" placeholder="密码">
            </div>
            @if ($errors->has())
                <p class="pass-error">{{ $errors->first() }}</p>
            @endif

            <button type="submit">登录</button>
            <div class="txt">
                {{--<span class="lt"><a href="{{ url('register') }}">注册</a></span>--}}
                <span class="rt"><a href="{{ url('password/reset') }}">忘记密码？</a></span>
            </div>
            <p class="three"><b style="margin-right:10px;"></b>使用第三方账号登录<b style="margin-left:10px;"></b></p>
            <ul class="lo-icon">
                {{--<li class="icon-q"><a href=""></a></li>--}}
                {{--<li class="icon-m"><a href=""></a></li>--}}
                @if(\Illuminate\Support\Facades\Session::get('is_mobile'))
                    <li class="icon-w"><a href="{{ url('oauth/weixin') }}"></a></li>
                @else
                    <li class="icon-w"><a href="{{ url('oauth/weixinweb') }}"></a></li>
                @endif
            </ul>
        </form>
    </div>
@stop
