<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>@yield('title', '首页') - {{ config('global.website.product_name') }}</title>


    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="assets/i/favicon.png">

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
  <link rel="canonical" href="http://www.example.com/">
  -->
    @section('css')
        <link href="{{ asset('static/mobile/css/amaze/amazeui.min.css') }}" rel="stylesheet">
        <link href="{{ asset('static/mobile/css/amaze/style.css') }}" rel="stylesheet">
        <link href="{{ asset('static/mobile/css/amaze/common.css') }}" rel="stylesheet">
    @show

</head>
<body>
<!--<div class="had">-->
<!--<i class="close"><img src="images/1_03.png" alt=""></i>-->
<!--<span class="had-name">人脉圈</span>-->
<!--<b class="share rt"><img src="images/1_05.png" alt=""></b>-->
<!--</div>-->
@section('content')
    {{--内容--}}
@show


@section('modal')
    {{--modal扩展--}}
@show


<script src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/mobile/js/amaze/amazeui.min.js') }}"></script>
<script src="{{ asset('static/mobile/js/amaze/function.js') }}"></script>
@section('javascript')
    <script>

        /* 加载ajax */
        function useAjax(type, url, data, sync) {
            var json = '';
            sync ? sync = true : sync = false;
            $.ajax({
                type: type,
                url: url,
                data: data,
                async: sync, // 非异步(同步)加载
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                }, // CSRF验证必填
                success: function (data) {
                    json = data;
                },
                error: function (data) {
                    json = data.responseJSON;
                }
            });
            return json;
        }

        /* 显示数据 */
        function showHtml(_html, _div, _type) {
            if (_type == 'init' || _type == 'refresh') {
                $(_div).html(_html);
            } else if (_type == 'more') {
                $(_div).append(_html);
            } else if (_type == 'before') {
                $(_div).prepend(_html);
            }
        }
    </script>
@show

</body>
</html>