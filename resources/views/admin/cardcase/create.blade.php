@extends('admin.common.layout')
@section('title', '创建名片')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.cardcase.create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('mpmanager/department') }}" method="post">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Department.company_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="company_id"><span class="text-danger">*</span>
                                公司</label>
                            <div class="col-md-6">
                                <select class="form-control" id="company_id" name="Department[company_id]">
                                    @foreach($companies as $company)
                                        <option {{ old('Department.company_id') == $company->id ? 'selected' : '' }}
                                                value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @if ($errors->has('Department.company_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.company_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- company_id公司ID -->

                        <div class="form-group {{ $errors->has('Department.pid') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="pid"><span class="text-danger">*</span>
                                父级部门</label>
                            <div class="col-md-6">
                                <select class="form-control" id="pid" name="Department[pid]">
                                    <option {{ old('Department.pid') ? '' : 'selected'  }} value="0">顶级部门</option>
                                    {{--@foreach($companies[]->departments as $department)--}}
                                    {{--<option {{ old('Department.pid') == $department->id ? 'selected' : '' }}--}}
                                    {{--value="{{ $department->id }}">{{ $department->name }}</option>--}}
                                    {{--@endforeach--}}
                                </select>
                            </div>
                            @if ($errors->has('Department.company_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.company_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- pid父级ID -->

                        <div class="form-group {{ $errors->has('Department.number') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="number"><span class="text-danger">*</span>
                                工号</label>
                            <div class="col-md-6">
                                <input id="number" name="Department[number]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Department.number') }}">
                            </div>
                            @if ($errors->has('Department.number'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.number') }}</strong>
                                </span>
                            @endif
                        </div><!-- number工号 -->

                        <div class="form-group {{ $errors->has('Department.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                姓名</label>
                            <div class="col-md-6">
                                <input id="name" name="Department[name]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Department.name') }}">
                            </div>
                            @if ($errors->has('Department.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name姓名 -->

                        <div class="form-group {{ $errors->has('Department.title') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="title">
                                职位</label>
                            <div class="col-md-6">
                                <input id="title" name="Department[title]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Department.title') }}">
                            </div>
                            @if ($errors->has('Department.title'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.title') }}</strong>
                                </span>
                            @endif
                        </div><!-- title职位 -->

                        <div class="form-group {{ $errors->has('Department.mobile') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="mobile">
                                手机</label>
                            <div class="col-md-6">
                                <input id="mobile" name="Department[mobile]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Department.mobile') }}">
                            </div>
                            @if ($errors->has('Department.mobile'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.mobile') }}</strong>
                                </span>
                            @endif
                        </div><!-- mobile手机 -->

                        <div class="form-group {{ $errors->has('Department.telephone') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="telephone">
                                座机</label>
                            <div class="col-md-6">
                                <input id="telephone" name="Department[telephone]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Department.telephone') }}">
                            </div>
                            @if ($errors->has('Department.telephone'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.telephone') }}</strong>
                                </span>
                            @endif
                        </div><!-- telephone座机 -->

                        <div class="form-group {{ $errors->has('Department.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">简介</label>
                            <div class="col-md-6">
                                <textarea id="description" name="Department[description]" class="form-control"
                                          rows="3" placeholder="简介">{{ old('Department.description') }}</textarea>
                            </div>
                            @if ($errors->has('Department.description'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Department.description') }}</strong>
                                </span>
                            @endif
                        </div><!-- description简介 -->

                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <a href="{{ url()->previous() == url()->current() ? url('mpmanager/employee') : url()->previous() }}"
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