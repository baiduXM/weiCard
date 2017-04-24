@extends('layouts.login-layout')
@section('title', '密码重置')
@section('content')
    <div class="login">
        <form method="POST" action="{{ url('/password/reset') }}">
            {{ csrf_field() }}

            <input type="hidden" name="token" value="{{ $token }}">
            <h1>密码重置</h1>
            <div class="user input">
                <img src="{{ asset('static/home/images/icon.png') }}" alt="">
                <input type="text" name="email" placeholder="邮箱" value="{{ $email or old('email') }}" readonly>
            </div>
            @if ($errors->has('email'))
                <p class="pass-error">{{ $errors->first('email') }}</p>
            @endif

            <div class="pass input">
                <img src="{{ asset('static/home/images/icon3.png') }}" alt="">
                <input type="password" name="password" placeholder="密码" >
            </div>
            @if ($errors->has('password'))
                <p class="pass-error">{{ $errors->first('password') }}</p>
            @endif

            <div class="pass2 input">
                <img src="{{ asset('static/home/images/icon3.png') }}" alt="">
                <input type="password" name="password_confirmation" placeholder="确认密码" >
            </div>
            @if ($errors->has('password_confirmation'))
                <p class="pass-error">{{ $errors->first('password_confirmation') }}</p>
            @endif

            <button type="submit">重置密码</button>
            <div class="txt" style="text-align: center;">
                <span><a href="{{ url('login') }}">返回登录</a></span>
            </div>

        </form>
    </div>
@stop