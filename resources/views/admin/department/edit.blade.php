@extends('admin.common.layout')
@section('title', '修改资料')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.department.edit', $department->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">编辑信息</div>
                <div class="panel-body">
                    <form class="form-horizontal"
                          action="{{ route('mpmanager.company_department.update' ,$department->id ) }}"
                          method="put">
                        {{--enctype="multipart/form-data">--}}
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Department.company_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="company_id"><span class="text-danger">*</span>
                                公司</label>
                            <div class="col-md-6">
                                <select class="form-control" id="company_id" name="Department[company_id]" disabled>
                                    <option {{ old('Department.company_id') == $department->company->id ? 'selected' : '' }}
                                            value="{{ $department->company->id }}">{{ $department->company->display_name }}</option>
                                </select>
                                <input name="Department[company_id]" type="hidden"
                                       value="{{ $department->company->id }}">
                            </div>
                            @if ($errors->has('Department.company_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.company_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- company_id公司 -->

                        <div class="form-group {{ $errors->has('Department.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                部门名称</label>
                            <div class="col-md-6">
                                <input id="name" name="Department[name]" type="text" placeholder=""
                                       class="form-control"
                                       value="{{ old('Department.name') ? old('Department.name') : $department->name }}">
                            </div>
                            @if ($errors->has('Department.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name部门名称 -->

                        <div class="form-group {{ $errors->has('Department.employee_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="employee_id">
                                交接人</label>
                            <div class="col-md-6">
                                <select class="form-control" id="employee_id" name="Department[employee_id]">
                                    <option value="0">请选择</option>
                                    @if(count($department->employees))
                                        @foreach($department->employees as $employee)
                                            <option {{ old('Department.employee_id') == $employee->id ? 'selected' :
                                        ( isset($department->owner) && $department->owner->id == $employee->id ? 'selected' : '') }}
                                                    value="{{ $employee->id }}">{{ $employee->nickname }}</option>
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                            @if ($errors->has('Department.employee_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.employee_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- employee_id交接人ID -->

                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <input type="submit" class="btn btn-primary btn-md" value="确认">
                                {{--<button type="submit" class="btn btn-primary btn-md">确认</button>--}}
                                <button type="reset" class="btn btn-warning btn-md">重置</button>
                                <a href="{{ url()->previous() == url()->current() ? url('mpmanager/company_department') : url()->previous() }}"
                                   role="button" class="btn btn-danger btn-md">返回</a>
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