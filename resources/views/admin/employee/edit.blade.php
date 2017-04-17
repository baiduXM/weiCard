@extends('admin.common.layout')
@section('title', '修改资料')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.employee.edit', $employee->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">编辑信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/company/' . $employee->id) }}" method="post"
                          enctype="multipart/form-data">
                        {{ method_field('put') }}
                        {{ csrf_field() }}
                        <div class="form-group {{ $errors->has('Employee.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                公司名</label>
                            <div class="col-md-6">
                                <input id="name" name="Employee[name]" type="text" placeholder="公司名（字母或数字）" readonly
                                       class="form-control"
                                       value="{{ old('Employee.name') ? old('Employee.name') : $employee->name }}">
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
                                       class="form-control"
                                       value="{{ old('Employee.display_name') ? old('Employee.display_name') : $employee->display_name }}">
                            </div>
                            @if ($errors->has('Employee.display_name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.display_name') }}</strong>
                                </span>
                            @endif
                        </div><!-- display_name公司名 -->
                        <div class="form-group {{ $errors->has('Employee.user_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="user_id"><span class="text-danger">*</span>
                                公司注册人ID</label>
                            <div class="col-md-6">
                                <input id="user_id" name="Employee[user_id]" type="number" placeholder="公司注册人"
                                       class="form-control"
                                       value="{{ old('Employee.user_id') ? old('Employee.user_id') : $employee->user_id }}">
                            </div>
                            @if ($errors->has('Employee.user_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.user_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- user_id公司注册人id -->
                        <div class="form-group {{ $errors->has('Employee.logo') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="logo">Logo</label>
                            <div class="col-md-6">
                                <input id="logo" name="Employee[logo]" type="file" >
{{--                                       value="{{ old('Employee.logo') ? old('Employee.logo') : $employee->logo }}">--}}
                            </div>
                            @if ($errors->has('Employee.logo'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.logo') }}</strong>
                                </span>
                            @endif
                        </div><!-- logo公司Logo -->
                        @if ($employee->logo)
                            <div class="form-group">
                                <div class="col-md-2 col-md-offset-3">
                                    <img src="{{ asset($employee->logo) }}" class="img-responsive">
                                </div>
                            </div><!-- logo公司LOGO img显示 -->
                        @endif
                        <div class="form-group {{ $errors->has('Employee.email') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="email">公司邮箱</label>
                            <div class="col-md-6">
                                <input id="email" name="Employee[email]" type="text" placeholder="输入公司邮箱"
                                       class="form-control"
                                       value="{{ old('Employee.email') ? old('Employee.email') : $employee->email }}">
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
                                       class="form-control"
                                       value="{{ old('Employee.telephone') ? old('Employee.telephone') : $employee->telephone }}">
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
                                       class="form-control"
                                       value="{{ old('Employee.address') ? old('Employee.address') : $employee->address }}">
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
                                          rows="3"
                                          placeholder="公司简介">{{ old('Employee.description') ? old('Employee.description') : $employee->description }}</textarea>
                            </div>
                            @if ($errors->has('Employee.description'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.description') }}</strong>
                                </span>
                            @endif
                        </div><!-- description公司简介 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="is_active">账号状态</label>
                            <div class="col-md-6">
                                @foreach($common->isActive() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="Employee[is_active]" value="{{ $item }}"
                                            @if(old('Employee.is_active') === null)
                                                {{ $employee->is_active == $item ? 'checked' : '' }}
                                                    @else
                                                {{ old('Employee.is_active') == $item ? 'checked' : '' }}
                                                    @endif
                                            >{{ $value }}
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
@section('javascript')
    <script>
    </script>
@stop