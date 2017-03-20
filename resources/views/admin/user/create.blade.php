@extends('admin.common.layout')
@section('title', '添加用户')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.user.create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/user') }}" method="post"
                          enctype="multipart/form-data">
                        {{ csrf_field() }}
                        {{--{{ var_dump(old()) }}--}}
                        {{--{{ var_dump($errors) }}--}}
                        <div class="form-group {{ $errors->has('User.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name">用户名<span
                                        class="text-danger">*</span></label>
                            <div class="col-md-6">
                                <input id="name" name="User[name]" type="text" placeholder="输入用户名"
                                       class="form-control" value="{{ old('User.name') }}">
                            </div>
                            @if ($errors->has('User.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name用户名 -->
                        <div class="form-group {{ $errors->has('User.password') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="password">密码 <span
                                        class="text-danger">*</span></label>
                            <div class="col-md-6">
                                <input id="password" name="User[password]" type="password" placeholder="输入密码"
                                       class="form-control">
                            </div>
                            @if ($errors->has('User.password'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('User.password') }}</strong>
                                    </span>
                            @endif
                        </div><!-- password密码 -->
                        <div class="form-group {{ $errors->has('User.password_confirmation') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="password-confirm">确认密码 <span class="text-danger">*</span></label>
                            <div class="col-md-6">
                                <input id="password-confirm" name="User[password_confirmation]" type="password"
                                       placeholder="再次输入密码"
                                       class="form-control">
                            </div>
                            @if ($errors->has('User.password_confirmation'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.password_confirmation') }}</strong>
                                </span>
                            @endif
                        </div><!-- password_confirmation确认密码 -->
                        <div class="form-group {{ $errors->has('User.email') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="email">邮箱</label>
                            <div class="col-md-6">
                                <input id="email" name="User[email]" type="text" placeholder="输入邮箱"
                                       class="form-control" value="{{ old('User.email') }}">
                            </div>
                            @if ($errors->has('User.email'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.email') }}</strong>
                                </span>
                            @endif
                        </div><!-- email邮箱 -->
                        <div class="form-group {{ $errors->has('User.nickname') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="nickname">昵称</label>
                            <div class="col-md-6">
                                <input id="name" name="User[nickname]" type="text" placeholder="输入昵称"
                                       class="form-control" value="{{ old('User.nickname') }}">
                            </div>
                            @if ($errors->has('User.nickname'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.nickname') }}</strong>
                                </span>
                            @endif
                        </div><!-- nickname昵称 -->
                        <div class="form-group {{ $errors->has('User.avatar') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="avatar">头像</label>
                            <div class="col-md-6">
                                <input id="avatar" name="User[avatar]" type="file">
                            </div>
                            @if ($errors->has('User.avatar'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.avatar') }}</strong>
                                </span>
                            @endif
                        </div><!-- avatar头像 -->
                        <div class="form-group {{ $errors->has('User.mobile') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="mobile">手机</label>
                            <div class="col-md-6">
                                <input id="mobile" name="User[mobile]" type="text" placeholder="输入手机号"
                                       class="form-control" value="{{ old('User.mobile') }}">
                            </div>
                            @if ($errors->has('User.mobile'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.mobile') }}</strong>
                                </span>
                            @endif
                        </div><!-- mobile手机 -->
                        <div class="form-group {{ $errors->has('User.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">个性签名</label>
                            <div class="col-md-6">
                                <textarea id="description" name="User[description]" class="form-control"
                                          rows="3">{{ old('User.description') }}</textarea>
                            </div>
                            @if ($errors->has('User.password_confirmation'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.password_confirmation') }}</strong>
                                </span>
                            @endif
                        </div><!-- description个性签名 -->
                        <div class="form-group {{ $errors->has('User.is_admin') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="is_admin">管理员</label>
                            <div class="col-md-6">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="User[is_admin]" value="1" {{ old('User.is_admin') == 1 ? 'checked' : '' }}>是
                                    </label>
                                </div>
                            </div>
                            @if ($errors->has('User.is_admin'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('User.is_admin') }}</strong>
                                    </span>
                            @endif
                        </div><!-- is_admin是否是管理员 -->
                        <div class="form-group {{ $errors->has('User.is_active') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="is_active">账号状态</label>
                            <div class="col-md-6">
                                @foreach($user->isActive() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="User[is_active]"
                                                   value="{{ $item }}" {{ old('User.is_active') == $item ? 'checked' : '' }}>{{ $value }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                            @if ($errors->has('User.is_active'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('User.is_active') }}</strong>
                                    </span>
                            @endif
                        </div><!-- is_active是否可用 -->
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <a href="{{ url('admin/user/create') }}" type="reset"
                                   class="btn btn-default btn-md">重置</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop