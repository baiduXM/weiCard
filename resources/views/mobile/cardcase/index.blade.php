@extends('mobile.common.mzui')
@section('title', '名片夹')
@section('css')
    <link href="{{ asset('static/lib/mzui/css/mzui.min.css') }}" rel="stylesheet">
@stop
@section('content')
    @parent
    {{--内容容器--}}
    <div class="has-margin-sm">
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
                        <div class="list collapse in" id="{{ $item['id'] }}">
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
                                                    个人
                                                </label>
                                            @else
                                                <label class="primary has-padding-h m rounded">
                                                    企业
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
                                    <a href="tel:{{ $subitem['follower']['mobile'] }}">
                                        <i class="icon icon-phone has-padding-sm"></i>拨号
                                    </a>
                                    <a href="{{ url('cardview/'.($subitem['follower_type']=='App\Models\User'?'u':'e').'-'.$subitem['follower_id']) }}">
                                        <i class="icon icon-eye-open has-padding-sm"></i>查看
                                    </a>
                                    <a class="opshow-group"
                                       data-url="{{ url('cardcase/move/'.$subitem['id']) }}"
                                       data-display data-backdrop="true" data-target="#groupListModal">
                                        <i class="icon icon-exchange has-padding-sm"></i>分组
                                    </a>
                                    <a class="opshow-delete text-danger"
                                       data-display="modal" data-backdrop="true" data-target=".confirmModal"
                                       data-url="{{ url()->current() . '/' . $subitem['id'] }}">
                                        <i class="icon icon-trash has-padding-sm"></i>删除</a>
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

        {{--排序--}}
        <a class="btn btn-lg circle primary space-sm outline" data-display data-backdrop="true"
           data-target="#sortModal">
            <i class="icon icon-list-ul"></i>
        </a>
        {{--编辑--}}
        <a class="btn btn-lg circle primary outline" href="{{ 'cardcase/group' }}">
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

    {{--分组列表--}}
    <div id="groupListModal" class="modal affix dock-bottom enter-from-bottom fade">
        <form action="" method="put" onsubmit="return false;">
            <div class="heading divider">
                <div class="title">分组列表</div>
                <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
            </div>
            <div class="content has-padding">
                <div class="control">
                    {{--动态分组信息--}}
                </div>
            </div>
            <div class="footer has-padding">
                <input type="reset" class="btn-lg danger" data-dismiss="display" value="取消">
                <input type="submit" class="op-submit btn-lg primary pull-right" value="确认">
            </div>
        </form>
    </div>


    {{--<div class="item item-footer justified text-center collapse hidden"--}}
    {{--data-subid="{{ $subitem['id'] }}"--}}
    {{--id="sub{{ $subitem['id'] }}">--}}
@stop
@section('javascript')
    <script>
        $(function () {
            /* 加载分组信息 */
            $.ajax({
                type: 'get',
                url: '/cardcase/group',
                dataType: 'json',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
                success: function (data) {
                    var _modal = '#groupListModal';
                    var _form  = $(_modal).find('form');
                    var str    = '';
                    str += '<div class="radio">';
                    str += '<input type="radio" name="group_id" id="group0" value="0"/>';
                    str += '<label for="group0">默认分组</label>';
                    str += '</div>';
                    if (data.length > 0) {
                        $.each(data, function (k, v) {
                            str += '<div class="radio">';
                            str += '<input type="radio" name="group_id" id="group' + v.id + '" value="' + v.id + '"/>';
                            str += '<label for="group' + v.id + '">' + v.name + '</label>';
                            str += '</div>';
                        });
                    }
                    _form.find('.control').html(str);
                },
            });

            /* 展开分组 */
            $('.opshow-group').click(function () {
                var _this     = $(this);
                var _group_id = _this.parents('.list').attr('id');
                var _modal    = $(_this.data('target'));
                var _form     = $(_modal).find('form');
                _form.find('#group' + _group_id).attr('checked', true);
            });

        });
    </script>
@stop

