@extends('mobile.common.mzui')
@section('title', '名片圈')
@section('css')
@stop
@section('content')
    @parent
    {{--内容容器--}}
    <div class="has-margin-sm">
        <div class="heading blue-pale">
            <div class="headline">名片圈名称
                <a class="opshow-create" data-display="modal" data-backdrop="true" data-target="#editGroupModal"
                   data-url="{{ url()->current() }}">
                    <div class="btn primary">
                        <i class="icon icon-pencil has-padding-sm"></i>
                    </div>
                    <div class="title ">编辑</div>
                </a>
                <span class="small">人数</span>
                <span class="small">临时</span>
                {{--<a title="返回"><i class="icon-arrow-left"></i></a>--}}
            </div>
            <div class="title small muted">人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述人脉圈描述</div>
        </div>
        <section class="section">
            <div class="list collapse in">
                <div class="item multi-lines with-avatar">
                    <div class="avatar circle red">
                        <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>
                    </div>
                    <a class="avatar circle red"
                       href="">
                        头像
                    </a>
                    <a class="content"
                       href="">
                        <div class="title">nickname</div>
                        <div class="subtitle">
                            {{--                            @if($subitem['follower_type']=='App\Models\User')--}}
                            <label class="warning has-padding-h rounded">
                                个人
                            </label>
                            {{--@else--}}
                            <label class="primary has-padding-h m rounded">
                                企业
                            </label>
                            {{--@endif--}}
                        </div>
                    </a>
                    <a class="btn" data-display="collapse" data-target="#sub1"
                       data-group=".item-footer">
                        <i class="icon icon-ellipsis-h muted"></i>
                    </a>
                </div>
                <div class="item item-footer justified text-center collapse hidden"
                     data-subid="1"
                     id="sub1">
                    <a href="">
                        <i class="icon icon-phone has-padding-sm"></i>拨号
                    </a>
                    <a href="">
                        <i class="icon icon-eye-open has-padding-sm"></i>查看
                    </a>
                    {{--<a class="opshow-group" onclick="showGroup({{$item['id']}});"--}}
                    <a class="opshow-group"
                       data-url=""
                       data-display data-backdrop="true" data-target="#groupListModal">
                        {{--data-display data-backdrop="true">--}}
                        <i class="icon icon-exchange has-padding-sm"></i>分组
                    </a>
                    <a class="opshow-delete text-danger"
                       data-display="modal" data-backdrop="true" data-target=".confirmModal"
                       data-url="">
                        <i class="icon icon-trash has-padding-sm"></i>删除</a>
                </div>
            </div>
            <div class="list collapse in">
                <div class="item multi-lines with-avatar">
                    <div class="avatar circle red">
                        <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>
                    </div>
                    <a class="avatar circle red"
                       href="">
                        头像
                    </a>
                    <a class="content"
                       href="">
                        <div class="title">nickname</div>
                        <div class="subtitle">
                            {{--                            @if($subitem['follower_type']=='App\Models\User')--}}
                            <label class="warning has-padding-h rounded">
                                个人
                            </label>
                            {{--@else--}}
                            <label class="primary has-padding-h m rounded">
                                企业
                            </label>
                            {{--@endif--}}
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
                    <a href="">
                        <i class="icon icon-heart has-padding-sm"></i>关注
                    </a>
                    <a href="">
                        <i class="icon icon-heart-empty has-padding-sm"></i>取消关注
                    </a>
                    <a href="">
                        <i class="icon icon-eye-open has-padding-sm"></i>查看
                    </a>
                    <a class="opshow-delete text-danger"
                       data-display="modal" data-backdrop="true" data-target=".confirmModal"
                       data-url="">
                        <i class="icon icon-signout has-padding-sm"></i>踢出</a>
                    <a class="opshow-delete text-danger"
                       data-display="modal" data-backdrop="true" data-target=".confirmModal"
                       data-url="">
                        <i class="icon icon-signout has-padding-sm"></i>退出</a>
                </div>

            </div>
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
                    <label>有效期</label>
                    <div class="radio inline-block">
                        <input type="radio" name="Circle[expired_at]" value="0" checked>
                        <label for="Circle[expired_at]">永久</label>
                    </div>
                    <div class="radio inline-block">
                        <input type="radio" name="Circle[expired_at]" value="3">
                        <label for="Circle[expired]">3天</label>
                    </div>
                    <div class="radio inline-block">
                        <input type="radio" name="Circle[expired_at]" value="7">
                        <label for="Circle[expired]">7天</label>
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
        });
    </script>
@stop

