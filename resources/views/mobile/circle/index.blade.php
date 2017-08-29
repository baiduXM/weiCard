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
                <a class="opshow-create item" data-display="modal" data-backdrop="true"
                   data-target="#editGroupModal" data-url="{{ url()->current() }}"
                        {{ Auth::user()->employee || Auth::user()->company ? '' : 'disabled="disabled"' }}>
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
                               data-url="{{ url()->current().'/'. $item['id']}}"
                            {{ Auth::id() == $item->user_id ? '' : 'disabled' }}>
                                <i class="icon icon-trash has-padding-sm"></i>
                            </a>
                            <a class="title" href="{{ url('circle/'.$item->id) }}">
                                {{--data-display="modal" data-backdrop="true" data-target="#editGroupModal"--}}
                                {{--data-url="{{ url()->current().'/'. $item['id']}}">--}}
                                <span class="group-title">{{ $item->name }}</span>
                                <label class="info has-padding-h has-margin-sm">{{ count($item->users) }}
                                    / {{ $item->limit>0 ? $item->limit: '∞' }}</label>
                                {!! $item->expired_time ? '<label class="primary has-padding-h">临时</label>' : '' !!}
                            </a>
                        </div>
                    </div>
                @endforeach
            @endif
        </section>
    </div>
@stop
@section('modal')
    {{--添加/编辑圈子--}}
    <div id="editGroupModal" class="modal affix dock-bottom enter-from-bottom fade">
        <form action="" method="post" onsubmit="return false;">
            <div class="heading divider">
                <div class="title modal-title">创建圈子</div>
                <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
            </div>
            <div class="content has-padding">
                <div class="control error-name" id="">
                    <label for="Circle[name]">名称</label>
                    <input class="input" type="text" id="Circle[name]" name="Circle[name]" value="">
                    <p class="help-text"></p>
                </div>
                <div class="control error-expired_at">
                    <label>人数</label>
                    @if(Auth::user()->company)
                        <div class="radio inline-block">
                            <input id="limit_not" type="radio" name="Circle[limit]" value="0" checked>
                            <label for="limit_not">无限制</label>
                        </div>
                    @endif
                    <div class="radio inline-block">
                        <input id="limit_30" type="radio" name="Circle[limit]" value="30">
                        <label for="limit_30">30人</label>
                    </div>
                    <div class="radio inline-block">
                        <input id="limit_100" type="radio" name="Circle[limit]" value="100">
                        <label for="limit_100">100人</label>
                    </div>
                    <p class="help-text"></p>
                </div>
                <div class="control error-expired_time">
                    <label>有效期</label>
                    @if(Auth::user()->company)
                        <div class="radio inline-block">
                            <input type="radio" name="Circle[expired_time]" id="expired_not" value="0" checked>
                            <label for="expired_not">永久</label>
                        </div>
                    @endif
                    <div class="radio inline-block">
                        <input type="radio" name="Circle[expired_time]" id="expired_3" value="3">
                        <label for="expired_3">3天</label>
                    </div>
                    <div class="radio inline-block">
                        <input type="radio" name="Circle[expired_time]" id="expired_7" value="7">
                        <label for="expired_7">7天</label>
                    </div>
                    <p class="help-text"></p>
                </div>
            </div>
            <div class="footer has-padding">
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
            $('.opshow-create').unbind('click', 'touchstart', 'tap').bind('tap', function (event) {
                var _this  = $(this);
                var _modal = _this.data('target');
                $(_modal).find('.modal-title').text('创建圈子');
                $(_modal).find('.input').val('');
            });

        });

        /**
         * 调用ajax
         */
        function useAjax(type, url) {
            $.ajax({
                type: type,
                url: url,
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
                success: function (data) {
                    /* 现实成功消息，刷新当前页面 */
                    $.messager.show("<i class='icon-info'>  " + data + "</i>", {
                        type: 'success', placement: 'center', autoHide: 1000, closeButton: false,
                    });
                    // once = true;
                },
            });
        }
    </script>
@stop

