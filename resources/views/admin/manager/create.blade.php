@extends('admin.common.layout')
@section('title', '添加客服')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.manager.create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/manager') }}" method="post"
                          enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Manager.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name">账号 <span
                                        class="text-danger">*</span></label>
                            <div class="col-md-6">
                                <input id="name" name="Manager[name]" type="text" placeholder="输入用户名"
                                       class="form-control" value="{{ old('Manager.name') }}">
                            </div>
                            @if ($errors->has('Manager.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Manager.name') }}</strong>
                                </span>
                            @endif
                        </div><!--name-->
                        <div class="form-group {{ $errors->has('Manager.password') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="password">密码 <span
                                        class="text-danger">*</span></label>
                            <div class="col-md-6">
                                <input id="password" name="Manager[password]" type="password" placeholder="输入密码"
                                       class="form-control">
                            </div>
                            @if ($errors->has('Manager.password'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('Manager.password') }}</strong>
                                    </span>
                            @endif
                        </div><!--password-->
                        <div class="form-group {{ $errors->has('Manager.password_confirmation') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="password-confirm">确认密码 <span class="text-danger">*</span></label>
                            <div class="col-md-6">
                                <input id="password-confirm" name="Manager[password_confirmation]" type="password"
                                       placeholder="再次输入密码"
                                       class="form-control">
                            </div>
                            @if ($errors->has('Manager.password_confirmation'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Manager.password_confirmation') }}</strong>
                                </span>
                            @endif
                        </div><!--password_confirmation-->
                        <div class="form-group {{ $errors->has('Manager.email') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="email">邮箱</label>
                            <div class="col-md-6">
                                <input id="email" name="Manager[email]" type="text" placeholder="输入邮箱"
                                       class="form-control" value="{{ old('Manager.email') }}">
                            </div>
                            @if ($errors->has('Manager.email'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Manager.email') }}</strong>
                                </span>
                            @endif
                        </div><!--email-->
                        <div class="form-group {{ $errors->has('Manager.nickname') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="nickname">昵称</label>
                            <div class="col-md-6">
                                <input id="name" name="Manager[nickname]" type="text" placeholder="输入用户名(6~20个字符)"
                                       class="form-control" value="{{ old('Manager.nickname') }}">
                            </div>
                            @if ($errors->has('Manager.nickname'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Manager.nickname') }}</strong>
                                </span>
                            @endif
                        </div><!--nickname-->
                        <div class="form-group {{ $errors->has('Manager.avatar') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="avatar">头像</label>
                            <div class="col-md-6">
                                <input id="avatar" name="Manager[avatar]" type="file">
                                {{--<input name="Manager[avatar]" type="hidden" value="">--}}
                                {{--<input id="avatar" class="file_upload" type="file" value="">--}}
                            </div>
                            <img src="" alt="" class="img-circle" id="avatar-img">
                            @if ($errors->has('Manager.avatar'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Manager.avatar') }}</strong>
                                </span>
                            @endif
                        </div><!--avatar-->
                        <div class="form-group {{ $errors->has('Manager.mobile') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="mobile">手机</label>
                            <div class="col-md-6">
                                <input id="mobile" name="Manager[mobile]" type="text" placeholder="输入手机号"
                                       class="form-control" value="{{ old('Manager.mobile') }}">
                            </div>
                            @if ($errors->has('Manager.mobile'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Manager.mobile') }}</strong>
                                </span>
                            @endif
                        </div><!--mobile-->
                        <div class="form-group {{ $errors->has('Manager.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">个性签名</label>
                            <div class="col-md-6">
                                <textarea id="description" name="Manager[description]" class="form-control"
                                          rows="3"></textarea>
                            </div>
                            @if ($errors->has('Manager.description'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Manager.description') }}</strong>
                                </span>
                            @endif
                        </div><!--description-->
                        <div class="form-group {{ $errors->has('Manager.is_super') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="is_super">超级管理员</label>
                            <div class="col-md-6">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="Manager[is_super]" value="1">是
                                    </label>
                                </div>
                            </div>
                            @if ($errors->has('Manager.is_super'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('Manager.is_super') }}</strong>
                                    </span>
                            @endif
                        </div><!--is_super-->
                        <div class="form-group {{ $errors->has('Manager.is_active') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="is_active">账号状态</label>
                            <div class="col-md-6">
                                @foreach($common->isActive() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="Manager[is_active]"
                                                   value="{{ $item }}" {{ old('Manager.is_active') == $item ? 'checked' : '' }}>{{ $value }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                            @if ($errors->has('Manager.is_active'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('Manager.is_active') }}</strong>
                                    </span>
                            @endif
                        </div><!--is_active-->
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <button type="reset" class="btn btn-warning btn-md">重置</button>
                                <a href="{{ url('admin/manager') }}" type="button" role="button"
                                   class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop
@section('javascript')

    <script>
        <?php $timestamp = time();?>
        $(function () {
//            1、选择图片添加到队列。
//            2、限制只能选择一张，可重新选择，选择后覆盖第一张。
//            3、提交之前可预览图片，切显示图片名
//            4、图片随着表单提交一起提交，图片路径保存数据库中。
            console.log($("input[name='Manager[avatar]']").val());
            $(".file_upload").uploadify({
                "swf": "{{ asset('/static/common/uploadify/uploadify.swf') }}", // 指定上传控件的主体文件
                "uploader": "{{ url('/upload') }}", // 图片处理文件
                "checkExisting": "{{ asset('/static/common/uploadify/check-exists.php') }}",
                "formData": {
                    "timestamp": "<?php echo $timestamp;?>",
                    "_token": "{{ csrf_token() }}"
                },
                "fileTypeDesc": "选择图片",
                "fileTypeExts": "*.gif; *.jpg; *.png",
                "removeCompleted": false,
//                "auto": false,
                "buttonText": "选择图片",
                "onSelect": function (file) {
//                    console.log(file);
                    var count = $(".uploadify-queue-item").length;
                    console.log(count);
                    console.log(file);

                    if (count > 1) {
                        alert("只能选择一张图片");
                        this.cancelUpload(file.id);//取消当前图片上传
                        $("#" + file.id).remove();//从队列中删除当前图片状态
                    }
                },
                "onCancel": function (file) {

                },

                "onUploadSuccess": function (file, data, response) {
//                    console.log(file);
                    console.log(data);
                    $("input[name='Manager[avatar]']").val(data);
                    $("#avatar-img").attr("scr", data);
                }
            });
        });
    </script>
@stop
