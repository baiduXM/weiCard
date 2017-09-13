@extends('web.common.layout')
@section('title', '名片')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('user') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a>我的名片</a>
            </li>
        </ul><!--tab标签-->
        <div class="myCard-content  main-cont">
            @if(Auth::user()->employee)
                <div class="tab-pane card-a">
                    <iframe src="{{ url('/cardcase/show/e') }}" width="320" height="568" frameborder="0"
                            scrolling="auto"></iframe>
                    <iframe src="{{ url('/cardcase/show/u') }}" width="320" height="568" frameborder="0"
                            scrolling="auto"></iframe>
                    @include('web.common.share')
                </div>
            @else
                <p class="add-btn">
                    <button class="btnBinding" data-toggle="modal" data-target=".bs10" data-url="user/binding">绑定员工
                    </button>
                </p>
            @endif
        </div>
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
                    <h4 class="modal-title">绑定员工</h4>
                </div>
                <form action="user/binding" method="post">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <p><span>员工手机 : </span><input type="text" name="code"></p>
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
