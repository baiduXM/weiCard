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
        <li class="{{ Request::path() == 'admin/user' || Request::is('admin/user/*') ? 'active' : '' }}">
            <a href="{{ url('admin/user') }}"><span class=" glyphicon glyphicon-th"></span>用户管理</a>
        </li>
        <li class="{{ Request::path() == 'admin/company' || Request::is('admin/company/*')  ? 'active' : '' }}">
            <a href="{{ url('admin/company') }}"><span class="glyphicon glyphicon-stats"></span>公司管理</a>
        </li>
        <li class="{{ Request::path() == 'admin/template' || Request::is('admin/template/*')  ? 'active' : '' }}">
            <a href="{{ url('admin/template') }}"><span class="glyphicon glyphicon-stats"></span>模板管理</a>
        </li>
        <li class="{{ Request::path() == 'admin/administrator' || Request::is('admin/administrator/*') ? 'active' : '' }}">
            <a href="{{ url('admin/member') }}"><span class="glyphicon glyphicon-stats"></span>客服管理</a>
        </li>
        <li class="{{ Request::path() == 'admin/setting' || Request::is('admin/setting/*') ? 'active' : '' }}">
            <a href="{{ url('admin/setting') }}"><span class="glyphicon glyphicon-stats"></span>设置</a>
        </li>
        <li class="parent {{ Request::path() == 'admin/setting' || Request::is('admin/setting/*') ? 'active' : '' }}">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 设置
                <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right">
                            <em class="glyphicon glyphicon-s glyphicon-plus"></em>
                        </span>
            </a>
            <ul class="children collapse" id="sub-item-1">
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


    </ul>
</div>