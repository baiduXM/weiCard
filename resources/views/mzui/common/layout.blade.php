<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', '首页') - {{ config('global.website.product_name') }}</title>

    <link href="{{ asset('static/lib/mzui/css/mzui.min.css') }}" rel="stylesheet">

    @section('css')
        {{--自定义css--}}
    @show
</head>

<body class="with-heading-top with-nav-top can-scroll">
@section('content')
    {{--头部导航--}}
    <header class="heading primary affix dock-top dock-auto">
        <a class="avatar circle"><i class="icon-home"></i></a>
        <div class="title"><strong>@yield('title', '首页')</strong></div>
        <nav class="nav right">
            <a href="{{ url('m/search') }}"><i class="icon-search"></i></a>
        </nav>
    </header>

    {{--标签导航--}}
    <nav class="nav nav-secondary primary-pale affix dock-top justified space">
        <a class="{{ Request::path() == 'm/cardcase' || Request::is('m/cardcase/*') ? 'active' : '' }}"
           href="{{ url('m/cardcase') }}">个人</a>
        <a class="{{ Request::path() == 'm/company' || Request::is('m/company/*') ? 'active' : '' }}"
           href="{{ url('m/company') }}">企业</a>
        {{--<a class="{{ Request::path() == 'm/circle' || Request::is('m/circle/*') ? 'active' : '' }}"--}}
           {{--href="{{ url('m/group') }}">关系圈</a>--}}
    </nav>

@show

@section('modal')
    {{--模态框--}}
@show

<script src="{{ asset('static/lib/mzui/js/mzui.min.js') }}"></script>

@section('javascript')
    {{--自定义js--}}
@show
</body>
</html>
