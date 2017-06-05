<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title', '首页') - {{ config('global.website.product_name') }}</title>
    {{--    <link href="{{ asset('static/common/css/bootstrap.min.css') }}" rel="stylesheet">--}}
    <link href="{{ asset('static/zui/css/zui.min.css') }}" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="{{ asset('static/zui/lib/ieonly/html5shiv.js') }}"></script>
    <script src="{{ asset('static/zui/lib/ieonly/respond.js') }}"></script>
    <script src="{{ asset('static/zui/lib/ieonly/excanvas.js') }}"></script>
    <![endif]-->
    @section('css')

    @show
</head>

<body>
{{--头部状态栏--}}
<header id="header">
    <div class="container-fluid">
        <img src="{{ asset('static/home/images/logo.png') }}" alt="">
        <ul class="rt">
            <li><a href="{{ url('user') }}"><img src="{{ asset('static/home/images/hed-icon1.png') }}" alt=""></a></li>
            <li class="had-name had-nav-name">
                <a href="javascript:void(0);">
                    {{ Auth::user()->nickname != null ? (Auth::user()->nickname) : Auth::user()->name }}，欢迎您登录
                </a>
            </li>
            <li>
                <a href="{{ url('logout') }}">
                    <img src="{{ asset('static/home/images/hed-icon2.png') }}" alt="退出" title="退出">
                </a>
            </li>
        </ul>
    </div>
</header>

{{--主要显示区域--}}
<div class="main container-fluid">

    {{--侧边栏--}}
    <div class="sidebar">
        @include('zui.common.sidebar')
    </div>

    {{--内容区域--}}
    <div class="content">
        @section('content')
            {{--内容--}}
        @show
    </div>

    {{--版权声明--}}
    <div class="copyright">
        @section('copyright')
            {{ config('global.website.copyright') }}
        @show
    </div>


    {{--<div>--}}
    {{--@include('home.common.sidebar')--}}
    {{--<div class="main-content">--}}
    {{--@include('home.common.message')--}}

    {{--</div>--}}

    {{--</div>--}}
</div>

{{--页脚--}}
{{--<div class="footer">--}}
{{--@section('footer')--}}
{{--@show--}}
{{--</div>--}}

{{--modal扩展--}}
@section('modal-extend')
    @include('zui.common.modal')
@show

<script src="{{ asset('static/zui/lib/jquery/jquery.js') }}"></script>
<script src="{{ asset('static/zui/js/zui.min.js') }}"></script>

@section('javascript')

@show

</body>

</html>
