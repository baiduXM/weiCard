@extends('admin.common.layout')
@section('title', '注册员工')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.employee.create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/employee') }}" method="post"
                          enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Employee.company_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="company_id"><span class="text-danger">*</span>
                                公司</label>
                            <div class="col-md-6">
                                <select class="form-control" name="Employee[company_id]">
                                    @foreach($companies as $company)
                                        <option {{ old('Employee.company_id') == $company->id ? 'selected' : '' }}
                                                value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @if ($errors->has('Employee.company_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.company_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- number工号 -->

                        <div class="form-group {{ $errors->has('Employee.number') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="number"><span class="text-danger">*</span>
                                工号</label>
                            <div class="col-md-6">
                                <input id="number" name="Employee[number]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Employee.number') }}">
                            </div>
                            @if ($errors->has('Employee.number'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.number') }}</strong>
                                </span>
                            @endif
                        </div><!-- number工号 -->

                        <div class="form-group {{ $errors->has('Employee.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                姓名</label>
                            <div class="col-md-6">
                                <input id="name" name="Employee[name]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Employee.name') }}">
                            </div>
                            @if ($errors->has('Employee.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name姓名 -->

                        <div class="form-group {{ $errors->has('Employee.title') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="title">
                                职位</label>
                            <div class="col-md-6">
                                <input id="title" name="Employee[title]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Employee.title') }}">
                            </div>
                            @if ($errors->has('Employee.title'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.title') }}</strong>
                                </span>
                            @endif
                        </div><!-- title职位 -->

                        <div class="form-group {{ $errors->has('Employee.mobile') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="mobile">
                                手机</label>
                            <div class="col-md-6">
                                <input id="mobile" name="Employee[mobile]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Employee.mobile') }}">
                            </div>
                            @if ($errors->has('Employee.mobile'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.mobile') }}</strong>
                                </span>
                            @endif
                        </div><!-- mobile手机 -->

                        <div class="form-group {{ $errors->has('Employee.telephone') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="telephone">
                                座机</label>
                            <div class="col-md-6">
                                <input id="telephone" name="Employee[telephone]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Employee.telephone') }}">
                            </div>
                            @if ($errors->has('Employee.telephone'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.telephone') }}</strong>
                                </span>
                            @endif
                        </div><!-- telephone座机 -->

                        <div class="form-group {{ $errors->has('Employee.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">简介</label>
                            <div class="col-md-6">
                                <textarea id="description" name="Employee[description]" class="form-control"
                                          rows="3" placeholder="简介">{{ old('Employee.description') }}</textarea>
                            </div>
                            @if ($errors->has('Employee.description'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.description') }}</strong>
                                </span>
                            @endif
                        </div><!-- description简介 -->

                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/employee') : url()->previous() }}"
                                   role="button" class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop