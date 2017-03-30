@extends('home.common.layout')
@section('title', '名片')
@section('content')
    <div id="myCard">
        <ul class="cont-nav rt">
            <li><a href="">我的名片 > </a></li>
            <li class="cont-nav-act"><a href="">我的名片</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">我的名片</a>
            </li>
        </ul>
        <div class="myCard-content  main-cont">
            <div class="tab-pane card-a">
                <div class="card-cont">
                    <span>我的名片</span>
                    <div class="card-text">
                        <img class="lt" src="{{ asset('static/home/image/front-icon.png') }}" alt="">
                        <span>林先生</span>
                        <div>
                            <span>电话 :</span>
                            <input type="text">
                        </div>
                        <div>
                            <span>手机 :</span>
                            <input type="text">
                        </div>
                        <div>
                            <span>地址 :</span>
                            <input type="text">
                        </div>
                    </div>
                </div>
                @include('home.common.share')
            </div>
        </div>
    </div>
@stop
