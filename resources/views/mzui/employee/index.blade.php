@extends('mzui.common.layout')
@section('title', '公司')
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container display ">
        <section class="section">
            <div class="list ">
                <div class="heading">
                    <a class="title ">
                        默认分组&nbsp;&nbsp;<span class="label red">12</span>
                    </a>
                </div>
                {{--<div class="item strong">--}}
                {{--<i class="muted icon-th-list"></i>&nbsp; 默认分组--}}
                {{--<span class="label red circle">12 条消息</span>--}}
                {{--</div>--}}
                <a class="item">
                    <div class="avatar circle">
                        <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>
                    </div>
                    <div class="title">Catouse头像</div>
                </a>
                <a class="item">
                    {{--<i class="muted icon-th-list"></i>--}}
                    <div class="avatar circle"><i class="icon icon-user"></i></div>
                    <div class="title">Catouse图标</div>
                </a>
                <a class="item">
                    {{--<i class="muted icon-th-list"></i>--}}
                    <div class="avatar circle red">头像</div>
                    <div class="title">Catouse文字</div>
                </a>
            </div>
            {{--</div>--}}
            <div class="divider"></div>
            <div class="list">
                <div class="item">
                    <div class="btn danger"><i class="icon icon-trash"></i></div>
                    <a class="title ">&nbsp;&nbsp;我的客户
                    </a>
                    <div class="btn pull-right"><i class="icon icon-group"></i></div>
                    <div class="btn pull-right"><i class="icon icon-bars"></i></div>
                </div>
            </div>
        </section>

    </div>

    {{--编辑--}}
    <nav class="affix dock-bottom justified">
        <div class="btn btn-lg ">取消</div>
        <div class="btn btn-lg success">完成</div>
    </nav>
@stop
@section('modal')
@stop
@section('javascript')
    <script>
    </script>
@stop

