@extends('layouts.admin')
@section('title', '添加用户')
@section('breadcrumb')
    {!! Breadcrumbs::render('create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="" method="post">
                        {{ csrf_field() }}
                        <div class="form-group {{ $errors->has('User.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name">用户名</label>
                            <div class="col-md-6">
                                <input id="name" name="User[name]" type="text" placeholder="输入用户名(6~20个字符)"
                                       class="form-control" value="{{ old('User.name') }}">
                            </div>
                            @if ($errors->has('User.name'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('User.name') }}</strong>
                                    </span>
                            @endif
                        </div>
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
                        </div>
                        <div class="form-group {{ $errors->has('User.password') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="password">密码</label>
                            <div class="col-md-6">
                                <input id="password" name="User[password]" type="password" placeholder="输入密码(至少6位)"
                                       class="form-control">
                            </div>
                            @if ($errors->has('User.password'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('User.password') }}</strong>
                                    </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('User.password_confirmation') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="password-confirm">确认密码</label>
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
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="message">权限</label>
                            <div class="col-md-6">
                                @foreach($user->role() as $ind => $val)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="User[role]" value="{{ $ind }}"
                                                    {{ old('User.role') == $ind ? 'checked' : '' }}>{{ $val }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                        </div>
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