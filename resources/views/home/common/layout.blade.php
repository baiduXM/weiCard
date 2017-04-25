<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title', '首页') - {{ config('global.website.product_name') }}</title>
    <link href="{{ asset('static/common/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('static/home/css/style.css') }}" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="{{ asset('static/common/js/html5shiv.js') }}"></script>
    <script src="{{ asset('static/common/js/respond.min.js') }}"></script>
    <![endif]-->
    @section('css')

    @show
</head>

<body>

<header id="header">
    <div class="container-fluid">
        <img src="{{ asset('static/home/images/logo.png') }}" alt="">
        <ul class="rt">
            <li><a href="{{ url('user') }}"><img src="{{ asset('static/home/images/hed-icon1.png') }}" alt=""></a></li>
            <li class="had-name had-nav-name">
                <a href="javascript:void(0);">{{ Auth::user()->nickname != null ? (Auth::user()->nickname) : Auth::user()->name }}，欢迎您登录</a>
            </li>
            <li><a href="{{ url('logout') }}"><img src="{{ asset('static/home/images/hed-icon2.png') }}" alt="退出" title="退出"></a></li>
        </ul>
    </div>
</header>

<div class="main">
    <div class="container-fluid">
        @include('home.common.sidebar')
        <div class="main-content">
            @include('home.common.message')
            @section('content')
                {{--内容--}}
            @show
            <p class="foot-txt">copyright© 厦门易尔通网络科技有限公司 版权所有</p>


        </div>

    </div>
</div>
@section('modal-extend')
    {{--modal扩展--}}
@show
@include('home.common.modal')

<script src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/common/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('static/common/js/jquery.timers-1.2.js') }}"></script><!--jquery定时器-->
<script src="{{ asset('static/home/js/tree-box.js') }}"></script>
<script src="{{ asset('static/home/js/operation.js') }}"></script>

@section('javascript')

@show

</body>

</html>
