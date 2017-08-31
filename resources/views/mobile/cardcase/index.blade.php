@extends('mobile.common.mzui')
@section('title', '名片夹')
@section('css')
@stop
@section('content')
    @parent
    {{--内容容器--}}
    <div class="has-margin-sm">
        <section class="section">
            @if(isset($data) && count($data)>0)
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
                                    <a class="avatar circle"
                                       href="{{ url('cardview/'.($subitem['follower_type']=='App\Models\User'?'u':'e').'-'.$subitem['follower_id']) }}">
                                        <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>
                                    </a>
                                    <a class="content"
                                       href="{{ url('cardview/'.($subitem['follower_type']=='App\Models\User'?'u':'e').'-'.$subitem['follower_id']) }}">
                                        <div class="title">{{ $subitem['follower']['nickname'] or '' }}</div>
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
                                    </a>
                                    <a class="btn" data-display="collapse" data-target="#sub{{ $subitem['id'] }}"
                                       data-group=".item-footer">
                                        <i class="icon icon-ellipsis-h muted"></i>
                                    </a>
                                </div>
                                {{--名片操作--}}
                                <div class="item item-footer justified text-center collapse hidden"
                                     data-subid="{{ $subitem['id'] }}"
                                     id="sub{{ $subitem['id'] }}">
                                    <a href="tel:{{ $subitem['follower']['mobile'] or '' }}">
                                        <i class="icon icon-phone has-padding-sm"></i>拨号
                                    </a>
                                    <a href="{{ url('cardview/'.($subitem['follower_type']=='App\Models\User'?'u':'e').'-'.$subitem['follower_id']) }}">
                                        <i class="icon icon-eye-open has-padding-sm"></i>查看
                                    </a>
                                    {{--<a class="opshow-group" onclick="showGroup({{$item['id']}});"--}}
                                    <a class="opshow-group"
                                       data-url="{{ url('cardcaseAjax/move/'.$subitem['id']) }}"
                                       data-display data-backdrop="true" data-target="#groupListModal">
                                        {{--data-display data-backdrop="true">--}}
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
        {{--<a class="btn btn-lg circle primary space-sm outline" data-display data-backdrop="true"--}}
        {{--data-target="#sortModal">--}}
        {{--<i class="icon icon-list-ul"></i>--}}
        {{--</a>--}}
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
        <form action="" method="post" onsubmit="return false;">
            <div class="heading divider">
                <div class="title">分组列表</div>
                <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
            </div>
            <div class="content has-padding">
                <div class="control">
                    {{--动态分组信息--}}
                    <div class="radio">
                        <input type="radio" name="group_id" id="group0" value="0"/>
                        <label for="group0">默认分组</label>
                    </div>
                    @foreach($groups as $item)
                        <div class="radio">
                            <input type="radio" name="group_id" id="group{{$item->id}}" value="{{$item->id}}"/>
                            <label for="group{{$item->id}}">{{$item->name}}</label>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="footer has-padding">
                <input type="reset" class="btn-lg danger" data-dismiss="display" value="取消">
                <input type="submit" class="op-submit-group btn-lg primary pull-right" value="确认">
            </div>
        </form>
    </div>


    {{--<div class="item item-footer justified text-center collapse hidden"--}}
    {{--data-subid="{{ $subitem['id'] }}"--}}
    {{--id="sub{{ $subitem['id'] }}">--}}
@stop
@section('javascript')
    <script>
        var _json;
        $(function () {
            $('.op-submit-group').on('touchstart', function () {
                var _this = $(this);
                var _modal = _this.parents('.modal');
                var _form = _this.parents('form');
                var _url = _form.attr('action');
                var _formData = _form.serializeArray();
//                console.log(_url);
//                console.log('_url');
//                console.log(_formData);
//                console.log('_formData');
                useAjax('post', _url, _formData);
//                $.Display.dismiss(_modal.data('display-name'));
//                $.messager.show("<i class='icon-check'>  " + _json.msg + "</i>", {
//                    type: 'success', placement: 'center', autoHide: 1000, closeButton: false
//                });
//                console.log(_json);
//                console.log('_json');
                window.location.href = _json.data;

            });
            /* 加载分组信息 */
//            $.ajax({
//                type: 'get',
//                url: '/cardcase/group',
//                dataType: 'json',
//                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
//                success: function (data) {
//                    var _modal = '#groupListModal';
//                    var _form = $(_modal).find('form');
//                    var str = '';
//                    str += '<div class="radio">';
//                    str += '<input type="radio" name="group_id" id="group0" value="0"/>';
//                    str += '<label for="group0">默认分组</label>';
//                    str += '</div>';
//                    if (data.length > 0) {
//                        $.each(data, function (k, v) {
//                            str += '<div class="radio">';
//                            str += '<input type="radio" name="group_id" id="group' + v.id + '" value="' + v.id + '"/>';
//                            str += '<label for="group' + v.id + '">' + v.name + '</label>';
//                            str += '</div>';
//                        });
//                    }
//                    _form.find('.control').html(str);
//                },
//            });

            /* 展开分组 */
            $('.opshow-group').on('touchstart', function (e) {
                var _this = $(this);
                var _group_id = _this.parents('.list').attr('id');
                var _modal = $('#groupListModal');
                var _form = _modal.find('form');
                var _url = _this.attr('data-url');
                _modal.find('form').attr('action', _url);
                _form.find('#group' + _group_id).attr('checked', true);
            });


        });

        /**
         * 调用ajax
         */
        function useAjax(type, url, data) {
            $.ajax({
                type: type,
                url: url,
                data: data,
                async: false, // 非异步(同步)加载
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                }, // CSRF验证必填
                success: function (data) {
                    _json = data;
                },
            });
        }

        //        function showGroup(group_id) {
        //            document.getElementById('group' + group_id).checked = true;
        //        }
    </script>
@stop

