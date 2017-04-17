@extends('home.common.layout')
@section('title', '安全中心')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">安全中心 > </a></li>
            <li class="cont-nav-act"><a href="">修改密码</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href="">修改密码</a>
            </li>
        </ul>
        <div class="myCard-content rt-main t-s">
            <div class="sj-cont ">
                <p><span>原密码 : </span><input type="text"></p>
                <h6>*密码错误</h6>
                <p><span>新密码 : </span><input type="text"></p>
                <p><span>确认新密码 : </span><input type="text"></p>
                <h6>*两次密码不一致</h6>
                <p><span></span><input class="sj-btn" type="submit" value="确认"></p>
            </div>
        </div>
    </div>
@stop
