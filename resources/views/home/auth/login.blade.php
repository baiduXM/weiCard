@extends('home.common.app')
@section('title', '用户登录')
@section('content')
    <div class="wrapper">
        <form method="POST" action="">
            {{ csrf_field() }}
            <div class="into">
                <p class="w-card">微名片后台登录</p>
                <span>
                 <i class="icon1"></i>帐号:<input value="" class="username" type="username" name="email"/>
              </span>
                <span>
                 <i class="icon2"></i>密码:<input value="" class="password" type="password" name="password">
              </span>
                <input class="dl" type="submit" value="登录">
                <a href="{{ url('password/reset') }}" class="forget">忘记密码？</a>
            </div>
        </form>
        <div id="footer">
            copyright 厦门易尔通网络科技有限公司 版权所有
        </div>
    </div>
@stop