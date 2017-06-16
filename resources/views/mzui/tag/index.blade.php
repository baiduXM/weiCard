@extends('mzui.common.layout')
@section('title', '编辑 - 名片夹')
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container display ">
        <section class="section">
            <div class="list divider">
                <div class="item">
                    <div class="btn primary "><i class="icon icon-plus has-padding-sm"></i></div>
                    <a class="title ">&nbsp;&nbsp;新建分组
                    </a>
                </div>
            </div>

            <div class="list divider">
                <div class="item" data-item="{{ 1 }}">
                    <a class="btn danger"><i class="icon icon-trash"></i></a>
                    <a class="title ">&nbsp;&nbsp;我的客户
                        {{--<label class="info has-padding-h has-margin-sm">12</label>--}}
                    </a>
                    <a class="btn"><i class="icon icon-group"></i></a>
                    <a class="btn"><i class="icon icon-bars"></i></a>
                </div>
            </div>
            <a class="btn primary outline" data-display data-backdrop="clean" data-target="!new"
               data-target-dismiss="true" data-content="用于覆盖层内容" data-placement="overlay"
               data-target-class="layer red has-padding" style="fluex">打开覆盖层</a>

            {{--分组--}}

            {{--<div class="cardcase-group divider">--}}
            {{--<div class="heading strong has-margin-sm" >--}}
            {{--<div class="btn primary"><i class="icon icon-plus"></i></div>--}}
            {{--<div class="title" data-display="collapse" data-target="#{{ 'groupDefault' }}">默认分组--}}
            {{--</div>--}}
            {{--</div>--}}
            {{--<div class="heading strong has-margin-sm" >--}}
            {{--<a class="btn danger"><i class="icon icon-trash"></i></a>--}}
            {{--<div class="btn primary"><i class="icon icon-plus"></i></div>--}}
            {{--<div class="title" data-display="collapse" data-target="#{{ 'groupDefault' }}">默认分组--}}
            {{--</div>--}}
            {{--<a class="btn"><i class="icon icon-group"></i></a>--}}
            {{--<a class="btn"><i class="icon icon-bars"></i></a>--}}
            {{--<button class="btn "><i class="icon icon-angle-down"></i></button>--}}
            {{--</div>--}}

            {{--子项目--}}
            {{--<div class="list collapse in" id="{{ 'groupDefault' }}">--}}
            {{--<a class="item" data-display="collapse" data-target="#{{ 'groupItem1' }}" data-group=".item-footer">--}}
            {{--<div class="avatar circle">--}}
            {{--<img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>--}}
            {{--</div>--}}
            {{--<div class="title">Catouse头像</div>--}}
            {{--<i class="icon icon-ellipsis-h muted"></i>--}}
            {{--</a>--}}
            {{--<a class="item" data-display="collapse" data-target="#{{ 'groupItem2' }}"--}}
            {{--data-group=".item-footer">--}}
            {{--<div class="avatar circle"><i class="icon icon-user"></i></div>--}}
            {{--<div class="title text-ellipsis">Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标--}}
            {{--</div>--}}
            {{--<i class="icon icon-ellipsis-h muted"></i>--}}
            {{--</a>--}}
            {{--</div>--}}
            {{--</div>--}}

        </section>

    </div>

    {{--编辑--}}
    {{--<nav class="affix dock-bottom justified">--}}
    {{--<a class="btn btn-lg danger" href="{{ url()->previous() }}">取消</a>--}}
    {{--<div class="btn btn-lg success">完成</div>--}}
    {{--</nav>--}}
@stop
@section('modal')
@stop
@section('javascript')
    <script>
        $(function () {
            /* 删除组 */
            /*TODO:弹窗确认*/
            /* 组员 */
            /*TODO:弹窗多选*/
            /* 排序 */
            /*TODO:拖动排序*/

        });
    </script>
@stop

