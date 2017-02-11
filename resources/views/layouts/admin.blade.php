<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>微名片系统后台管理 - @yield('title', '首页')</title>
    <link href="{{ asset('static/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('static/css/datepicker3.css') }}" rel="stylesheet">
    <link href="{{ asset('static/css/styles.css') }}" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="{{ asset('static/js/html5shiv.js') }}"></script>
    <script src="{{ asset('static/js/respond.min.js') }}"></script>
    <![endif]-->
</head>

<body>
@section('header')
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
                <a class="navbar-brand" href="#"><span>微名片</span> 管理后台</a>
                {{--用户菜单--}}
                <ul class="user-menu">
                    <li class="dropdown pull-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                                    class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div><!-- /.container-fluid -->
    </nav>
@show
@section('sidebar')
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <form role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
        </form>
        <ul class="nav menu">
            <li class="{{ Request::path() == 'admin/index' ? 'active' : '' }}">
                <a href="{{ url('admin/index') }}"><span class="glyphicon glyphicon-dashboard"></span>
                    首页</a>
            </li>
            <li class="{{ Request::path() == 'admin/user' || Request::is('admin/user/*') ? 'active' : '' }}">
                <a href="{{ url('admin/user') }}"><span class=" glyphicon glyphicon-th"></span> 用户管理</a>
            </li>
            <li class="{{ Request::path() == 'admin/charts' ? 'active' : '' }}">
                <a href="{{ url('admin/member') }}"><span class="glyphicon glyphicon-stats"></span> 管理员列表</a>
            </li>
            <li class="parent ">
                <a href="#">
                    <span class="glyphicon glyphicon-list"></span> Dropdown
                    <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right">
                            <em class="glyphicon glyphicon-s glyphicon-plus"></em>
                        </span>
                </a>
                <ul class="children collapse" id="sub-item-1">
                    <li>
                        <a class="" href="#">
                            <span class="glyphicon glyphicon-share-alt"></span> Sub Item 1
                        </a>
                    </li>
                    <li>
                        <a class="" href="#">
                            <span class="glyphicon glyphicon-share-alt"></span> Sub Item 2
                        </a>
                    </li>
                    <li>
                        <a class="" href="#">
                            <span class="glyphicon glyphicon-share-alt"></span> Sub Item 3
                        </a>
                    </li>
                </ul>
            </li>

            <li role="presentation" class="divider"></li>

            <li><a href="login.html"><span class="glyphicon glyphicon-user"></span> Login Page</a></li>

        </ul>
    </div>
@show

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    {{--面包削--}}
    <div class="row">
        @section('breadcrumb')
            {!! Breadcrumbs::render('admin') !!}
        @show
    </div>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">@yield('title')</h1>
        </div>
    </div><!--/.row-->
    @section('content')
        <div class="row">
            <div class="col-lg-12">
                @include('common.message')
            </div>
        </div>
    @show
</div><!--/.main-->

<script src="{{ asset('static/js/jquery-1.11.3.min.js') }}"></script>
<script src="{{ asset('static/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('static/js/chart.min.js') }}"></script>
@section('javascript')

@show


</body>

</html>
