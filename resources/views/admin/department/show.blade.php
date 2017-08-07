@extends('admin.common.layout')
@section('title', '部门详情')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.department.show', $department->id) !!}
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
                                <td class="col-md-9">{{ $department->id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司</th>
                                <td>{{ isset($department->company) ? $department->company->display_name : '' }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">部门</th>
                                <td>{{ $department->name or '' }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">交接人</th>
                                <td>{{ isset($department->owner) ? $department->owner->nickname : '' }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $department->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">更新时间</th>
                                <td>{{ $department->updated_at }}</td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <a href="{{ url('admin/company_department/' . $department->id . '/edit') }}" role="button"
                                   class="btn btn-primary btn-md">编辑</a>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/employee') : url()->previous() }}"
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