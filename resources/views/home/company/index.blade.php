@extends('home.common.layout')
@section('title', '公司')
@section('content')
    <div id="myCard">
    @section('breadcrumb')
        {!! Breadcrumbs::render('company') !!}
    @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">我的公司</a>
            </li>
        </ul><!--tab切换标签-->
        <div class="myCard-content rt-main">
            @if($company)

                @if($company->status == 0)
                    认证中（查看资料）
                @elseif($company->status == 1)
                    认证通过（注销公司）
                @elseif($company->status == 2)
                    认证失败（修改信息，重写提交）
                @elseif($company->status == 3)
                    资料变更，需要重新认证
                @endif
                @if($company->user_id == Auth::id())
                    注销公司，修改公司资料
                @endif
            @else
                <p>
                    未发现您的公司信息
                </p>
                <p class="add-btn">
                    <button class="btnRegister">注册公司</button>
                    <button class="btnBinding">绑定公司</button>
                </p>
            @endif
        </div><!--主要内容-->

    </div>
@stop

@section('javascript')
    <script>
        $('.btnRegister').click(function () {
            window.location.href = 'company/create';
        });
        $('.btnBinding').click(function () {
            window.location.href = 'company/banding';
        });

    </script>
@stop