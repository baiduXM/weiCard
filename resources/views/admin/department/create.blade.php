@extends('admin.common.layout')
@section('title', '添加部门')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.department.create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加部门</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/company_department') }}" method="post">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Department.company_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="company_id"><span class="text-danger">*</span>
                                公司</label>
                            <div class="col-md-6">
                                <select class="form-control" id="company_id" name="Department[company_id]">
                                    @foreach($companies as $company)
                                        <option {{ old('Department.company_id') == $company->id ? 'selected' : '' }}
                                                value="{{ $company->id }}">{{ $company->display_name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @if ($errors->has('Department.company_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.company_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- company_id公司ID -->

                        <div class="form-group {{ $errors->has('Department.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                名称</label>
                            <div class="col-md-6">
                                <input id="number" name="Department[name]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Department.name') }}">
                            </div>
                            @if ($errors->has('Department.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name名称 -->


                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/company_department') : url()->previous() }}"
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
        $(function () {

        });
    </script>
@stop