<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="x5-orientation" content="portrait">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta content="telephone=no, email=no" name="format-detection">
    <!-- 启用360浏览器的极速模式(webkit) -->
    <meta name="renderer" content="webkit">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
    <meta name="HandheldFriendly" content="true">
    <!-- 微软的老式浏览器 -->
    <meta name="MobileOptimized" content="320">
    <!-- uc强制竖屏 -->
    <meta name="screen-orientation" content="portrait">
    <!-- QQ强制竖屏 -->
    <meta name="x5-orientation" content="portrait">
    <title>@yield('title', '首页') - {{ config('global.website.product_name') }}</title>

    <link href="{{ asset('static/mobile/css/animate.css') }}" rel="stylesheet">
    {{--    <link href="{{ asset('static/mobile/css/swiper-3.3.1.min.css') }}" rel="stylesheet">--}}

    <!--[if lt IE 9]>
    <script src="{{ asset('static/common/js/html5shiv.js') }}"></script>
    <script src="{{ asset('static/common/js/respond.min.js') }}"></script>
    <![endif]-->

    @section('css')
        <link href="{{ asset('static/mobile/css/css.css') }}" rel="stylesheet">
        <link href="{{ asset('static/mobile/css/style.css') }}" rel="stylesheet">
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

@section('content')
    {{--内容--}}
@show
@section('modal-extend')
    @include('mobile.common.modal')
    {{--modal扩展--}}
@show
<script src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/mobile/js/TouchSlide.1.1.js') }}"></script>
<script src="{{ asset('static/common/js/jquery.timers-1.2.js') }}"></script><!--jquery定时器-->


<script type="text/javascript">
    window.addEventListener('load', function () {
        setTimeout(function () {
            window.scrollTo(0, 1);
        }, 100);
    });//safari浏览器可以通过此代码来隐藏地址栏
</script>

@section('javascript')
    <script src="{{ asset('static/mobile/js/index.js') }}"></script>
    <script src="{{ asset('static/mobile/js/fontsize.js') }}"></script>
    <script src="{{ asset('static/mobile/js/function.js') }}"></script>
@show
</body>
</html>
