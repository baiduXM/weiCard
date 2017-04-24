@extends('home.common.layout')
@section('title', '安全中心')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">安全中心 > </a></li>
            <li class="cont-nav-act"><a href="">安全中心</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href=""   >安全中心</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <div class="an-cont zh-cont">
                <p>为了保障您的账户安全，是否操作一下内容？</p>
                <!--手机验证与邮箱验证暂不开放-->
                <!--           
                <a href="" class=" phone"><i class="iconFont">&#xe737;</i><span>手机验证</span></a>
                <a href="" class=" email"><i class="iconFont">&#xe6c9;</i><span>邮箱验证</span></a>
                -->
                <a href="security/password" class=" pass"><i class="iconFont">&#xe61e;</i><span>密码修改</span></a>
                <!-- <a href="" class=" QQ"><i class="qq iconFont">&#xe606;</i><i class="iconFont">&#xe60c;</i><i class="weibo iconFont">&#xe605;</i><span>第三方绑定</span></a>-->
            </div>
        </div>
    </div>
@stop
