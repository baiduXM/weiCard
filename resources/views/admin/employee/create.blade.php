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
                    <form class="form-horizontal" action="{{ url('admin/company_employee') }}" method="post"
                          enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Employee.company_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="company_id"><span class="text-danger">*</span>
                                公司</label>
                            <div class="col-md-6">
                                <select class="form-control" id="company_id" name="Employee[company_id]">
                                    <option value="">选择公司</option>
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
                        </div><!-- company_id公司ID -->

                        {{--<div class="form-group {{ $errors->has('Employee.department_id') ? ' has-error' : '' }}">--}}
                            {{--<label class="col-md-3 control-label" for="department_id"><span class="text-danger">*</span>--}}
                                {{--部门</label>--}}
                            {{--<div class="col-md-6">--}}
                                {{--<select class="form-control" id="department_id" name="Employee[department_id]">--}}
                                    {{--<option selected value="">无部门</option>--}}
                                {{--</select>--}}
                            {{--</div>--}}
                            {{--@if ($errors->has('Employee.company_id'))--}}
                                {{--<span class="help-block col-md-3">--}}
                                    {{--<strong>{{ $errors->first('Employee.company_id') }}</strong>--}}
                                {{--</span>--}}
                            {{--@endif--}}
                        {{--</div><!-- department_id部门ID -->--}}

                        <div class="form-group {{ $errors->has('Employee.position_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="position_id"><span class="text-danger">*</span>
                                职位</label>
                            <div class="col-md-6">
                                <select class="form-control" id="position_id" name="Employee[position_id]">
                                    <option selected value="">无职位</option>
                                </select>
                            </div>
                            @if ($errors->has('Employee.position_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.position_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- position_id职位ID -->


                        <div class="form-group {{ $errors->has('Employee.number') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="number"><span class="text-danger">*</span>
                                工号</label>
                            <div class="col-md-6">
                                <input id="number" name="Employee[number]" type="text" placeholder="以字母开头，可包含字母和数字"
                                       class="form-control" value="{{ old('Employee.number') }}">
                            </div>
                            @if ($errors->has('Employee.number'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.number') }}</strong>
                                </span>
                            @endif
                        </div><!-- number工号 -->

                        <div class="form-group {{ $errors->has('Employee.nickname') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="nickname"><span class="text-danger">*</span>
                                姓名</label>
                            <div class="col-md-6">
                                <input id="nickname" name="Employee[nickname]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Employee.nickname') }}">
                            </div>
                            @if ($errors->has('Employee.nickname'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.nickname') }}</strong>
                                </span>
                            @endif
                        </div><!-- name姓名 -->

                        <div class="form-group {{ $errors->has('Employee.avatar') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="avatar">头像</label>
                            <div class="col-md-6">
                                <input id="avatar" name="Employee[avatar]" type="file">
                            </div>
                            @if ($errors->has('Employee.avatar'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.avatar') }}</strong>
                                </span>
                            @endif
                        </div><!-- avatar头像 -->

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


                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/company_employee') : url()->previous() }}"
                                   role="button" class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop