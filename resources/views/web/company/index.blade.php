@extends('web.common.layout')
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
        <div class="myCard-content main-cont rt-main" id="company">
            @if(!Auth::user()->employee){{--没绑定员工--}}
                <div class="alert alert-info alert-dismissible" role="alert">
                    未发现您的公司信息
                </div>
                <p>
                    去 <a href="{{ url('user') }}">绑定员工</a> 或 联系客服注册公司
                </p>
            @elseif(!Auth::user()->company){{--绑定员工/普通员工--}}
                @if($company->status == $company::VERIFIED_SUCCEED)
                    @include('web.company.show'){{--显示公司资料--}}
                @else
                    <div class="alert alert-info alert-dismissible" role="alert">
                        公司未通过审核，暂时无法显示资料
                    </div>
                @endif
            @else{{--绑定员工/创始人--}}
                @if($company->status == $company::VERIFIED_ING){{--判断公司审核状态--}}
                    <div class="alert alert-info alert-dismissible" role="alert">
                        审核中（提交日期:{{ $company->updated_at->format('Y-m-d') }}）我们将在2~3个工作日内审核完成
                    </div>
                @elseif($company->status == $company::VERIFIED_SUCCEED)
                    <div class="alert alert-success alert-dismissible" role="alert">
                        审核通过（{{ $company->updated_at->format('Y-m-d') }}）
                    </div>
                @elseif($company->status == $company::VERIFIED_FAILED)
                    <div class="alert alert-info alert-dismissible" role="alert">
                        审核失败（原因：{{ $company->reason }}）
                    </div>
                @endif
                @include('web.company.edit'){{--显示公司资料/可编辑--}}
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
            window.location.href = 'company/binding';
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