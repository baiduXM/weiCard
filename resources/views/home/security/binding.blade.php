@extends('home.common.layout')
@section('title', '安全中心')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">安全中心 > </a></li>
            <li class="cont-nav-act"><a href="">绑定第三方账号</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href="">绑定第三方账号</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <div class="zh-cont an-cont">
                <a href="" class=""><i class="iconFont lt">&#xe607;</i><span>绑定QQ账号</span></a>
                <a href="" class=""><i style="margin-top:6px;" class="iconFont lt">&#xe616;</i><span>绑定微信账号</span></a>
                <a href="" class=""><i class="iconFont lt">&#xe645;</i><span>绑定微博账号</span></a>
                <input class="sj-btn" type="submit" value="确认">
            </div>
        </div>
    </div>
@stop
