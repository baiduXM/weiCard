<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
    </form>

    <ul class="nav menu">
        <li class="{{ Request::path() == 'admin/index' ? 'active' : '' }}">
            <a href="{{ url('admin/index') }}"><span class="glyphicon glyphicon-dashboard"></span>首页</a>
        </li>

        <li class="parent ">
            <a data-toggle="collapse" href="#sub-item-1" class="icon">
                <span class="glyphicon glyphicon-list"></span> 用户模块组
                <span class="pull-right">
                    <em class="glyphicon glyphicon-s glyphicon-plus"></em>
                </span>
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li class="{{ Request::path() == 'admin/user' || Request::is('admin/user/*') ? 'active' : '' }}">
                    <a href="{{ url('admin/user') }}"><span class=" glyphicon glyphicon-th"></span>用户管理</a>
                </li>
                <li class="{{ Request::path() == 'admin/cardcase' || Request::is('admin/cardcase/*')  ? 'active' : '' }}">
                    <a href="{{ url('admin/cardcase') }}"><span class="glyphicon glyphicon-stats"></span>名片夹管理</a>
                </li>
                <li class="{{ Request::path() == 'admin/tag' || Request::is('admin/tag/*')  ? 'active' : '' }}">
                    <a href="{{ url('admin/tag') }}"><span class="glyphicon glyphicon-stats"></span>标签管理</a>
                </li>
            </ul>
        </li>

        <li class="parent ">
            <a data-toggle="collapse" href="#sub-item-2" class="icon">
                <span class="glyphicon glyphicon-list"></span> 公司模块组
                <span class="pull-right">
                    <em class="glyphicon glyphicon-s glyphicon-plus"></em>
                </span>
            </a>
            <ul class="children collapse" id="sub-item-2">
                <li class="{{ Request::path() == 'admin/company' || Request::is('admin/company/*')  ? 'active' : '' }}">
                    <a href="{{ url('admin/company') }}"><span class="glyphicon glyphicon-stats"></span>公司管理</a>
                </li>
                <li class="{{ Request::path() == 'admin/department' || Request::is('admin/department/*')  ? 'active' : '' }}">
                    <a href="{{ url('admin/department') }}"><span class="glyphicon glyphicon-stats"></span>部门管理</a>
                </li>
                <li class="{{ Request::path() == 'admin/position' || Request::is('admin/position/*')  ? 'active' : '' }}">
                    <a href="{{ url('admin/position') }}"><span class="glyphicon glyphicon-stats"></span>职位管理</a>
                </li>
                <li class="{{ Request::path() == 'admin/employee' || Request::is('admin/employee/*')  ? 'active' : '' }}">
                    <a href="{{ url('admin/employee') }}"><span class="glyphicon glyphicon-stats"></span>员工管理</a>
                </li>
            </ul>
        </li>

        <li class="parent ">
            <a data-toggle="collapse" href="#sub-item-3" class="icon">
                <span class="glyphicon glyphicon-list"></span> 模板模块组
                <span class="pull-right">
                    <em class="glyphicon glyphicon-s glyphicon-plus"></em>
                </span>
            </a>
            <ul class="children collapse" id="sub-item-3">
                <li class="{{ Request::path() == 'admin/template' || Request::is('admin/template/*')  ? 'active' : '' }}">
                    <a href="{{ url('admin/template') }}"><span class="glyphicon glyphicon-stats"></span>模板管理</a>
                </li>
                <li class="{{ Request::path() == 'admin/tag' || Request::is('admin/tag/*')  ? 'active' : '' }}">
                    <a href="{{ url('admin/tag') }}"><span class="glyphicon glyphicon-stats"></span>标签管理</a>
                </li>
            </ul>
        </li>

        @if(Auth::guard('admin')->user()->name == 'admin' || Auth::guard('admin')->user()->is_super == 1)
            <li class="{{ Request::path() == 'admin/manager' || Request::is('admin/manager/*') ? 'active' : '' }}">
                <a href="{{ url('admin/manager') }}"><span class="glyphicon glyphicon-stats"></span>客服管理</a>
            </li>
        @endif

        <li class="parent ">
            <a data-toggle="collapse" href="#sub-item-4" class="icon">
                <span class="glyphicon glyphicon-list"></span> 设置
                <span class="pull-right">
                    <em class="glyphicon glyphicon-s glyphicon-plus {{ Request::path() == 'admin/setting' || Request::is('admin/setting/*') ? 'glyphicon-minus' : '' }}"></em>
                </span>
            </a>
            <ul class="children collapse {{ Request::path() == 'admin/setting' || Request::is('admin/setting/*') ? 'in' : '' }}" id="sub-item-4">
                <li class="{{ Request::path() == 'admin/setting/safety' ? 'active' : '' }}">
                    <a class="" href="{{ url('admin/setting/safety') }}">
                        <span class="glyphicon glyphicon-share-alt"></span> 安全设置
                    </a>
                </li>
                <li class="{{ Request::path() == 'admin/setting/person' ? 'active' : '' }}">
                    <a class="" href="{{ url('admin/setting/person') }}">
                        <span class="glyphicon glyphicon-share-alt"></span> 个人设置
                    </a>
                </li>
            </ul>
        </li>


        <li role="presentation" class="divider"></li>

        <li>
            <a href="{{ url('admin/logout') }}"><span class="glyphicon glyphicon-stats"></span>登出</a>
        </li>
    </ul>
</div>