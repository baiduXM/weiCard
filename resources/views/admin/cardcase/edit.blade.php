@extends('admin.common.layout')
@section('title', '修改资料')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.employee.edit', $employee->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">编辑信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('mpmanager/employee/' . $employee->id) }}" method="post"
                          enctype="multipart/form-data">
                        {{ method_field('put') }}
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Employee.number') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="number"><span class="text-danger">*</span>
                                工号</label>
                            <div class="col-md-6">
                                <input id="number" name="Employee[number]" type="text" placeholder=""
                                       class="form-control" readonly
                                       value="{{ old('Employee.number') ? old('Employee.number') : $employee->number }}">
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
                                       class="form-control"
                                       value="{{ old('Employee.name') ? old('Employee.name') : $employee->name }}">
                            </div>
                            @if ($errors->has('Employee.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name姓名 -->

                        <div class="form-group {{ $errors->has('Employee.title') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="title">
                                头衔职务</label>
                            <div class="col-md-6">
                                <input id="title" name="Employee[title]" type="text" placeholder=""
                                       class="form-control"
                                       value="{{ old('Employee.title') ? old('Employee.title') : $employee->title }}">
                            </div>
                            @if ($errors->has('Employee.title'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Employee.title') }}</strong>
                                </span>
                            @endif
                        </div><!-- title头衔职务 -->

                        <div class="form-group {{ $errors->has('Employee.mobile') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="mobile">
                                手机</label>
                            <div class="col-md-6">
                                <input id="mobile" name="Employee[mobile]" type="text" placeholder=""
                                       class="form-control"
                                       value="{{ old('Employee.mobile') ? old('Employee.mobile') : $employee->mobile }}">
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
                                       class="form-control"
                                       value="{{ old('Employee.telephone') ? old('Employee.telephone') : $employee->telephone }}">
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
                                          rows="3"
                                          placeholder="简介">{{ old('Employee.description') ? old('Employee.description') : $employee->description }}</textarea>
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
                                <button type="reset" class="btn btn-warning btn-md">重置</button>
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
    </script>
@stop