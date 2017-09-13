@extends('admin.common.layout')
@section('title', '模板上传')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.template.create') !!}
@stop
@section('content')

    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">模板上传</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('mpmanager/template') }}" method="post"
                          enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Template.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                模板名称</label>
                            <div class="col-md-6">
                                <input id="name" name="Template[name]" type="text" placeholder="模板名称"
                                       class="form-control" value="{{ old('Template.name') }}">
                            </div>
                            @if ($errors->has('Template.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Template.name') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('Template.display_name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="display_name"><span class="text-danger">*</span>
                                模板显示名称</label>
                            <div class="col-md-6">
                                <input id="name" name="Template[display_name]" type="text" placeholder="模板显示名称"
                                       class="form-control" value="{{ old('Template.display_name') }}">
                            </div>
                            @if ($errors->has('Template.display_name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Template.display_name') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('Template.sort') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="sort"><span class="text-danger">*</span>
                                排列序号</label>
                            <div class="col-md-6">
                                <input id="name" name="Template[sort]" type="text" placeholder="排列序号"
                                       class="form-control" value="{{ old('Template.display_name') }}">
                            </div>
                            @if ($errors->has('Template.display_name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Template.display_name') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('Template.file') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="file">模板上传</label>
                            <div class="col-md-6">
                                <input id="file" name="Template[file]" type="file">
                            </div>
                            @if ($errors->has('Template.file'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Template.file') }}</strong>
                                </span>
                            @endif
                        </div>
                        <div class="form-group {{ $errors->has('Template.type') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="type">使用范围</label>
                            <div class="col-md-6">
                                @foreach($template->getType() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="Template[type]"
                                                   value="{{ $item }}" {{ old('Template.type') == $item ? 'checked' : '' }}>{{ $value }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                            @if ($errors->has('Template.type'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Template.type') }}</strong>
                                </span>
                            @endif
                        </div><!-- sex性别 -->

                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop

