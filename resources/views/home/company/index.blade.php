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
        <div class="myCard-content rt-main" id="company" data-id="{{ $user->company_id }}">
            @if(!$user->company_id){{--判断是否没绑定公司--}}
                <p>
                    未发现您的公司信息
                </p>
                <p class="add-btn">
                    <button class="btnCreate">注册公司</button>
                    <button class="btnBinding">绑定公司</button>
                </p>
            @elseif(!$company){{--判断绑定的公司是否不存在--}}
                <p>
                    您关联的公司可能已被注销
                </p>
                <p class="add-btn">
                    <button class="btnCreate">注册公司</button>
                    <button class="btnBinding">绑定公司</button>
                </p>
            @elseif($company->user_id == $user->id){{--判断是否是公司注册人--}}
                @if($company->status == $company::VERIFIED_ING){{--判断审核状态--}}
                    <p>
                        审核中（{{ $company->updated_at->format('Y-m-d') }}）我们将在2~3个工作日内审核完成
                    </p>
                    <p class="add-btn">
                        <button class="btnShow">查看资料</button>
                        <button class="btnEdit">更改资料</button>
                    </p>
                @elseif($company->status == $company::VERIFIED_SUCCEED)
                    <p>
                        审核通过（公司资料）
                    </p>
                    <p class="add-btn">
                        <a href="javascript:" data-toggle="modal" data-target=".bs13"><i class="iconFont">&#xe6d3;</i></a>
                        <button class="btnDestroy">注销公司</button>
                        <button class="btnEdit">更改资料</button>
                    </p>
                @elseif($company->status == $company::VERIFIED_FAILED)
                    <p>
                        审核失败（失败原因）
                    </p>
                    <p class="add-btn">
                        <button class="btnEdit">更改资料</button>
                        <button class="btnAbandon">放弃注册</button>
                    </p>
                @endif
            @else{{--不是公司注册人--}}
                @if($company->status == $company::VERIFIED_ING){{--判断审核状态--}}
                    <p>
                        审核中（提交日期）我们将在2~3个工作日内审核完成
                    </p>
                @elseif($company->status == $company::VERIFIED_SUCCEED)
                    <p>
                        审核通过（公司资料）
                    </p>
                    <p class="add-btn">
                        <button class="btnQuit">退出公司</button>
                    </p>
                @elseif($company->status == $company::VERIFIED_FAILED)
                    <p>
                        审核失败（失败原因）
                    </p>
                    <p class="add-btn">
                        <button class="btnEdit">绑定公司</button>
                    </p>
                @endif
            @endif
        </div><!--主要内容-->
    </div>
@stop

@section('javascript')
    <script>
        $('.btnCreate').click(function () { // 注册
            window.location.href = 'company/create';
        });
        $('.btnBinding').click(function () { // 绑定
            window.location.href = 'company/banding';
        });
        $('.btnShow').click(function () { // 查看
            var company_id = $('#company').data('id');
            window.location.href = 'company/' + company_id;
        });
        $('.btnEdit').click(function () { // 编辑
            var company_id = $('#company').data('id');
            window.location.href = 'company/' + company_id + '/edit';
        });
        $('.btnQuit').click(function () { // 退出
            var company_id = $('#company').data('id');
            window.location.href = 'company/' + company_id + '/quit';
        });
        $('.btnDestroy').click(function () { // 注销
            var company_id = $('#company').data('id');
            window.location.href = 'company/' + company_id + '/destroy';
        });

    </script>
@stop