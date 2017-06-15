@extends('mzui.common.layout')
@section('title', '名片夹')
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container">
        <section class="section">
            <div class="list divider">
                <div class="heading">
                    <a class="title">
                        默认分组<label class="info has-padding-h has-margin-sm">12</label>
                    </a>
                </div>
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
            <div class="list divider">
                <div class="heading">
                    <a class="title ">
                        默认分组<label class="info has-padding-h has-margin-sm">12</label>
                    </a>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="list divider ">
                <div class="heading">
                    <a class="title" data-display data-target="#sortByAlphabet0" data-trigger-method="toggle">
                        A<label class="info has-padding-h has-margin-sm">12</label>
                    </a>
                </div>
                <div class="list fade hidden" id="sortByAlphabet0">
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

            </div>
            {{--</div>--}}
            <div class="list divider">
                <div class="heading">
                    <a class="title">
                        C<label class="info has-padding-h has-margin-sm">12</label>
                    </a>
                </div>
            </div>
        </section>

    </div>
    <nav class="affix dock-bottom dock-left dock-auto shadow-none has-margin-sm column align-start">
        <a class="btn circle primary space-sm outline" data-display data-backdrop="true" data-target="#sortModal"
           data-placement="bottom"><i class="icon icon-list-ul"></i></a>
        <a class="btn circle primary outline" href="{{ url()->current().'/edit' }}"><i class="icon icon-pencil"></i></a>
    </nav>
@stop
@section('modal')
    <div id="sortModal" class="modal affix dock-bottom enter-from-bottom fade hidden">
        <div class="heading divider">
            <div class="title"><strong>排序</strong></div>
            <nav class="nav"><a data-dismiss="display"><i class="icon-remove muted"></i></a></nav>
        </div>
        <div class="list">
            <a class="item">
                <div>
                    <i class="icon icon-sort-by-alphabet"></i>&nbsp;&nbsp;按字母排序
                </div>
            </a>
            <a class="item">
                <div>
                    <i class="icon icon-sort-by-attributes"></i>&nbsp;&nbsp;按时间排序
                </div>
            </a>
        </div>
    </div>
@stop
@section('javascript')
    <script>
    </script>
@stop

