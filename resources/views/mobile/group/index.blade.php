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
                               data-url="{{ url()->current().'/'. $item['id']}}">{{ $item['name'] }}</a>
                            <a class="opshow-show btn {{ $item['id'] == 0 ? 'disabled' : '' }}"
                               data-display="modal" data-backdrop="true" data-target="#editMemberModal"
                               data-url="{{ url()->current().'/'. $item['id']}}">
                                <i class="icon icon-group has-padding-sm"></i>
                            </a>
                            <a class="btn {{ $item['id'] == 0 ? 'disabled' : '' }}">
                                <i class="icon icon-bars has-padding-sm"></i>
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
        <form action="" method="post" onsubmit="return false;">
            <div class="heading divider">
                <div class="title">编辑组员 <label class="info has-padding-h">12</label></div>
                <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
            </div>
            <div class="content has-padding">
                {{--<form id="groupForm" action="{{ url()->current() }}" method="post">--}}
                {{--{{ csrf_field() }}--}}
                <div class="heading">成员</div>
                <div class="list divider row in-group">
                    <div class="checkbox cell-6 with-avatar text-ellipsis" style="overflow: hidden">
                        <input type="checkbox" name="buyMethod">
                        <label for="buyMethod">{{ '言身寸言身寸言身寸12' }}
                            <span class="warning has-padding-h rounded">个人</span>
                        </label>
                    </div>
                    <div class="checkbox cell-6">
                        <input type="checkbox" name="buyMethod">
                        <label for="buyMethod">{{ '王大可' }}
                            <span class="primary has-padding-h rounded">企业</span>
                        </label>
                    </div>
                    <div class="checkbox cell-6">
                        <input type="checkbox" name="buyMethod">
                        <label for="buyMethod">羊习习</label>
                    </div>
                </div>
                <div class="heading">未分组</div>
                <div class="list divider row">
                    <div class="checkbox cell-6">
                        <input type="checkbox" name="buyMethod">
                        <label for="buyMethod">{{ '王大可' }}
                            <span class="primary has-padding-h rounded">企业</span>
                        </label>
                    </div>
                    <div class="checkbox cell-6">
                        <input type="checkbox" name="buyMethod">
                        <label for="buyMethod">{{ '王大可' }}
                            <span class="primary has-padding-h rounded">企业</span>
                        </label>
                    </div>
                </div>
                {{--</form>--}}
            </div>
            <div class="footer has-padding affix dock-bottom">
                <input type="reset" class="btn danger" data-dismiss="display" value="取消">
                <input type="submit" class="btn primary pull-right" value="确认">
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
                $(_modal).find('.input').val(_this.text());
            });

            /* 显示 */
            $('.opshow-show').click(function () {
                var _this  = $(this);
                var _modal = $(_this.data('target'));
//                var _modal    = _this.parents('.modal');
                var _form  = _modal.children('form');
                var _url   = _this.data('url');
                console.log(_modal);
                console.log(_form);
                $.ajax({
                    type: 'get',
                    url: _url,
                    dataType: 'json',
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
                    success: function (data) {
                        console.log('success')
                        console.log(data)
                        /* 现实成功消息，刷新当前页面 */
//                        $.Display.dismiss(_modal.data('display-name'));
//                        $.messager.show("<i class='icon-check'>  " + data + "</i>", {
//                            type: 'success', placement: 'center', autoHide: 800, closeButton: false
//                        });
//                        setTimeout(window.location.href = _url, 1); // 1s后刷新页面
                    },
                    error: function (data) {
                        console.log('error')

                        console.log(data)

                        /* 显示错误 */
//                        var errors = JSON.parse(data.response);
//                        showError(_modal, errors);
                    }
                });
            });


        });


        /* 显示成员 */
        function showMember(data, select == true) {

        }


    </script>
@stop

