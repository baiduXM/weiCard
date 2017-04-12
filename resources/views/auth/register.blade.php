@extends('layouts.login-layout')
@section('title', '注册')
@section('content')
    <div class="login">
        <form action="{{ url('/register') }}" method="post">
            {{ csrf_field() }}
            <h1>注册账号</h1>
            <div class="user input">
                <img src="{{ asset('static/home/image/icon.png') }}" alt="" title="用户名">
                <input type="text" name="name" placeholder="用户名" value="{{ old('name') }}">
            </div>
            @if ($errors->has('name'))
                <p class="pass-error show">{{ $errors->first('name') }}</p>
            @endif

            <div class="pass input">
                <img src="{{ asset('static/home/image/icon3.png') }}" alt="" title="密码">
                <input type="password" name="password" placeholder="密码">
            </div>
            @if ($errors->has('password'))
                <p class="pass-error show">{{ $errors->first('password') }}</p>
            @endif

            <div class="pass2 input">
                <img src="{{ asset('static/home/image/icon3.png') }}" alt="" title="重复密码">
                <input type="password" name="password_confirmation" placeholder="重复密码">
            </div>
            <button type="submit">注册</button>
            <div class="txt" style="text-align: center;">
                <span><a href="{{ url('/login') }}">已有账号</a></span>
            </div>
        </form>
    </div>
@stop
