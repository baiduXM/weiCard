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
                <a class="item">
                    <div class="btn primary "><i class="icon icon-plus has-padding-sm"></i></div>
                    <div class="title ">&nbsp;&nbsp;新建分组</div>
                </a>
            </div>

            <div class="list divider">
                <div class="item" data-item="{{ 1 }}">
                    <a class="btn danger disabled"><i class="icon icon-trash has-padding-sm"></i></a>
                    <a class="title disabled">&nbsp;&nbsp;默认分组
                        {{--<label class="info has-padding-h has-margin-sm">12</label>--}}
                    </a>
                    <a class="btn disabled"><i class="icon icon-group has-padding-sm"></i></a>
                    <a class="btn"><i class="icon icon-bars has-padding-sm"></i></a>
                </div>
            </div>

            <div class="list divider">
                <div class="item" data-item="{{ 1 }}">
                    <a class="btn danger"><i class="icon icon-trash has-padding-sm"></i></a>
                    <a class="title ">&nbsp;&nbsp;我的客户
                        {{--<label class="info has-padding-h has-margin-sm">12</label>--}}
                    </a>
                    <a class="btn"><i class="icon icon-group has-padding-sm"></i></a>
                    <a class="btn"><i class="icon icon-bars has-padding-sm"></i></a>
                </div>
            </div>
        </section>
    </div>

    {{--编辑--}}
    {{--<nav class="affix dock-bottom justified">--}}
    {{--<a class="btn btn-lg danger" href="{{ url()->previous() }}">取消</a>--}}
    {{--<div class="btn btn-lg success">完成</div>--}}
    {{--</nav>--}}
@stop
@section('modal')
    {{--编辑分组名--}}
    <div id="editGroupName" class="modal  ">
        <div class="modal-header">
            <div class="title"><i class="icon icon-reply"></i> <strong>回复</strong> 张三</div>
            <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
        </div>
        <div class="modal-body">
            <form action="" class="content has-padding">
                <div class="control">
                    <textarea name="" id="" cols="30" rows="5" class="textarea" placeholder="请和谐评论"></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer footer has-padding">
            <button type="submit" class="btn primary" data-dismiss="display">发布</button>
            <a href="https://github.com/easysoft/mzui/blob/master/doc/part/examples/comments-reply.html"
               class="btn pull-right"><i class="icon-code"></i> 此对话框源码</a>
        </div>

    </div>

@stop
@section('javascript')
    <script>
        $(function () {
            /* 添加分组 */
            /*TODO:弹窗*/

            /* 删除组 */
            /*TODO:弹窗确认*/
            /* 组员 */
            /*TODO:弹窗多选*/
            /* 排序 */
            /*TODO:拖动排序*/

        });
    </script>
@stop

