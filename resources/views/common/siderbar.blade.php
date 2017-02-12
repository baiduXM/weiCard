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
            <li class="{{ Request::path() == 'admin/member' || Request::is('admin/member/*') ? 'active' : '' }}">
                <a href="{{ url('admin/member') }}"><span class="glyphicon glyphicon-stats"></span>客服管理</a>
            </li>
            <li class="{{ Request::path() == 'admin/setting' ? 'active' : '' }}">
                <a href="{{ url('admin/setting') }}"><span class="glyphicon glyphicon-stats"></span>设置</a>
            </li>
            <!--<li class="parent ">
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
            </li>-->

            <li role="presentation" class="divider"></li>

            <li><a href="login.html"><span class="glyphicon glyphicon-user"></span> Login Page</a></li>

        </ul>
    </div>