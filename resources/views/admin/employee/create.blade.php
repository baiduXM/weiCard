@extends('admin.common.layout')
@section('title', '注册公司')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.employee.create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/company') }}" method="post"
                          enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Employee.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                公司名称</label>
                            <div class="col-md-6">
                                <input id="name" name="Employee[name]" type="text" placeholder="公司名（字母或数字）"
                                       class="form-control" value="{{ old('Employee.name') }}">
                            </div>
                            @if ($errors->has('Employee.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name公司代码 -->
                        <div class="form-group {{ $errors->has('Employee.display_name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="display_name"><span class="text-danger">*</span>
                                显示名称</label>
                            <div class="col-md-6">
                                <input id="display_name" name="Employee[display_name]" type="text" placeholder="输入公司显示名称"
                                       class="form-control" value="{{ old('Employee.display_name') }}">
                            </div>
                            @if ($errors->has('Employee.display_name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.display_name') }}</strong>
                                </span>
                            @endif
                        </div><!-- display_name公司名 -->
                        <div class="form-group {{ $errors->has('Employee.logo') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="logo">LOGO</label>
                            <div class="col-md-6">
                                <input id="logo" name="Employee[logo]" type="file">
                            </div>
                            @if ($errors->has('Employee.logo'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.logo') }}</strong>
                                </span>
                            @endif
                        </div><!-- logo公司Logo -->
                        <div class="form-group {{ $errors->has('Employee.email') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="email">公司邮箱</label>
                            <div class="col-md-6">
                                <input id="email" name="Employee[email]" type="text" placeholder="输入公司邮箱"
                                       class="form-control" value="{{ old('Employee.email') }}">
                            </div>
                            @if ($errors->has('Employee.email'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.email') }}</strong>
                                </span>
                            @endif
                        </div><!-- email公司邮箱 -->
                        <div class="form-group {{ $errors->has('Employee.telephone') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="telephone">公司电话</label>
                            <div class="col-md-6">
                                <input id="telephone" name="Employee[telephone]" type="text" placeholder="输入公司电话"
                                       class="form-control" value="{{ old('Employee.telephone') }}">
                            </div>
                            @if ($errors->has('Employee.telephone'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.telephone') }}</strong>
                                </span>
                            @endif
                        </div><!-- telephone公司电话 -->
                        <div class="form-group {{ $errors->has('Employee.address') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="address">公司地址</label>
                            <div class="col-md-6">
                                <input id="address" name="Employee[address]" type="text" placeholder="输入公司地址"
                                       class="form-control" value="{{ old('Employee.address') }}">
                            </div>
                            @if ($errors->has('Employee.address'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.address') }}</strong>
                                </span>
                            @endif
                        </div><!-- address公司地址 -->
                        <div class="form-group {{ $errors->has('Employee.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">公司简介</label>
                            <div class="col-md-6">
                                <textarea id="description" name="Employee[description]" class="form-control"
                                          rows="3" placeholder="个性签名">{{ old('Employee.description') }}</textarea>
                            </div>
                            @if ($errors->has('Employee.password_confirmation'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.password_confirmation') }}</strong>
                                </span>
                            @endif
                        </div><!-- description公司简介 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="is_active">账号状态</label>
                            <div class="col-md-6">
                                @foreach($common->isActive() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="Employee[is_active]"
                                                   value="{{ $item }}" {{ old('Employee.is_active') == $item ? 'checked' : '' }}>{{ $value }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                        </div><!-- is_active是否可用 -->
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <button type="reset" class="btn btn-warning btn-md">重置</button>
                                <a href="{{ url('admin/company') }}" type="button" role="button"
                                   class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop