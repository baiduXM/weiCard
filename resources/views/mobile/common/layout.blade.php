<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', '首页') - {{ config('global.website.product_name') }}</title>

    <link rel="stylesheet" href="{{ asset('static/mobile/css/style.css') }}">
    <!--[if lt IE 9]>
    <script src="{{ asset('static/common/js/html5shiv.js') }}"></script>
    <script src="{{ asset('static/common/js/respond.min.js') }}"></script>
    <script src="{{ asset('static/home/js/tree-box.js') }}"></script>
    <![endif]-->
    @section('css')

    @show
</head>

<body>

@section('content')
    {{--内容--}}
@show

<script src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/mobile/js/index.js') }}"></script>
@section('javascript')

@show
</body>
</html>
