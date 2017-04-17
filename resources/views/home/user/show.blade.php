@extends('home.common.layout')
@section('title', '用户')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">我的名片 > </a></li>
            <li class="cont-nav-act"><a href="">个人信息</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href=""   >个人信息</a>
            </li>
        </ul>
        <div class="myCard-content  main-cont">
            <p class="phone-show">个人信息</p>
            <form  action="" class="lt">
                <div class="file-img rt  col-sm-12">
                    <img src="image/icon12.png" alt="">
                </div>
                <div class="input rt ">
                    <div>
                        <span>个人姓名 : </span>
                        <input type="text">
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