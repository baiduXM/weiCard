<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title', '首页') - 微名片</title>
    <link href="{{ asset('static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css') }}" rel="stylesheet">
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
        <img src="{{ asset('static/home/image/logo.png') }}" alt="">
        <ul class="rt">
            <li><a href=""><img src="{{ asset('static/home/image/hed-icon1.png') }}" alt=""></a></li>
            <li class="had-name had-nav-name"><a href="">林先生，欢迎您登录</a></li>
            <li class="had-name"><a href="">后台管理</a></li>
            <li><a href=""><img src="{{ asset('static/home/image/hed-icon2.png') }}" alt=""></a></li>
        </ul>
    </div>
</header>
<div class="main">
    <div class="container-fluid">
        @include('home.common.sidebar')
        <div class="main-content">
            @section('content')

            @show
            <p class="foot-txt">copyright© 厦门易尔通网络科技有限公司 版权所有</p>
        </div>

    </div>
</div>
{{--<div class="wrapper">--}}
{{--<div class="header">--}}
{{--<div class="logo wow zoomInRight animated"><a href=""><img src="{{ asset('static/home/images/logo.png') }}"></a>--}}
{{--</div>--}}
{{--</div>--}}
{{--<div class="side">--}}


{{--</div>--}}
{{--<div id="footer">--}}
{{--copyright 厦门易尔通网络科技有限公司 版权所有--}}
{{--</div>--}}
{{--</div>--}}


<script src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/common/bootstrap-3.3.5-dist/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('static/home/js/tree-box.js') }}"></script>

@section('javascript')

@show


</body>

</html>
