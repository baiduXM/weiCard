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
                            <a class="btn danger {{ $item['id'] == 0 ? 'disabled' : '' }}" data-display="modal"
                               data-backdrop="true" data-target="#deleteModal">
                                <i class="icon icon-trash has-padding-sm"></i>
                            </a>
                            <a class="title {{ $item['id'] == 0 ? 'disabled' : '' }}">&nbsp;&nbsp;{{ $item['name'] }}</a>
                            <a class="btn {{ $item['id'] == 0 ? 'disabled' : '' }}" data-display="modal"
                               data-backdrop="true" data-target="#editMemberModal">
                                <i class="icon icon-group has-padding-sm"></i>
                            </a>
                            <a class="btn">
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
        <a class="btn btn-lg circle primary outline" href="{{ url()->previous() }}">
            <i class="icon icon-chevron-left"></i>
        </a>
    </nav>
@stop
@section('modal')
    {{--添加群成员--}}
    <div id="editMemberModal" class="modal affix dock enter-from-center fade in">
        <div class="heading divider">
            <div class="title">编辑成员 <label class="info has-padding-h">12</label></div>
            <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
        </div>
        <div class="content has-padding">
            {{--<form id="groupForm" action="{{ url()->current() }}" method="post">--}}
            {{--{{ csrf_field() }}--}}
            <div class="heading">成员</div>
            <div class="list divider row ">
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
            <div class="list divider row justified">
                <div class="checkbox">
                    <input type="checkbox" name="buyMethod">
                    <label for="buyMethod">1</label>
                    <input type="checkbox" name="buyMethod1">
                    <label for="buyMethod1">2</label>
                </div>
                <div class="checkbox flex-auto">
                    <input type="checkbox" name="buyMethod">
                    <label for="buyMethod">3</label>
                </div>
                <div class="checkbox flex-auto">
                    <input type="checkbox" name="buyMethod">
                    <label for="buyMethod">4</label>
                </div>
                <div class="checkbox flex-auto">
                    <input type="checkbox" name="buyMethod">
                    <label for="buyMethod">5</label>
                </div>
            </div>
            {{--</form>--}}
        </div>
        <div class="footer has-padding">
            <input type="reset" class="btn danger" data-dismiss="display" value="取消">
            <input type="submit" class="btn primary pull-right" data-dismiss="display" value="确认">
        </div>
    </div>
    {{--编辑分组名--}}
    <div id="editGroupModal" class="modal affix dock-bottom enter-from-bottom fade">
        <div class="heading divider">
            <div class="title">添加分组</div>
            <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
        </div>
        <div class="content has-padding">
            <form id="groupForm" action="{{ url()->current() }}" method="post">
                {{ csrf_field() }}
                <div class="control">
                    <label for="Group[name]">分组名称</label>
                    <input class="input" type="text" id="Group[name]" name="Group[name]">
                    <p class="help-text"></p>
                </div>
            </form>
        </div>
        <div class="footer has-padding">
            <input type="reset" class="btn danger" data-dismiss="display" value="取消">
            <input type="submit" class="btn primary pull-right" data-dismiss="display" value="确认">
        </div>
    </div>
    {{--删除确认--}}
    <div id="deleteModal" class="modal affix dock-bottom enter-from-bottom fade">
        <div class="heading divider">
            <div class="title text-center">确认删除</div>
        </div>
        <div class="footer has-padding">
            <input type="cancel" class="btn danger" data-dismiss="display">取消</input>
            <input type="submit" class="btn primary pull-right op">确认</input>
        </div>
    </div>
@stop
@section('javascript')
    <script>
        $(function () {


            /* 添加分组 */
            $('#groupForm').ajaxform({
                init: function () {
//                    alert(0)
                },
                onSubmit: function (formData) {
                    alert(1)
                    console.log(formData);
                },
                onResult: function (response) {
                    alert(2)
                    console.log(response);
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

