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

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileColor" content="#0e90d2">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
  <link rel="canonical" href="http://www.example.com/">
  -->
    <link href="{{ asset('static/mobile/css/amaze/amazeui.min.css') }}" rel="stylesheet">
    @section('css')
        <link href="{{ asset('static/mobile/css/amaze/style.css') }}" rel="stylesheet">
        <link href="{{ asset('static/mobile/css/amaze/common.css') }}" rel="stylesheet">
    @show
    <script>
        (function (doc, win) {
            var docEl     = doc.documentElement,
                resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                recalc    = function () {
                    var clientWidth = docEl.clientWidth;
                    if (!clientWidth) return;
                    if (clientWidth > 640) {
                        clientWidth = 640;
                    }
                    docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
                };
            recalc();
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);
    </script>

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
    {{--modal扩展 信息提示--}}
    <div class="am-modal am-modal-alert" tabindex="-1" id="info-alert">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">Amaze UI</div>
            {{--<div class="am-modal-bd">--}}
            {{--Hello world！--}}
            {{--</div>--}}
        </div>
    </div>
@show

<script src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/mobile/js/amaze/amazeui.min.js') }}"></script>
@section('javascript')
    <script src="{{ asset('static/mobile/js/common.js??v=20170908') }}"></script>
@show
<script src="{{ asset('static/mobile/js/amaze/function.js?v=20170908-2') }}"></script>


</body>
</html>