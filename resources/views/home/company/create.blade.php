@extends('home.common.layout')
@section('title', '公司')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.create') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">注册公司</a>
            </li>
        </ul>
        <div class="myCard-content  main-cont">
            <p class="phone-show">注册公司</p>
            <form action="{{ url('company') }}" class="lt" method="post">
                {{ csrf_field() }}
                <div class="file-img rt  col-sm-12">
                    <img src="{{ asset('static/home/image/icon12.png') }}" alt="" onerror="{{ asset('static/home/image/icon12.png') }}">
                </div>
                <div class="input rt">
                    <div>
                        <span>公司名称 : </span>
                        <input type="text">
                    </div>
                    <div class="file">
                        <span>logo : </span>
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
                    <div class="user-j">
                        <span>公司简介 : </span>
                        <textarea name="" id=""></textarea>
                    </div>
                    <input type="submit" value="确认">
                </div>

            </form>
        </div>
    </div>
@stop

@section('javascript')
    <script>

    </script>
@stop
