<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>微名片管理平台 - @yield('title', '首页')</title>
    {{--<link href="{{ asset('static/common/css/bootstrap.min.css') }}" rel="stylesheet">--}}
    <link href="{{ asset('static/home/css/animate.css') }}" rel="stylesheet">
    <link href="{{ asset('static/home/css/style.css') }}" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="{{ asset('static/common/js/html5shiv.js') }}"></script>
    <script src="{{ asset('static/common/js/respond.min.js') }}"></script>
    <![endif]-->
    @section('css')
    @show
</head>

<body>
<div class="wrapper">
    <div class="header">
        <div class="logo wow zoomInRight animated"><a href=""><img src="{{ asset('static/home/images/logo.png') }}"></a>
        </div>
    </div>
    <div class="side">
        @include('home.common.sidebar')
        @section('content')

        @show
    </div>
    <div id="footer">
        copyright 厦门易尔通网络科技有限公司 版权所有
    </div>
</div>


<script src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/common/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('static/home/js/wow.min.js') }}"></script>
<script src="{{ asset('static/home/js/function.js') }}"></script>
<script src="{{ asset('static/home/js/jquery.SuperSlide.2.1.1.js') }}"></script>
<script src="{{ asset('static/home/js/main.js') }}"></script>
<script src="{{ asset('static/home/js/PicCarousel.js') }}"></script>
<script src="{{ asset('static/home/js/site.js') }}"></script>
@section('javascript')

@show


</body>

</html>
