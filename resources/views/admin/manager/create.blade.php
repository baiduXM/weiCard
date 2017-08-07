@extends('admin.common.layout')
@section('title', '添加客服')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.manager.create') !!}
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
                                <a href="{{ url()->previous() == url()->current() ? url('admin/employee') : url()->previous() }}" type="button" role="button"
                                   class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div><!--button-->

                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop
@section('javascript')
    <script>
    </script>
@stop
