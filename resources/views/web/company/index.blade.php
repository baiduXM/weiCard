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
            @if(Auth::user()->company)
                @include('web.company.edit'){{--显示公司资料/可编辑--}}
            @else
                <p class="add-btn">
                    <button class="btnBinding" data-toggle="modal" data-target=".bs10" data-url="company/binding">绑定员工
                    </button>
                </p>
            @endif

        </div><!--主要内容-->
    </div>
@stop
@section('modal-extend')
    <!-- 绑定公司/员工modal -->
    <div class="modal fade bs10" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content modal1">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">绑定公司</h4>
                </div>
                <form action="company/binding" method="post">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <p><span>公司账号 : </span><input type="text" name="code"></p>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" value="保存">
                        <input type="reset" data-dismiss="modal" value="取消">
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop
@section('javascript')
    <script>
//        $('.btnCreate').click(function () { // 注册
//            window.location.href = 'company/create';
//        });
//        $('.btnBinding').click(function () { // 绑定
//            window.location.href = 'company/binding';
//        });
//        $('.btnShow').click(function () { // 查看
//            var company_id       = $('#company').data('id');
//            window.location.href = 'company/' + company_id;
//        });
//        $('.btnEdit').click(function () { // 编辑
//            var company_id       = $('#company').data('id');
//            window.location.href = 'company/' + company_id + '/edit';
//        });
//        $('.btnQuit').click(function () { // 退出
//            var company_id       = $('#company').data('id');
//            window.location.href = 'company/' + company_id + '/quit';
//        });
//        $('.btnDestroy').click(function () { // 注销
//            var company_id       = $('#company').data('id');
//            window.location.href = 'company/' + company_id + '/destroy';
//        });

    </script>
@stop