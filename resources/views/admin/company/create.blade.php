@extends('admin.common.layout')
@section('title', '注册公司')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.company.create') !!}
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

                        <div class="form-group {{ $errors->has('Company.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                公司名称</label>
                            <div class="col-md-6">
                                <input id="name" name="Company[name]" type="text" placeholder="公司名（字母或数字）"
                                       class="form-control" value="{{ old('Company.name') }}">
                            </div>
                            @if ($errors->has('Company.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name公司代码 -->
                        <div class="form-group {{ $errors->has('Company.display_name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="display_name"><span class="text-danger">*</span>
                                显示名称</label>
                            <div class="col-md-6">
                                <input id="display_name" name="Company[display_name]" type="text" placeholder="输入公司显示名称"
                                       class="form-control" value="{{ old('Company.display_name') }}">
                            </div>
                            @if ($errors->has('Company.display_name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.display_name') }}</strong>
                                </span>
                            @endif
                        </div><!-- display_name公司名 -->
                        <div class="form-group {{ $errors->has('Company.logo') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="logo">LOGO</label>
                            <div class="col-md-6">
                                <input id="logo" name="Company[logo]" type="file">
                            </div>
                            @if ($errors->has('Company.logo'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.logo') }}</strong>
                                </span>
                            @endif
                        </div><!-- logo公司Logo -->
                        <div class="form-group {{ $errors->has('Company.email') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="email">公司邮箱</label>
                            <div class="col-md-6">
                                <input id="email" name="Company[email]" type="text" placeholder="输入公司邮箱"
                                       class="form-control" value="{{ old('Company.email') }}">
                            </div>
                            @if ($errors->has('Company.email'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.email') }}</strong>
                                </span>
                            @endif
                        </div><!-- email公司邮箱 -->
                        <div class="form-group {{ $errors->has('Company.telephone') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="telephone">公司电话</label>
                            <div class="col-md-6">
                                <input id="telephone" name="Company[telephone]" type="text" placeholder="输入公司电话"
                                       class="form-control" value="{{ old('Company.telephone') }}">
                            </div>
                            @if ($errors->has('Company.telephone'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.telephone') }}</strong>
                                </span>
                            @endif
                        </div><!-- telephone公司电话 -->
                        <div class="form-group {{ $errors->has('Company.address') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="address">公司地址</label>
                            <div class="col-md-6">
                                <input id="address" name="Company[address]" type="text" placeholder="输入公司地址"
                                       class="form-control" value="{{ old('Company.address') }}">
                            </div>
                            @if ($errors->has('Company.address'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.address') }}</strong>
                                </span>
                            @endif
                        </div><!-- address公司地址 -->
                        <div class="form-group {{ $errors->has('Company.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">公司简介</label>
                            <div class="col-md-6">
                                <textarea id="description" name="Company[description]" class="form-control"
                                          rows="3" placeholder="个性签名">{{ old('Company.description') }}</textarea>
                            </div>
                            @if ($errors->has('Company.description'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.description') }}</strong>
                                </span>
                            @endif
                        </div><!-- description公司简介 -->
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