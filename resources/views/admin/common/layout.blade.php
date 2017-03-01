<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>微名片系统管理员后台 - @yield('title', '首页')</title>
    <link href="{{ asset('static/common/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('static/admin/css/datepicker3.css') }}" rel="stylesheet">
    <link href="{{ asset('static/admin/css/styles.css') }}" rel="stylesheet">
    <link href="{{ asset('static/admin/css/bootstrap-table.css') }}" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="{{ asset('static/common/js/html5shiv.js') }}"></script>
    <script src="{{ asset('static/common/js/respond.min.js') }}"></script>
    <![endif]-->
    @section('css')
    @show
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>微名片</span> 管理后台</a>  <a class="navbar-brand" href="/" target="_blank"><span>前台页面</span></a>
            {{--用户菜单--}}
            <ul class="nav navbar-nav navbar-right">
                @if(Auth::guard('admin')->guest())
                    <li><a href="{{ url('admin/login') }}">Login</a></li>
                    <li><a href="{{ url('admin/register') }}">Register</a></li>
                @else
                    <li class="dropdown pull-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                                    class="glyphicon glyphicon-user"></span> {{ Auth::guard('admin')->user()->name }}
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="{{ url('admin/setting/person') }}"><span
                                            class="glyphicon glyphicon-user"></span>
                                    Profile</a></li>
                            <li><a href="{{ url('admin/setting') }}"><span class="glyphicon glyphicon-cog"></span>
                                    Settings</a></li>
                            <li><a href="{{ url('admin/logout') }}"><span class="glyphicon glyphicon-log-out"></span>
                                    Logout</a></li>
                        </ul>
                    </li>
                @endif
            </ul>
        </div>
    </div><!-- /.container-fluid -->
</nav>
@include('admin.common.sidebar')
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    {{--面包削--}}
    <div class="row">
        @yield('breadcrumb')
    </div>
    {{--<div class="row">--}}
        {{--<div class="col-lg-12">--}}
            {{--<h1 class="page-header">@yield('title')</h1>--}}
        {{--</div>--}}
    {{--</div><!--/.row-->--}}
    <div class="row">
        <div class="col-lg-12">
            @include('common.message')
        </div>
    </div><!--/.row-->
    @section('content')

    @show
</div><!--/.main-->

<script src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/common/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('static/admin/js/chart.min.js') }}"></script>
<script src="{{ asset('static/admin/js/easypiechart.js') }}"></script>
<script src="{{ asset('static/admin/js/bootstrap-datepicker.js') }}"></script>
<script src="{{ asset('static/admin/js/bootstrap-table.js') }}"></script>
@section('javascript')

@show
</body>

</html>
