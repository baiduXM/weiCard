@extends('mzui.common.layout')
@section('title', '名片夹')
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container display ">
        <section class="section">
            <div class="list">
                <div class="item">
                    <div class="btn primary"><i class="icon icon-plus"></i></div>
                    <a class="title ">&nbsp;&nbsp;编辑组名</a>
                </div>
            </div>

            <div class="divider"></div>

            <div class="list">
                <div class="item">
                    <div class="btn danger"><i class="icon icon-trash"></i></div>
                    <a class="title ">&nbsp;&nbsp;我的客户</a>
                    <div class="btn pull-right"><i class="icon icon-group"></i></div>
                    <div class="btn pull-right"><i class="icon icon-bars"></i></div>
                </div>
            </div>
        </section>

    </div>

    {{--编辑--}}
    <nav class="affix dock-bottom justified">
        <a class="btn btn-lg danger" href="{{ url()->previous() }}">取消</a>
        <div class="btn btn-lg success">完成</div>
    </nav>
@stop
@section('modal')
@stop
@section('javascript')
    <script>
    </script>
@stop

