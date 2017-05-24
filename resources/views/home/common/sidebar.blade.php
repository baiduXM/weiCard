<div class="m-nav lt navbar navbar-default ">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav_list">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="#" class="navbar-brand"></a>
    </div><!--手机导航-->
    <div class="nav-list main-nav collapse navbar-collapse " id="nav_list">
        <div class="tree_box nav ">
            <h3 {{ Request::path() == 'user' || Request::is('user/*') ? 'class=h3-active' : '' }}>
                <a href="javascript:"><em class="iconFont">&#xe711;</em>我的名片
                    @if(Request::path() == 'user' || Request::is('user/*'))
                        <i class="nav-j"></i>
                    @else
                        <i></i>
                    @endif
                </a>
            </h3>
            <ul class="tree_one" {{ Request::path() == 'user' || Request::is('user/*') ? 'style=display:block;' : '' }}>
                <li {{ Request::path() == 'user' ? 'class=active' : '' }}>
                    <a href="{{ url('user') }}">我的名片</a></li>
                <li {{ Request::path() == 'user/edit' ? 'class=active' : '' }}>
                    <a href="{{ url('user/edit') }}">个人信息</a></li>
            </ul>
        </div><!--我的名片-->
        <div class="tree_box nav ">
            <h3 {{ Request::path() == 'cardcase' || Request::is('cardcase/*') ? 'class=h3-active' : '' }}>
                <a href="javascript:"><em class="iconFont">&#xe644;</em>名片夹
                    {{--{{ Request::path() }}--}}
                    @if(Request::path() == 'cardcase' || Request::is('cardcase/*'))
                        <i class="nav-j"></i>
                    @else
                        <i></i>
                    @endif
                </a>
            </h3>
            <ul class="tree_one" {{ Request::path() == 'cardcase' || Request::is('cardcase/*') ? 'style=display:block;' : '' }}>
                <li {{ Request::path() == 'cardcase' ? 'class=active' : '' }}>
                    <a href="{{ url('cardcase') }}">我的名片夹</a></li>
                {{--<li {{ Request::path() == 'cardcase/tag' ? 'class=active' : '' }}>--}}
                {{--<a href="{{ url('cardcase/tag') }}">设置标签</a></li>--}}
            </ul>
        </div><!--名片夹-->
        @if(Auth::user()->company)
            <div class="tree_box nav">
                <h3 {{ Request::path() == 'company' || Request::is('company/*') ? 'class=h3-active' : '' }}>
                    <a href="javascript:"><em class="iconFont">&#xe658;</em>我的公司
                        @if(Request::path() == 'company' || Request::is('company/*'))
                            <i class="nav-j"></i>
                        @else
                            <i></i>
                        @endif
                    </a>

                </h3>
                <ul class="tree_one" {{ Request::path() == 'company' || Request::is('company/*') ? 'style=display:block;' : '' }}>
                    <li {{ Request::path() == 'company' || Request::is('company/create') ? 'class=active' : '' }}>
                        <a href="{{ url('company') }}">我的公司</a></li>
                    <li {{ Request::path() == 'company/employee' ? 'class=active' : '' }}>
                        <a href="{{ url('company/employee') }}">公司同事</a></li>
                    <li {{ Request::path() == 'company/product' ? 'class=active' : '' }}>
                        <a href="{{ url('company/product') }}">公司产品</a></li>
                    @if(Auth::user()->company)
                        {{--<li {{ Request::path() == 'company/department' ? 'class=active' : '' }}>--}}
                        {{--<a href="{{ url('company/department') }}">公司部门</a></li>--}}
                    @endif
                </ul>
            </div><!--我的公司-->

            <div class="tree_box nav ">
                <h3 {{ Request::path() == 'template' || Request::is('template/*') ? 'class=h3-active' : '' }}>
                    <a href="javascript:"><em class="iconFont">&#xe655;</em>模板中心
                        @if(Request::path() == 'template' || Request::is('template/*'))
                            <i class="nav-j"></i>
                        @else
                            <i></i>
                        @endif
                    </a>
                </h3>
                <ul class="tree_one" {{ Request::path() == 'template' || Request::is('template/*') ? 'style=display:block;' : '' }}>
                    <li {{ Request::path() == 'template/type/u' ? 'class=active' : '' }}>
                        <a href="{{ url('template/type/u') }}">个人模板</a></li>
                    <li {{ Request::path() == 'template/type/c' ? 'class=active' : '' }}>
                        <a href="{{ url('template/type/c') }}">公司模板</a></li>
                    {{--<li {{ Request::path() == 'template/free' ? 'class=active' : '' }}>--}}
                    {{--<a href="{{ url('template/free') }}">免费模板</a></li>--}}
                </ul>
            </div><!--模板中心-->
        @endif
        {{--<div class="tree_box nav ">--}}
        {{--<h3 {{ Request::path() == 'security' || Request::is('security/*') ? 'class=h3-active' : '' }}>--}}
        {{--<a href="javascript:"><em class="iconFont">&#xe603;</em>安全中心--}}
        {{--@if(Request::path() == 'security' || Request::is('security/*'))--}}
        {{--<i class="nav-j"></i>--}}
        {{--@else--}}
        {{--<i></i>--}}
        {{--@endif--}}
        {{--</a>--}}
        {{--</h3>--}}
        {{--<ul class="tree_one" {{ Request::path() == 'security' || Request::is('security/*') ? 'style=display:block;' : '' }}>--}}
        {{--<li {{ Request::path() == 'security' ? 'class=active' : '' }}>--}}
        {{--<a href="{{ url('security') }}">验证中心</a></li>--}}
        {{--<li {{ Request::path() == 'security/email' ? 'class=active' : '' }}>--}}
        {{--<a href="{{ url('security/email') }}">验证邮箱</a></li>--}}
        {{--<li {{ Request::path() == 'security/binding' ? 'class=active' : '' }}>--}}
        {{--<a href="{{ url('security/binding') }}">第三方绑定</a></li>--}}
        {{--<li {{ Request::path() == 'security/password' ? 'class=active' : '' }}>--}}
        {{--<a href="{{ url('security/password') }}">修改密码</a></li>--}}
        {{--</ul>--}}
        {{--</div><!--安全中心-->--}}
    </div>
</div>