@extends('mzui.common.layout')
@section('title', '编辑 - 名片夹')
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container display ">
        <section class="section">
            <div class="list divider">
                <a class="item" data-display="modal" data-backdrop="true" data-target="#editGroupModal">
                    <div class="btn primary ">
                        <i class="icon icon-plus has-padding-sm"></i>
                    </div>
                    <div class="title ">&nbsp;&nbsp;新建分组</div>
                </a>
            </div>
            @if($groups)
                @foreach($groups as $item)
                    <div class="list divider">
                        <div class="item" id="{{ $item['id'] }}">
                            <a class="btn danger {{ $item['id'] == 0 ? 'disabled' : '' }}"><i
                                        class="icon icon-trash has-padding-sm"></i></a>
                            <a class="title {{ $item['id'] == 0 ? 'disabled' : '' }}">&nbsp;&nbsp;{{ $item['name'] }}</a>
                            <a class="btn {{ $item['id'] == 0 ? 'disabled' : '' }}"><i
                                        class="icon icon-group has-padding-sm"></i></a>
                            <a class="btn"><i class="icon icon-bars has-padding-sm"></i></a>
                        </div>
                    </div>
                @endforeach
            @endif
        </section>
    </div>
    {{--侧边悬浮按钮--}}
    <nav class="affix dock-bottom dock-left shadow-none has-margin-sm column align-start">
        <a class="btn btn-lg circle primary outline" href="{{ url()->previous() }}">
            <i class="icon icon-chevron-left"></i>
        </a>
    </nav>
@stop
@section('modal')
    {{--编辑分组名--}}
    <div id="editGroupModal" class="modal affix dock-bottom enter-from-bottom fade hidden">
        <div class="heading divider">
            <div class="title">添加分组</div>
            <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
        </div>
        <div class="content has-padding">
            <form id="groupForm" action="" class="">
                <div class="control">
                    <label for="Group-name">分组名称</label>
                    <input class="input" type="text" id="Group-name" name="Group[name]">
                    <p class="help-text"></p>
                </div>
            </form>
        </div>
        <div class="footer has-padding">
            <button type="cancel" class="btn danger" data-dismiss="display">取消</button>
            <button type="submit" class="btn primary pull-right" data-dismiss="display">发布</button>
        </div>
    </div>
    {{----}}
    <div id="editGroupModal" class="modal affix dock-bottom enter-from-bottom fade hidden">
        <div class="heading divider">
            <div class="title">添加分组</div>
            <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
        </div>
        <div class="content has-padding">
            <form id="groupForm" action="" class="">
                <div class="control">
                    <label for="Group-name">分组名称</label>
                    <input class="input" type="text" id="Group-name" name="Group[name]">
                </div>
            </form>
        </div>
        <div class="footer has-padding">
            <button type="cancel" class="btn danger" data-dismiss="display">取消</button>
            <button type="submit" class="btn primary pull-right" data-dismiss="display">发布</button>
        </div>
    </div>
    {{--排序选项--}}
    <div id="sortModal" class="modal affix dock-bottom enter-from-bottom fade hidden">
        <div class="heading divider">
            <div class="title"><strong>排序</strong></div>
            <nav class="nav"><a data-dismiss="display"><i class="icon-remove muted"></i></a></nav>
        </div>
        <div class="list">
            <a class="item" href="{{ url()->current().'?sort=group' }}">
                <div><i class="icon icon-list-ul"></i>&nbsp;&nbsp;按分组排序</div>
            </a>
            <a class="item" href="{{ url()->current().'?sort=alphabet' }}">
                <div><i class="icon icon-sort-by-alphabet"></i>&nbsp;&nbsp;按字母排序</div>
            </a>
            {{--<a class="item" href="{{ url()->current().'?sort=time' }}">--}}
            {{--<div><i class="icon icon-sort-by-attributes"></i>&nbsp;&nbsp;按时间排序</div>--}}
            {{--</a>--}}
        </div>
    </div>

@stop
@section('javascript')
    <script>
        $(function () {
            /* 添加分组 */
            /*TODO:弹窗*/
            $('#groupForm').ajaxForm({
                onSubmit: function (formData) {

                },
                onResult: function (response) {

                },
            });
            /* 删除组 */
            /*TODO:弹窗确认*/
            /* 组员 */
            /*TODO:弹窗多选*/
            /* 排序 */
            /*TODO:拖动排序*/

        });
    </script>
@stop

