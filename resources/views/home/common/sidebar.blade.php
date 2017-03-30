<div class="m-nav lt navbar navbar-default ">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav_list">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="#" class="navbar-brand"></a>
    </div>
    <div class="nav-list main-nav collapse navbar-collapse " id="nav_list">
        <div class="tree_box nav ">
            <h3><a href="javascript:"><em class="iconFont">&#xe711;</em>我的名片 <i></i></a></h3>
            <ul class="tree_one ">
                <li><a href="{{ url('user/') }}">个人信息</a></li>
                <li><a href="">我的名片</a></li>
            </ul>
        </div>
        <div class="tree_box nav ">
            <h3><a href="javascript:"><em class="iconFont">&#xe644;</em>通讯录 <i></i> </a></h3>
            <ul class="tree_one">
                <li><a href="{{ url('contact') }}">我的通讯录</a></li>
                <li><a href="{{ url('contact/group') }}">设置分组</a></li>
            </ul>
        </div>
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
                <li {{ Request::path() == 'company' ? 'class=active' : '' }}>
                    <a href="{{ url('company') }}">我的公司</a></li>
                <li {{ Request::path() == 'company/register' ? 'class=active' : '' }}>
                    <a href="{{ url('company/register') }}">注册公司</a></li>
                <li {{ Request::path() == 'company/department' ? 'class=active' : '' }}>
                    <a href="{{ url('company/department') }}">公司部门</a></li>
                <li {{ Request::path() == 'company/employee' ? 'class=active' : '' }}>
                    <a href="{{ url('company/employee') }}">添加员工</a></li>
                <li {{ Request::path() == 'company/workmate' ? 'class=active' : '' }}>
                    <a href="{{ url('company/workmate') }}">我的同事</a></li>
            </ul>
        </div>
        <div class="tree_box nav ">
            <h3><a href="javascript:"><em class="iconFont">&#xe655;</em>模板中心 <i></i> </a></h3>
            <ul class="tree_one">
                <li><a href="">收费模板</a></li>
                <li><a href="">免费模板</a></li>
            </ul>
        </div>
        <div class="tree_box nav ">
            <h3><a href="javascript:"><em class="iconFont">&#xe603;</em>安全中心 <i></i> </a></h3>
            <ul class="tree_one">
                <li><a href="">验证中心</a></li>
                <li><a href="">验证邮箱</a></li>
                <li><a href="">绑定第三方账号</a></li>
                <li><a href="">修改密码</a></li>
            </ul>
        </div>
    </div>
</div>