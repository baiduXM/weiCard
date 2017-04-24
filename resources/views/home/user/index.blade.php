@extends('home.common.layout')
@section('title', '名片')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('user') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a>我的名片</a>
            </li>
        </ul><!--tab标签-->
        <div class="myCard-content  main-cont">
            @if(Auth::user()->employee)
                <div class="tab-pane card-a">
                    <div class="card-cont">
                        <span>我的名片</span>
                        <div class="card-text">
                            <img class="lt" src="{{ asset('static/home/images/front-icon.png') }}" alt="">
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
            @else
                <p class="add-btn">
                    <button class="btnBinding" data-toggle="modal" data-target=".bs10" data-url="user/binding">绑定员工</button>
                </p>
            @endif
        </div>
    </div>
@stop
