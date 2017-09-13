@extends('mobile.common.mzui')
@section('title', '我的同事')
@section('css')
    <link href="{{ asset('static/lib/mzui/css/mzui.min.css') }}" rel="stylesheet">
@stop
@section('content')
    {{--侧边悬浮按钮--}}
    <nav class="affix dock-bottom dock-left shadow-none has-margin-sm column align-start">
        {{--添加--}}
        <a class="btn btn-lg circle primary space-sm outline" data-display data-backdrop="true"
           data-target="#sortModal">
            <i class="icon icon-list-ul"></i>
        </a>
        {{--编辑--}}
        <a class="btn btn-lg circle primary outline" href="{{ url()->current().'/group' }}">
            <i class="icon icon-pencil"></i>
        </a>
    </nav>
@stop

