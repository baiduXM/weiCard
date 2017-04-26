@extends('admin.common.layout')
@section('title', '员工详情')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.employee.show', $employee->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">详细信息</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th class="text-right col-md-3">ID</th>
                                <td class="col-md-9">{{ $employee->id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司</th>
                                <td>{{ isset($employee->company) ? $employee->company->name : '' }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">部门</th>
                                <td>{{ isset($employee->department) ? $employee->department->name : '' }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">关联用户</th>
                                <td>{{ isset($employee->user) ? $employee->user->name : '' }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">工号</th>
                                <td>{{ $employee->number }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">姓名</th>
                                <td>{{ $employee->name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">职位</th>
                                <td>{{ $employee->title }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">手机</th>
                                <td>{{ $employee->mobile }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">座机</th>
                                <td>{{ $employee->telephone }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">简介</th>
                                <td>{{ $employee->description }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $employee->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">更新时间</th>
                                <td>{{ $employee->updated_at }}</td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <a href="{{ url('admin/employee/' . $employee->id . '/edit') }}" type="button"
                                   class="btn btn-primary btn-md">编辑</a>
                                <a href="{{ url()->previous() }}" type="button" role="button"
                                   class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop
@section('javascript')
    <script>
        $(".verify-failed").click(function () {
            alert({{ $employee->id }});
        });
    </script>
@stop