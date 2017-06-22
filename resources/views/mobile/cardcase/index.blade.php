@extends('mobile.common.mzui')
@section('title', '名片夹')
@section('css')
    <link href="{{ asset('static/lib/mzui/css/mzui.min.css') }}" rel="stylesheet">
@stop
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container">
        <section class="section">
            @if(count($data)>0)
                @foreach($data as $item)
                    {{--分组--}}
                    <div class="cardcase-group divider">
                        {{--组名--}}
                        <a class="heading muted strong" data-display="collapse" data-target="#{{ $item['id'] }}">
                            <div class="title">{{ $item['name'] }}
                                <label class="info has-padding-h has-margin-sm">{{ count($item['cardcases']) }}</label>
                            </div>
                            <button class="btn"><i class="icon icon-angle-down"></i></button>
                        </a>
                        {{--分组名片列表--}}
                        <div class="list collapse {{ count($item['cardcases'])>0 ? 'in' : '' }}" id="{{ $item['id'] }}">
                            @foreach($item['cardcases'] as $subitem)
                                {{--名片子项目--}}
                                <div class="item multi-lines with-avatar">
                                    <div class="avatar circle">
                                        <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>
                                    </div>
                                    <div class="content">
                                        <div class="title">{{ $subitem['follower']['nickname'] }}</div>
                                        <div class="subtitle">
                                            @if($subitem['follower_type']=='App\Models\User')
                                                <label class="warning has-padding-h rounded">
                                                    个人名片
                                                </label>
                                            @else
                                                <label class="primary has-padding-h rounded">
                                                    企业名片
                                                </label>
                                            @endif
                                        </div>
                                    </div>
                                    <a class="btn" data-display="collapse" data-target="#sub{{ $subitem['id'] }}"
                                       data-group=".item-footer">
                                        <i class="icon icon-ellipsis-h muted"></i>
                                    </a>
                                </div>
                                {{--名片操作--}}
                                <div class="item item-footer justified text-center collapse hidden"
                                     data-subid="{{ $subitem['id'] }}"
                                     id="sub{{ $subitem['id'] }}">
                                    <a data-operation="call"><i class="icon icon-phone has-padding-sm"></i>拨号</a>
                                    <a data-operation="share"><i class="icon icon-share-alt has-padding-sm"></i>分享</a>
                                    <a data-operation="move"><i class="icon icon-exchange has-padding-sm"></i>分组</a>
                                    <a data-operation="unfollow" class="text-danger "><i
                                                class="icon icon-trash has-padding-sm"></i>删除</a>
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endforeach
            @endif
        </section>
    </div>
    {{--侧边悬浮按钮--}}
    <nav class="affix dock-bottom dock-left shadow-none has-margin-sm column align-start">
        <a class="btn btn-lg circle primary space-sm outline" data-display data-backdrop="true"
           data-target="#sortModal">
            <i class="icon icon-list-ul"></i>
        </a>
        {{--        <a class="btn btn-lg circle primary outline" href="{{ url('m/cardcase/group') }}">--}}
        <a class="btn btn-lg circle primary outline" href="{{ url()->current().'/group' }}">
            <i class="icon icon-pencil"></i>
        </a>
    </nav>
@stop
@section('modal')
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

            /* 分组展开 */
            /* TODO:判断分组展开状态，变换右侧图标 icon-angle-down icon-angle-right */

            /* 子项目展开 */
            /* TODO:给当前展开子项目添加背景色 primary-pale */

        });
    </script>
@stop

