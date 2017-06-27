<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', '首页') - {{ config('global.website.product_name') }}</title>

    <link href="{{ asset('static/lib/mzui/css/mzui.min.css') }}" rel="stylesheet">
    {{--自定义css--}}
    @section('css')
    @show
</head>

<body class="with-heading-top can-scroll">
{{--<body class="with-heading-top with-nav-top can-scroll">--}}
@section('content')
    {{--头部导航--}}
    <header class="heading primary affix dock-top">
        <a class="avatar circle" href="{{ url('/') }}"><i class="icon-home"></i></a>
        <div class="title"><strong>@yield('title', '首页')</strong></div>
        <nav class="nav right">
            <a href="{{ url('search') }}"><i class="icon-search"></i></a>
        </nav>
    </header>

    {{--标签导航--}}
    {{--<nav class="nav nav-secondary primary-pale affix dock-top justified space">--}}
    {{--<a class="{{ Request::path() == 'cardcase' || Request::is('cardcase/*') ? 'active' : '' }}"--}}
    {{--href="{{ url('cardcase') }}">个人</a>--}}
    {{--<a class="{{ Request::path() == 'company' || Request::is('company/*') ? 'active' : '' }}"--}}
    {{--href="{{ url('company') }}">企业</a>--}}
    {{--</nav>--}}

@show

{{--模态框--}}
@include('mobile.common.modal')

@section('modal')
@show

<script src="{{ asset('static/lib/mzui/js/mzui.min.js') }}"></script>
<script src="{{ asset('static/mobile/js/operation.js') }}"></script>
{{--自定义js--}}
@section('javascript')
@show
</body>
</html>
