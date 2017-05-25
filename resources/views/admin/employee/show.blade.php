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
                                <th class="text-right">工号</th>
                                <td>{{ $employee->number }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">姓名</th>
                                <td>{{ $employee->nickname }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">头像</th>
                                <td>
                                    <img src="{{ $employee->avatar ? asset($employee->avatar) : ''}}" class="img-responsive"
                                         style="max-height: 200px;max-width: 200px;">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">绑定用户</th>
                                <td>{!! isset($employee->user) ? '<a href="'.url('admin/user/'.$employee->user->id).'">'.$employee->user->name .'</a>' : '' !!}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司</th>
                                <td>{!! isset($employee->company) ? '<a href="'.url('admin/company/'.$employee->company->id).'">'.$employee->company->name .'</a>' : '' !!}</td>
                            </tr>
                            <tr>
                                <th class="text-right">部门</th>
                                <td>{!! isset($employee->department) ? '<a href="'.url('admin/company_department/'.$employee->department->id).'">'.$employee->department->name .'</a>' : '' !!}</td>
                            </tr>
                            <tr>
                                <th class="text-right">职位</th>
                                <td>{!! isset($employee->position) ? '<a href="'.url('admin/company_position/'.$employee->position->id).'">'.$employee->position->name .'</a>' : '' !!}</td>
                            </tr>
                            <tr>
                                <th class="text-right">座机</th>
                                <td>{{ $employee->telephone }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $employee->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">更新时间</th>
                                <td>{{ $employee->updated_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">删除时间</th>
                                <td>{{ $employee->deleted_at }}</td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <a href="{{ url('admin/company_employee/' . $employee->id . '/edit') }}" role="button"
                                   class="btn btn-primary btn-md">编辑</a>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/company_employee') : url()->previous() }}"
                                   role="button" class="btn btn-danger btn-md">返回</a>
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

    </script>
@stop