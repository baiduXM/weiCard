@extends('mobile.common.mzui')
@section('title', '名片圈')
@section('css')
    <link href="{{ asset('static/lib/mzui/css/mzui.min.css') }}" rel="stylesheet">
@stop
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container display ">
        <section class="section">
            <div class="list divider">
                <a class="opshow-create item" data-display="modal" data-backdrop="true" data-target="#editGroupModal"
                   data-url="{{ url()->current() }}">
                    <div class="btn primary">
                        <i class="icon icon-plus has-padding-sm"></i>
                    </div>
                    <div class="title ">创建圈子</div>
                </a>
            </div>
            @if(isset($circles))
                @foreach($circles as $item)
                    <div class="list divider">
                        <div class="item" id="{{ $item->id }}">
                            <a class="opshow-delete btn danger "
                               data-display="modal" data-backdrop="true" data-target=".confirmModal"
                               data-url="{{ url()->current().'/'. $item['id']}}">
                                <i class="icon icon-trash has-padding-sm"></i>
                            </a>
                            <a class="title" href="{{ url('circle/'.$item->id) }}">
                                {{--data-display="modal" data-backdrop="true" data-target="#editGroupModal"--}}
                                {{--data-url="{{ url()->current().'/'. $item['id']}}">--}}
                                <span class="group-title">{{ $item->name }}</span>
                                <label class="info has-padding-h has-margin-sm">{{ count($item->users) }}</label>
                                {!! $item->expired_at ? '<label class="primary has-padding-h">临时</label>' : '' !!}
                            </a>
                        </div>
                    </div>
                @endforeach
            @endif
        </section>
    </div>
    {{--侧边悬浮按钮--}}
    <nav class="affix dock-bottom dock-left shadow-none has-margin-sm column align-start">
        <a class="btn btn-lg circle primary outline"
           href="{{ url()->previous() == url()->current() ? url('cardcase') : url()->previous() }}">
            <i class="icon icon-chevron-left"></i>
        </a>
    </nav>
@stop
@section('modal')
    {{--添加群成员--}}
    <div id="editMemberModal" class="modal affix dock enter-from-center fade ">
        <form action="" method="put" onsubmit="return false;">
            <div class="heading divider">
                <div class="title">分组成员</div>
                <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
            </div>
            <div class="content has-padding">
                {{--<div class="heading">成员 <label >(12)</label></div>--}}
                {{--<div class="list divider row in-group">--}}
                {{--已分组成员--}}
                {{--</div>--}}
                <div class="heading">未分组</div>
                <div class="list divider row not-in-group">
                    {{--未分组成员--}}
                </div>
            </div>
            <div class="footer has-padding affix dock-bottom">
                <input type="reset" class="btn-lg danger" data-dismiss="display" value="取消">
                <input type="submit" class="op-submit btn-lg primary pull-right" value="确认">
            </div>
        </form>
    </div>


@stop
@section('javascript')
    <script>
        $(function () {

            /* 添加 */
            $('.opshow-create').unbind('click', 'touchstart', 'tap').bind('tap', function () {
                var _this  = $(this);
                var _modal = _this.data('target');
                $(_modal).find('.modal-title').text('创建圈子');
                $(_modal).find('.input').val('');
            });

            /* 编辑 */
            $('.opshow-edit').unbind('click', 'touchstart', 'tap').bind('tap', function () {
                var _this  = $(this);
                var _modal = _this.data('target');
                $(_modal).find('.modal-title').text('编辑分组名');
                $(_modal).find('.input').val($.trim(_this.find('.group-title').text()));
            });

        });


    </script>
@stop

