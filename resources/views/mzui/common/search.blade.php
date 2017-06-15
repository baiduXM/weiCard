@extends('mzui.common.layout')
@section('title', '名片夹')
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container">
        <section class="section">
            <div class="list ">
                <div class="heading">
                    <a class="title ">
                        默认分组&nbsp;&nbsp;<span class="label ">12</span>
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
            <div class="list ">
                <div class="heading">
                    <a class="title ">
                        默认分组&nbsp;&nbsp;<span class="label">12</span>
                    </a>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="list ">
                <div class="heading">
                    <a class="title ">
                        默认分组&nbsp;&nbsp;<span class="label ">12</span>
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
            <div class="list ">
                <div class="heading">
                    <a class="title ">
                        默认分组&nbsp;&nbsp;<span class="label">12</span>
                    </a>
                </div>
            </div>
        </section>

    </div>
    <nav class="affix dock-bottom dock-left dock-auto shadow-none has-margin-sm column align-start">
        <a class="btn circle primary space-sm" href="{{ url('m') }}"><i class="icon icon-list-ul"></i></a>
        <a class="btn circle primary " href="{{ url()->current().'/edit' }}"><i class="icon icon-pencil"></i></a>
    </nav>
@stop
@section('modal')
@stop
@section('javascript')
    <script>
    </script>
@stop

