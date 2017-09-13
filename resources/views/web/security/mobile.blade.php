@extends('web.common.layout')
@section('title', '安全中心')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">安全中心 > </a></li>
            <li class="cont-nav-act"><a href="">验证手机</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href=""   >验证手机</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <div class="sj-cont ">
                <p><span>手机 : </span><input type="text"></p>
                <p><span>验证码 : </span><b><input type="text"><button>发送验证码</button></b></p>
                <p><span></span><input class="sj-btn" type="submit" value="确认"></p>
            </div>
        </div>
    </div>
@stop
