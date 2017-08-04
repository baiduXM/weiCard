<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
    </form>

    <ul class="nav menu">
        <li class="{{ Request::path() == 'mpmanager/index' ? 'active' : '' }}">
            <a href="{{ url('mpmanager/index') }}"><span class="glyphicon glyphicon-dashboard"></span>首页</a>
        </li>

        <li class="parent ">
            <a data-toggle="collapse" href="#sub-item-1" class="icon">
                <span class="glyphicon glyphicon-list"></span> 用户模块组
                <span class="pull-right">
                    <em class="glyphicon glyphicon-s glyphicon-plus {{ Request::path() == 'mpmanager/user' || Request::is('mpmanager/user*') ? 'glyphicon-minus' : '' }}"></em>
                </span>
            </a>
            <ul class="children collapse {{ Request::path() == 'mpmanager/user' || Request::is('mpmanager/user*') ? 'in' : '' }}"
                id="sub-item-1">
                <li class="{{ Request::path() == 'mpmanager/user' || Request::is('mpmanager/user/*') ? 'active' : '' }}">
                    <a href="{{ url('mpmanager/user') }}"><span class=" glyphicon glyphicon-th"></span>用户管理</a>
                </li>
                <li class="{{ Request::path() == 'mpmanager/user_cardcase' || Request::is('mpmanager/user_cardcase/*')  ? 'active' : '' }}">
                    <a href="{{ url('mpmanager/user_cardcase') }}"><span class="glyphicon glyphicon-stats"></span>名片夹管理</a>
                </li>
                <li class="{{ Request::path() == 'mpmanager/user_group' || Request::is('mpmanager/user_group/*')  ? 'active' : '' }}">
                    <a href="{{ url('mpmanager/user_group') }}"><span class="glyphicon glyphicon-stats"></span>分组管理</a>
                </li>
            </ul>
        </li>

        <li class="parent ">
            <a data-toggle="collapse" href="#sub-item-2" class="icon">
                <span class="glyphicon glyphicon-list"></span> 公司模块组
                <span class="pull-right">
                    <em class="glyphicon glyphicon-s glyphicon-plus {{ Request::path() == 'mpmanager/company' || Request::is('mpmanager/company*') ? 'glyphicon-minus' : '' }}"></em>
                </span>
            </a>
            <ul class="children collapse {{ Request::path() == 'mpmanager/company' || Request::is('mpmanager/company*') ? 'in' : '' }}"
                id="sub-item-2">
                <li class="{{ Request::path() == 'mpmanager/company' || Request::is('mpmanager/company/*')  ? 'active' : '' }}">
                    <a href="{{ url('mpmanager/company') }}"><span class="glyphicon glyphicon-stats"></span>公司管理</a>
                </li>
                <li class="{{ Request::path() == 'mpmanager/company_department' || Request::is('mpmanager/company_department/*')  ? 'active' : '' }}">
                    <a href="{{ url('mpmanager/company_department') }}"><span class="glyphicon glyphicon-stats"></span>部门管理</a>
                </li>
                {{--<li class="{{ Request::path() == 'mpmanager/company_position' || Request::is('mpmanager/company_position/*')  ? 'active' : '' }}">--}}
                    {{--<a href="{{ url('mpmanager/company_position') }}"><span--}}
                                {{--class="glyphicon glyphicon-stats"></span>职位管理</a>--}}
                {{--</li>--}}
                <li class="{{ Request::path() == 'mpmanager/company_employee' || Request::is('mpmanager/company_employee/*')  ? 'active' : '' }}">
                    <a href="{{ url('mpmanager/company_employee') }}"><span
                                class="glyphicon glyphicon-stats"></span>员工管理</a>
                </li>
                <li class="{{ Request::path() == 'mpmanager/company_product' || Request::is('mpmanager/company_product/*')  ? 'active' : '' }}">
                    <a href="{{ url('mpmanager/company_product') }}"><span
                                class="glyphicon glyphicon-stats"></span>产品管理</a>
                </li>
            </ul>
        </li>

        <li class="parent ">
            <a data-toggle="collapse" href="#sub-item-3" class="icon">
                <span class="glyphicon glyphicon-list"></span> 模板模块组
                <span class="pull-right">
                    <em class="glyphicon glyphicon-s glyphicon-plus {{ Request::path() == 'mpmanager/template' || Request::is('mpmanager/template*') ? 'glyphicon-minus' : '' }}"></em>
                </span>
            </a>
            <ul class="children collapse {{ Request::path() == 'mpmanager/template' || Request::is('mpmanager/template*') ? 'in' : '' }}"
                id="sub-item-3">
                <li class="{{ Request::path() == 'mpmanager/template' || Request::is('mpmanager/template/*')  ? 'active' : '' }}">
                    <a href="{{ url('mpmanager/template') }}"><span class="glyphicon glyphicon-stats"></span>模板管理</a>
                </li>
                {{--<li class="{{ Request::path() == 'mpmanager/template_tag' || Request::is('mpmanager/template_tag/*')  ? 'active' : '' }}">--}}
                {{--<a href="{{ url('mpmanager/template_tag') }}"><span class="glyphicon glyphicon-stats"></span>标签管理</a>--}}
                {{--</li>--}}
            </ul>
        </li>

        @if(Auth::guard('admin')->user()->name == 'admin' || Auth::guard('admin')->user()->is_super == 1)
            <li class="{{ Request::path() == 'mpmanager/manager' || Request::is('mpmanager/manager/*') ? 'active' : '' }}">
                <a href="{{ url('mpmanager/manager') }}"><span class="glyphicon glyphicon-stats"></span>系统管理员</a>
            </li>
        @endif

        {{--<li class="parent ">--}}
        {{--<a data-toggle="collapse" href="#sub-item-4" class="icon">--}}
        {{--<span class="glyphicon glyphicon-list"></span> 设置--}}
        {{--<span class="pull-right">--}}
        {{--<em class="glyphicon glyphicon-s glyphicon-plus {{ Request::path() == 'mpmanager/setting' || Request::is('mpmanager/setting/*') ? 'glyphicon-minus' : '' }}"></em>--}}
        {{--</span>--}}
        {{--</a>--}}
        {{--<ul class="children collapse {{ Request::path() == 'mpmanager/setting' || Request::is('mpmanager/setting/*') ? 'in' : '' }}"--}}
        {{--id="sub-item-4">--}}
        {{--<li class="{{ Request::path() == 'mpmanager/setting/safety' ? 'active' : '' }}">--}}
        {{--<a class="" href="{{ url('mpmanager/setting/safety') }}">--}}
        {{--<span class="glyphicon glyphicon-share-alt"></span> 安全设置--}}
        {{--</a>--}}
        {{--</li>--}}
        {{--<li class="{{ Request::path() == 'mpmanager/setting/person' ? 'active' : '' }}">--}}
        {{--<a class="" href="{{ url('mpmanager/setting/person') }}">--}}
        {{--<span class="glyphicon glyphicon-share-alt"></span> 个人设置--}}
        {{--</a>--}}
        {{--</li>--}}
        {{--</ul>--}}
        {{--</li>--}}

        <li role="presentation" class="divider"></li>

        <li>
            <a href="{{ url('mpmanager/logout') }}"><span class="glyphicon glyphicon-stats"></span>登出</a>
        </li>
    </ul>
</div>