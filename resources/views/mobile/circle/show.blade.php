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
                <a class="opshow-create" data-display="modal" data-backdrop="true" data-target="#editGroupModal"
                   data-url="{{ url()->current() }}">
                    <div class="btn primary"><i class="icon icon-pencil has-padding-sm" title="编辑"></i></div>
                </a>
                <div class="small">人数：{{ count($circle->users) }} / {{ $circle->limit or '∞' }}</div>
                <div class="small">有效期：{{ $circle->expired_time or '∞' }}</div>
                {{--<a title="返回"><i class="icon-arrow-left"></i></a>--}}
            </div>
            {{--<div class="title small muted">人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述</div>--}}
        </div>
        <section class="section">
            @if(count($circle->users))
                @foreach($circle->users as $item)
                    <div class="list collapse in">
                        <div class="item multi-lines with-avatar">
                            {{--<div class="control">--}}
                            {{--<div class="checkbox ">--}}
                            {{--<input type="checkbox" name="buyMethod">--}}
                            {{--<label for="buyMethod avatar">--}}
                            {{--<img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>--}}
                            {{--</label>--}}
                            {{--</div>--}}
                            {{--<div class="checkbox">--}}
                            {{--<input type="checkbox" name="buyMethod">--}}
                            {{--<label for="buyMethod"></label>--}}
                            {{--</div>--}}
                            {{--</div>--}}
                            <div class="avatar circle red">
                                @if($item->employee)
                                    <img src="{{ asset($item->avatar) }}" alt="头像"/>
                                @else
                                    <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>
                                @endif
                                {{--{{ $item->employee ? $item->employee->nickname : $item->user->nickname }}--}}
                                {{--<img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>--}}
                            </div>
                            {{--<a class="avatar circle red"--}}
                            {{--href="">--}}
                            {{--头像--}}
                            {{--</a>--}}
                            <a class="content"
                               href="">
                                <div class="title">{{ $item->employee ? $item->employee->nickname : $item->user->nickname }}</div>
                                <div class="subtitle">
                                    @if($item->employee)
                                        <label class="primary has-padding-h m rounded">企业</label>
                                    @else
                                        <label class="warning has-padding-h rounded">个人</label>
                                    @endif
                                </div>
                            </a>
                            <a class="btn" data-display="collapse" data-target="#sub2"
                               data-group=".item-footer">
                                <i class="icon icon-ellipsis-h muted"></i>
                            </a>
                        </div>
                        <div class="item item-footer justified text-center collapse hidden"
                             data-subid="2"
                             id="sub2">
                            <a href="{{ url('cardcase/follow/'.$item->id) }}">
                                <i class="icon icon-heart has-padding-sm"></i>关注
                            </a>
                            <a href="{{ url('cardcase/unfollow/'.$item->id) }}">
                                <i class="icon icon-heart-empty has-padding-sm"></i>取消关注
                            </a>
                            <a href="{{ url('cardview/'.$item->id) }}">
                                <i class="icon icon-eye-open has-padding-sm"></i>查看
                            </a>
                            <a class="opshow-delete text-danger"
                               data-display="modal" data-backdrop="true" data-target=".confirmModal"
                               data-url="{{ url('circle/'.$item->id.'/quit') }}">
                                <i class="icon icon-signout has-padding-sm"></i>踢出</a>
                            <a class="opshow-delete text-danger"
                               data-display="modal" data-backdrop="true" data-target=".confirmModal"
                               data-url="{{ url('circle/'.$item->id.'/quit') }}">
                                <i class="icon icon-signout has-padding-sm"></i>退出</a>
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
           href="{{ url()->previous() == url()->current() ? url('circle') : url()->previous() }}">
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
                <div class="title modal-title">创建圈子</div>
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
@stop
@section('javascript')
    <script>
        $(function () {
            $('#editGroupModal').on('show', function () {
                alert(1)
            });
        });
    </script>
@stop

