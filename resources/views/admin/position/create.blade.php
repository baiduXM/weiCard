@extends('admin.common.layout')
@section('title', '添加产品')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.position') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/company_position') }}" method="post"
                          enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Position.company_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="company_id"><span class="text-danger">*</span>
                                公司</label>
                            <div class="col-md-6">
                                <select class="form-control" id="company_id" name="Position[company_id]">
                                    <option value="">选择公司</option>
                                    @foreach($companies as $company)
                                        <option {{ old('Position.company_id') == $company->id ? 'selected' : '' }}
                                                value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @if ($errors->has('Position.company_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Position.company_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- company_id公司ID -->


                        <div class="form-group {{ $errors->has('Position.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                职位名称</label>
                            <div class="col-md-6">
                                <input id="name" name="Position[name]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Position.name') }}">
                            </div>
                            @if ($errors->has('Position.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Position.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name职位名称 -->

                        <!-- <div class="form-group {{ $errors->has('Position.level') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="level"><span class="text-danger">*</span>
                                职位级别</label>
                            <div class="col-md-6">
                                <input id="level" name="Position[level]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Position.level') }}">
                            </div>
                            @if ($errors->has('Position.level'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Position.level') }}</strong>
                                </span>
                            @endif
                        </div> --><!-- level职位级别 -->

                        <!-- <div class="form-group {{ $errors->has('Position.is_only') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="is_only">是否唯一</label>
                            <div class="col-md-6">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="Position[is_only]" value="1" />是
                                    </label>
                                </div>
                            </div>
                            @if ($errors->has('Position.is_only'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('Position.is_only') }}</strong>
                                    </span>
                            @endif
                        </div> --><!--is_only-->

                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/company_product') : url()->previous() }}"
                                   role="button" class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop