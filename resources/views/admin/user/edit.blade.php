@extends('admin.common.layout')
@section('title', '修改用户')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.user.edit', $user->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">修改用户</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/user/' . $user->id) }}" method="post"
                          enctype="multipart/form-data">
                        {{ method_field('put') }}
                        {{ csrf_field() }}
                        <div class="form-group {{ $errors->has('User.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name">用户名</label>
                            <div class="col-md-6">
                                <input id="name" name="User[name]" type="text" placeholder="输入用户名" readonly
                                       class="form-control"
                                       value="{{ old('User.name') ? old('User.name') : $user->name }}">
                            </div>
                            @if ($errors->has('User.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name用户名 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="password">密码</label>
                            <div class="col-md-6">
                                <button id="modifyPassword" type="button" class="btn btn-default" data-container="body"
                                        data-toggle="popover" data-placement="right"
                                        data-content="暂时无法修改密码">修改密码
                                </button>
                            </div>
                        </div><!-- password密码 -->
                        <div class="form-group {{ $errors->has('User.nickname') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="nickname">昵称</label>
                            <div class="col-md-6">
                                <input id="name" name="User[nickname]" type="text" placeholder="输入昵称"
                                       class="form-control"
                                       value="{{ old('User.nickname') ? old('User.nickname') : $user->nickname }}">
                            </div>
                            @if ($errors->has('User.nickname'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.nickname') }}</strong>
                                </span>
                            @endif
                        </div><!-- nickname昵称 -->
                        <div class="form-group {{ $errors->has('User.email') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="email">邮箱</label>
                            <div class="col-md-6">
                                <input id="email" name="User[email]" type="text" placeholder="输入邮箱"
                                       class="form-control"
                                       value="{{ old('User.email') ? old('User.email') : $user->email }}">
                            </div>
                            @if ($errors->has('User.email'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.email') }}</strong>
                                </span>
                            @endif
                        </div><!-- email邮箱 -->
                        <div class="form-group {{ $errors->has('User.mobile') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="mobile">手机</label>
                            <div class="col-md-6">
                                <input id="mobile" name="User[mobile]" type="text" placeholder="输入手机号"
                                       class="form-control"
                                       value="{{ old('User.mobile') ? old('User.mobile') : $user->mobile }}">
                            </div>
                            @if ($errors->has('User.mobile'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.mobile') }}</strong>
                                </span>
                            @endif
                        </div><!-- mobile手机 -->

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
                        @if ($user->avatar)
                            <div class="form-group">
                                <div class="col-md-2 col-md-offset-3">
                                    <img src="{{ asset($user->avatar) }}" class="img-responsive">
                                </div>
                            </div><!-- avatar头像 img显示 -->
                        @endif
                        <div class="form-group {{ $errors->has('User.sex') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="sex">性别</label>
                            <div class="col-md-6">
                                @foreach($common->getSex() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="User[sex]" value="{{ $item }}"
                                            @if(old('User.sex') === null)
                                                {{ $user->sex == $item ? 'checked' : '' }}
                                                    @else
                                                {{ old('User.sex') == $item ? 'checked' : '' }}
                                                    @endif
                                            >{{ $value }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                            @if ($errors->has('User.sex'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.sex') }}</strong>
                                </span>
                            @endif
                        </div><!-- sex性别 -->
                        <div class="form-group {{ $errors->has('User.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">个性签名</label>
                            <div class="col-md-6">
                                <textarea id="description" name="User[description]" class="form-control" rows="3"
                                          placeholder="个性签名">{{ old('User.description') ? old('User.description') : $user->description }}</textarea>
                            </div>
                            @if ($errors->has('User.description'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('User.description') }}</strong>
                                </span>
                            @endif
                        </div><!-- description个性签名 -->
                        {{--<div class="form-group">--}}
                            {{--<label class="col-md-3 control-label" for="is_active">账号状态</label>--}}
                            {{--<div class="col-md-6">--}}
                                {{--@foreach($common->isActive() as $item => $value)--}}
                                    {{--<div class="radio">--}}
                                        {{--<label>--}}
                                            {{--<input type="radio" name="User[is_active]" value="{{ $item }}"--}}
                                            {{--@if(old('User.is_active') === null)--}}
                                                {{--{{ $user->is_active == $item ? 'checked' : '' }}--}}
                                                    {{--@else--}}
                                                {{--{{ old('User.is_active') == $item ? 'checked' : '' }}--}}
                                                    {{--@endif--}}
                                            {{-->{{ $value }}--}}
                                        {{--</label>--}}
                                    {{--</div>--}}
                                {{--@endforeach--}}
                            {{--</div>--}}
                        {{--</div><!-- is_active是否可用 -->--}}
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <button type="reset" class="btn btn-warning btn-md">重置</button>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/user') : url()->previous() }}" role="button"
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
        $('#modifyPassword').popover({
            'trigger': 'click',
        });
    </script>
@stop