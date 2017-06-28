@extends('mobile.common.mzui')
@section('title', '编辑 - 名片夹')
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
                    <div class="title ">新建分组</div>
                </a>
            </div>
            @if($groups)
                @foreach($groups as $item)
                    <div class="list divider">
                        <div class="item" id="{{ $item['id'] }}">
                            <a class="opshow-delete btn danger {{ $item['id'] == 0 ? 'disabled' : '' }}"
                               data-display="modal" data-backdrop="true" data-target=".confirmModal"
                               data-url="{{ url()->current().'/'. $item['id']}}">
                                <i class="icon icon-trash has-padding-sm"></i>
                            </a>
                            <a class="opshow-edit title {{ $item['id'] == 0 ? 'disabled' : '' }}"
                               data-display="modal" data-backdrop="true" data-target="#editGroupModal"
                               data-url="{{ url()->current().'/'. $item['id']}}">
                                {{ $item['name'] }}
                                <label class="info has-padding-h has-margin-sm">{{ $item['count'] }}</label>
                            </a>
                            {{--<a class="opshow-show btn {{ $item['id'] == 0 ? 'disabled' : '' }}"--}}
                            {{--data-display="modal" data-backdrop="true" data-target="#editMemberModal"--}}
                            {{--data-url="{{ url()->current().'/'. $item['id']}}">--}}
                            {{--<i class="icon icon-group has-padding-sm"></i>--}}
                            {{--</a>--}}
                            {{--<a class="btn {{ $item['id'] == 0 ? 'disabled' : '' }}">--}}
                            {{--<i class="icon icon-bars has-padding-sm"></i>--}}
                            {{--</a>--}}
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
                <input type="reset" class="btn danger" data-dismiss="display" value="取消">
                <input type="submit" class="op-submit btn primary pull-right" value="确认">
            </div>
        </form>
    </div>
    {{--添加/编辑分组--}}
    <div id="editGroupModal" class="modal affix dock-bottom enter-from-bottom fade">
        <form action="" method="post" onsubmit="return false;">
            <div class="heading divider">
                <div class="title modal-title">添加分组</div>
                <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
            </div>
            <div class="content has-padding">
                <div class="control error-name" id="">
                    <label for="Group[name]">名称</label>
                    <input class="input" type="text" id="Group[name]" name="Group[name]" value="">
                    <p class="help-text"></p>
                </div>
            </div>
            <div class="footer has-padding">
                <input type="reset" class="btn danger" data-dismiss="display" value="取消">
                <input type="submit" class="op-submit btn primary pull-right" value="确认">
            </div>
        </form>
    </div>

@stop
@section('javascript')
    <script>
        $(function () {

            /* 添加 */
            $('.opshow-create').click(function () {
                var _this  = $(this);
                var _modal = _this.data('target');
                $(_modal).find('.modal-title').text('添加分组');
            });

            /* 编辑 */
            $('.opshow-edit').click(function () {
                var _this  = $(this);
                var _modal = _this.data('target');
                $(_modal).find('.modal-title').text('编辑分组名');
                $(_modal).find('.input').val($.trim(_this.text()));
            });

            /* 显示组员 */
            $('.opshow-show').click(function () {
                var _this       = $(this);
                var _modal      = $(_this.data('target'));
                var _form       = $(_modal).find('form');
                var _url        = _this.data('url');
                var _group_name = $.trim(_this.siblings('.title').text());
                _modal.find('.title').text(_group_name); // 更新标题
                $.ajax({
                    type: 'get',
                    url: _url,
                    dataType: 'json',
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
                    success: function (data) {
                        var in_str     = joint(data.in_group, true);
                        var not_in_str = joint(data.not_in_group);
                        _form.find('.in-group').html(in_str);
                        _form.find('.not-in-group').html(not_in_str);
                    },
                });
            });
        });


        /* 拼接成员 */
        function joint(data, checked) {
            var str = '';
            if (data.length > 0) {
                $.each(data, function (k, v) {
                    str += '<div class="checkbox cell-6">';
                    str += '<input type="checkbox" id="cardcase' + v.id + '" name="ids[]" value="' + v.id + '"';
                    if (checked === true) {
                        str += ' checked>';
                    } else {
                        str += '>';
                    }
                    str += '<label for="cardcase' + v.id + '">' + v.follower.nickname;
                    if (v.follower_type == 'App\\Models\\User') {
                        str += '  <span class="warning has-padding-h rounded">个人</span></label>';
                    } else {
                        str += '  <span class="primary has-padding-h rounded">企业</span></label>';
                    }
                    str += '</div>';
                });
            } else {
                str = '<div class="cell-12"><label for="buyMethod">该组暂无成员</label></div>';
            }
            return str;
        }


    </script>
@stop

