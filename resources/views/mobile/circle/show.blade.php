@extends('mobile.common.mzui')
@section('title', '名片圈')
@section('css')
@stop
@section('content')
    @parent
    {{--内容容器--}}
    <div class="has-margin-sm">
        <div class="heading blue-pale">
            <div class="headline">{{ $circle->name }}
                {{--@if(Auth::id() == $circle->user_id)--}}
                {{--<a class="opshow-create" data-display="modal" data-backdrop="true" data-target="#editGroupModal"--}}
                {{--data-url="{{ url()->current() }}">--}}
                {{--<div class="btn primary"><i class="icon icon-pencil has-padding-sm" title="编辑"></i></div>--}}
                {{--</a>--}}
                {{--@endif--}}
                <a class="" data-display="modal" data-backdrop="true" data-target="#showQrcode"
                   data-url="{{ url()->current() }}">
                    <div class="btn primary"><i class="icon icon-qrcode has-padding-sm" title="二维码"></i></div>
                </a>
                <div class="small">人数：{{ count($circle->users) }} / {{ $circle->limit>0 ? $circle->limit: '∞' }}</div>
                <div class="small">有效期：{{ $circle->expired_time or '∞' }}</div>
                {{--<a title="返回"><i class="icon-arrow-left"></i></a>--}}
            </div>
            {{--<div class="title small muted">人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述</div>--}}
        </div>
        <section class="section">
            @if(count($circle->users))
                @foreach($circle->users as $item)
                    <div class="list">
                        <div class="item multi-lines with-avatar">
                            <div class="avatar circle red">
                                <img src="{{ $item->avatar ? asset($item->avatar) : asset('static/home/images/avatar.jpg') }}"
                                     alt="头像"/>
                            </div>
                            <a class="content"
                               href="">
                                <div class="title">{{ isset($item->employee) ? $item->employee->nickname : $item->nickname }}</div>
                                <div class="subtitle">
                                    @if(isset($item->employee))
                                        <label class="primary has-padding-h m rounded">企业</label>
                                    @else
                                        <label class="warning has-padding-h rounded">个人</label>
                                    @endif
                                </div>
                            </a>
                            <a class="btn" data-display="collapse" data-target="#sub{{ $item->id }}"
                               data-group=".item-footer">
                                <i class="icon icon-ellipsis-h muted"></i>
                            </a>
                        </div>
                        <div class="item item-footer justified text-center collapse hidden"
                             data-subid="{{ $item->id }}"
                             id="sub{{ $item->id }}">
                            {{--判断是否关注|该名片是个人名片还是企业名片--}}
                            @if($item->employee)
                                <a data-url="{{ url('cardcase/follow/e-'.$item->employee->id) }}"
                                   class="operation-follow">
                                    <i class="icon icon-heart has-padding-sm"></i>关注
                                </a>
                                {{--<a data-url="{{ url('cardcase/unfollow/e-'.$item->employee->id) }}"--}}
                                {{--class="operation-unfollow">--}}
                                {{--<i class="icon icon-heart-empty has-padding-sm"></i>取消关注--}}
                                {{--</a>--}}
                                <a href="{{ url('cardview/e-'.$item->employee->id) }}">
                                    <i class="icon icon-eye-open has-padding-sm"></i>查看
                                </a>
                            @else
                                <a href="{{ url('cardcase/follow/u-'.$item->id) }}"
                                   class="operation-follow">
                                    <i class="icon icon-heart has-padding-sm"></i>关注
                                </a>
                                {{--<a href="{{ url('cardcase/unfollow/u-'.$item->id) }}"--}}
                                {{--class="operation-unfollow">--}}
                                {{--<i class="icon icon-heart-empty has-padding-sm"></i>取消关注--}}
                                {{--</a>--}}
                                <a href="{{ url('cardview/u-'.$item->id) }}">
                                    <i class="icon icon-eye-open has-padding-sm"></i>查看
                                </a>
                            @endif
                            @if($circle->user_id == Auth::id() && $item->id != Auth::id())
                                <a class="opshow-delete text-danger"
                                   data-display="modal" data-backdrop="true" data-target=".confirmModal"
                                   data-url="{{ url('circle/'.$circle->id.'/quit/'.$item->id) }}">
                                    <i class="icon icon-signout has-padding-sm"></i>踢出</a>
                            @else
                                <a class="opshow-delete text-danger"
                                   data-display="modal" data-backdrop="true" data-target=".confirmModal"
                                   data-url="{{ url('circle/'.$circle->id.'/quit') }}"
                                   data-after_url="{{ url('circle') }}">
                                    <i class="icon icon-signout has-padding-sm"></i>退出</a>
                            @endif
                        </div>

                    </div>

                @endforeach
            @endif
            {{--@if(count($circle->users))--}}
            {{--@foreach($data as $item)--}}
            {{--@endforeach--}}
            {{--@endif--}}
        </section>
    </div>
    {{--侧边悬浮按钮--}}
    <nav class="affix dock-bottom dock-left shadow-none has-margin-sm column align-start">
        {{--编辑--}}
        <a class="btn btn-lg circle primary outline"
           href="{{ url()->previous() || url()->previous() == url()->current() ? url('circle') : url()->previous() }}">
            <i class="icon icon-chevron-left"></i>
        </a>
        {{--<a class="btn btn-lg circle primary outline" href="{{ url('circle/'.$circle->id.'/edit') }}" title="编辑">--}}
        {{--<i class="icon icon-pencil"></i>--}}
        {{--</a>--}}
    </nav>
@stop
@section('modal')
    {{--添加/编辑圈子--}}
    <div id="editGroupModal" class="modal affix dock-bottom enter-from-bottom fade">
        <form action="" method="post" onsubmit="return false;">
            <div class="heading divider">
                <div class="title modal-title">编辑圈子</div>
                <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
            </div>
            <div class="content has-padding">
                <div class="control error-name" id="">
                    <label for="Circle[name]">名称</label>
                    <input class="input" type="text" id="Circle[name]" name="Circle[name]" value="">
                    <p class="help-text"></p>
                </div>
                <div class="control error-expired_at">
                    <label>人数</label>
                    <div class="radio inline-block">
                        <input id="limit_not" type="radio" name="Circle[limit]" value="0" checked>
                        <label for="limit_not">无限制</label>
                    </div>
                    <div class="radio inline-block">
                        <input id="limit_30" type="radio" name="Circle[limit]" value="30">
                        <label for="limit_30">30人</label>
                    </div>
                    <div class="radio inline-block">
                        <input id="limit_100" type="radio" name="Circle[limit]" value="100">
                        <label for="limit_100">100人</label>
                    </div>
                    <p class="help-text"></p>
                </div>
                <div class="control error-expired_time">
                    <label>有效期</label>
                    <div class="radio inline-block">
                        <input type="radio" name="Circle[expired_time]" id="expired_not" value="0" checked>
                        <label for="expired_not">永久</label>
                    </div>
                    <div class="radio inline-block">
                        <input type="radio" name="Circle[expired_time]" id="expired_3" value="3">
                        <label for="expired_3">3天</label>
                    </div>
                    <div class="radio inline-block">
                        <input type="radio" name="Circle[expired_time]" id="expired_7" value="7">
                        <label for="expired_7">7天</label>
                    </div>
                    <p class="help-text"></p>
                </div>
            </div>
            <div class="footer has-padding">
                <input type="reset" class="btn-lg danger" data-dismiss="display" value="取消">
                <input type="submit" class="op-submit btn-lg primary pull-right" value="确认">
            </div>
        </form>
    </div>
    {{--展示二维码--}}
    <div id="showQrcode" class="modal affix dock-bottom enter-from-bottom fade">
        <div class="heading divider">
            <div class="title modal-title">圈子二维码(长按图片->发送给朋友)</div>
            <nav class="nav"><a data-dismiss="display"><i class="icon icon-remove muted"></i></a></nav>
        </div>
        <div class="content has-padding">
            <div class="control error-name text-center" id="">
                <img src="{{ asset($circle->qrcode_path) }}" alt="二维码">
            </div>
        </div>
    </div>

@stop
@section('javascript')
    <script>
        var once = true; // 防止多次触发
        $(function () {
            /* 关注 */
            $('.operation-follow').unbind('click', 'tap', 'touchstart').on('tap', function () {
                if (!once) {
                    return false;
                }
                once      = false;
                var _this = $(this);
                var _url  = _this.data('url');
                useAjax('get', _url);
            });

            /* 取消关注 */
            $('.operation-unfollow').unbind('click', 'tap', 'touchstart').on('tap', function () {
                if (!once) {
                    return false;
                }
                once      = false;
                var _this = $(this);
                var _url  = _this.data('url');
                useAjax('get', _url);
            });

//            /* 删除确认 */
            $('.op-submit').unbind('click', 'tap', 'touchstart').on('tap', function () {
                alert(1);
                if (!once) {
                    return false;
                }
                once      = false;
                var _this = $(this);
                var _url  = _this.data('url');
            });

        });

        /**
         * 调用ajax
         */
        function useAjax(type, url) {
            $.ajax({
                type: type,
                url: url,
                async: true,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }, // CSRF验证必填
                success: function (data) {
                    /* 现实成功消息，刷新当前页面 */
                    $.messager.show("<i class='icon-info'>  " + data + "</i>", {
                        type: 'success', placement: 'center', autoHide: 1000, closeButton: false,
                    });
                    once = true;
                },
            });
        }
    </script>
@stop

