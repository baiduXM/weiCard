<div class="side-left wow bounceInDown animated">
    <div class="con-left-nav">
        <ul class="ce">
            <li class="{{ Request::path() == 'index' ? 'current' : '' }}">
                <a class=" xz " href="{{ url('/') }}">首页</a>
            </li>
            <li class="{{ Request::path() == 'company' || Request::is('company/*') ? 'current' : '' }}">
                <a class=" xz" href="{{ url('/company') }}">企业基本信息</a>
            </li>
            <li class="{{ Request::path() == 'template' || Request::is('template/*') ? 'current' : '' }}">
                <a class=" xz" href="{{ url('/template') }}">模板选择</a>
            </li>
            <li class="{{ Request::path() == 'employee' || Request::is('employee/*') ? 'current' : '' }}">
                <a class=" xz" href="javascript:;">企业员工管理<i class="a_down"></i></a>
                <ul class="er">
                    <li class="e_li"><a href="{{ url('employee/create') }}">栏目管理</a>
                    </li>
                    <li class="e_li"><a href="javascript:;">二级分类</a>
                        <ul class="thr">
                            <li><a href="">三级列表</a></li>
                            <li><a href="">三级分类 </a></li>
                            <li><a href="">三级分类页</a></li>
                            <div class="clear"></div>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="{{ Request::path() == 'contact' || Request::is('contact/*') ? 'current' : '' }}">
                <a class=" xz" href="{{ url('/contact') }}">通讯录</a>
            </li>
            <li class="{{ Request::path() == 'user' || Request::is('user/*') ? 'current' : '' }}">
                <a class=" xz" href="{{ url('/user') }}">个人中心</a>
            </li>

            @if(Auth::user()->name == 'admin' || Auth::user()->is_admin === 1)
                <li class="">
                    <a class=" xz" href="{{ url('/admin') }}" target="_blank">管理后台</a>
                </li>
            @endif
            <li class="">
                <a class=" xz" href="{{ url('/logout') }}">退出</a>
            </li>

            <div class="clear"></div>
        </ul>
    </div>
</div>