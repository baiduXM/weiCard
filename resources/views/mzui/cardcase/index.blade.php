@extends('mzui.common.layout')
@section('title', '名片夹')
@section('content')
    @parent
    {{--内容容器--}}
    <div class="container">
        <section class="section">
            {{--分组--}}
            <div class="cardcase-group divider">
                {{--组名--}}
                <a class="heading muted strong" data-display="collapse" data-target="#{{ 'groupDefault' }}">
                    <div class="title">默认分组
                        <label class="info has-padding-h has-margin-sm">12</label>
                    </div>
                    <button class="btn"><i class="icon icon-angle-down"></i></button>
                </a>
                {{--分组名片列表--}}
                <div class="list collapse in" id="{{ 'groupDefault' }}">
                    <div class="item multi-lines with-avatar">
                        <div class="avatar circle">
                            <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>
                        </div>
                        <a class="content">
                            <div class="title">Catouse头像</div>
                            <div class="subtitle">个性签名</div>
                        </a>
                        <a class="btn" data-display="collapse" data-target="#{{ 'groupItem1' }}"
                                data-group=".item-footer">
                            <i class="icon icon-ellipsis-h muted"></i>
                        </a>
                    </div>
                    <div class="item item-footer justified text-center collapse hidden" data-id="{{ 1 }}"
                         id="groupItem{{ 1 }}">
                        <a data-operation="call"><i class="icon icon-phone has-padding-sm"></i>拨号</a>
                        <a data-operation="share"><i class="icon icon-share-alt has-padding-sm"></i>分享</a>
                        <a data-operation="move"><i class="icon icon-exchange has-padding-sm"></i>移动</a>
                        <a data-operation="unfollow" class="text-danger "><i class="icon icon-trash has-padding-sm"></i>删除</a>
                    </div>
                    {{--名片子项目--}}
                    <a class="item " data-display="collapse" data-target="#{{ 'groupItem2' }}"
                       data-group=".item-footer">
                        <div class="avatar circle"><i class="icon icon-user"></i></div>
                        <div class="title text-ellipsis">Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标
                        </div>
                        <i class="icon icon-ellipsis-h muted"></i>
                    </a>
                    {{--名片操作--}}
                    <div class="item item-footer justified text-center collapse hidden" data-id="{{ 2 }}"
                         id="groupItem{{ 2 }}">
                        <a data-operation="show"><i class="icon icon-eye-open has-padding-sm"></i>查看</a>
                        <a data-operation="share"><i class="icon icon-share-alt has-padding-sm"></i>分享</a>
                        <a data-operation="move"><i class="icon icon-exchange has-padding-sm"></i>移动</a>
                        <a data-operation="call"><i class="icon icon-phone has-padding-sm"></i>拨号</a>
                    </div>
                </div>
            </div>
            {{--分组--}}
            <div class="cardcase-group divider">
                <a class="heading muted strong " data-display="collapse" data-target="#{{ 'groupName' }}">
                    <div class="title ">{{ '我的家人' }}
                        <label class="info has-padding-h has-margin-sm">{{ 2 }}</label>
                    </div>
                    <div class="btn"><i class="icon icon-angle-right"></i></div>
                </a>
                {{--隐藏状态--}}
                <div class="list collapse " id="{{ 'groupName' }}">
                    <a class="item">
                        <div class="avatar circle">
                            <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="头像"/>
                        </div>
                        <div class="title">Catouse头像</div>
                        <button class="btn"><i class="icon icon-ellipsis-h muted"></i></button>
                    </a>
                    <a class="item">
                        <div class="avatar circle"><i class="icon icon-user"></i></div>
                        <div class="title text-ellipsis">Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标Catouse图标
                        </div>
                        <button class="btn"><i class="icon icon-ellipsis-h muted"></i></button>
                    </a>
                </div>
            </div>
        </section>
    </div>
    {{--侧边悬浮按钮--}}
    <nav class="affix dock-bottom dock-left dock-auto shadow-none has-margin-sm column align-start">
        <a class="btn btn-lg circle primary space-sm outline" data-display data-backdrop="true"
           data-target="#sortModal">
            <i class="icon icon-list-ul"></i>
        </a>
        <a class="btn btn-lg circle primary outline" href="{{ url()->current().'/edit' }}">
            <i class="icon icon-pencil"></i>
        </a>
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
        $(function () {

            /* 分组展开 */
            /* TODO:判断分组展开状态，变换右侧图标 icon-angle-down icon-angle-right */

            /* 子项目展开 */
            /* TODO:给当前展开子项目添加背景色 primary-pale */

        });
    </script>
@stop

