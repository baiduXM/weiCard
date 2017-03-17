@extends('layouts.login-layout')
@section('title', '找回密码')
@section('content')
    <div class="login">
        <form action="{{ url('password/email') }}" method="post">
            {{ csrf_field() }}
            <h1>找回密码</h1>

            @if (session('status'))
                <p style="color: darkolivegreen;">{{ session('status') }}</p>
            @endif
            <div class="mail input">
                <img src="{{ asset('static/home/image/icon5.png') }}" alt="">
                <input type="text" name="email" placeholder="邮箱" value="{{ old('email') }}">
            </div>
            @if ($errors->has('email'))
                <p class="pass-error">{{ $errors->first('email') }}</p>
            @endif
            <button type="submit">发送邮件</button>
            <div class="txt" style="text-align: center;">
                <span><a href="{{ url('login') }}">返回登录</a></span>
            </div>
        </form>

    </div>
@stop