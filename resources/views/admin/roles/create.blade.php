@extends('layouts.admin')
@section('title', '添加角色')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.role.create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/role') }}" method="post">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Role.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name">角色名</label>
                            <div class="col-md-6">
                                <input id="name" name="Role[name]" type="text" placeholder="如：super_admin"
                                       class="form-control" value="{{ old('Role.name') }}">
                            </div>
                            @if ($errors->has('Role.name'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('Role.name') }}</strong>
                                    </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('Role.display_name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="display_name">可读的角色名</label>
                            <div class="col-md-6">
                                <input id="display_name" name="Role[display_name]" type="text" placeholder="如：超级管理员"
                                       class="form-control" value="{{ old('Role.display_name') }}">
                            </div>
                            @if ($errors->has('Role.display_name'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('Role.display_name') }}</strong>
                                    </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('Role.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">角色描述</label>
                            <div class="col-md-6">
                                <input id="description" name="Role[description]" type="text" placeholder="如：拥有最高管理权限"
                                       class="form-control">
                            </div>
                            @if ($errors->has('Role.description'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('Role.description') }}</strong>
                                    </span>
                            @endif
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="type">角色类型</label>
                            <div class="col-md-6">
                                @foreach($role->setType() as $ind => $val)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="Role[type]" value="{{ $ind }}"
                                                    {{ old('Role.type') == $ind ? 'checked' : '' }}>{{ $val }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <a href="{{ url('admin/role/create') }}" type="reset"
                                   class="btn btn-default btn-md">重置</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop