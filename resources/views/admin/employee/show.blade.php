@extends('admin.common.layout')
@section('title', '公司详情')
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
                                <th class="text-right">公司名称</th>
                                <td class="">{{ $employee->name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司显示名称</th>
                                <td>{{ $employee->display_name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">LOGO</th>
                                <td>
                                    <img src="{{ $employee->logo ? asset($employee->logo) : ''}}" class="img-responsive"
                                         style="max-height: 200px;max-width: 200px;">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">公司地址</th>
                                <td>{{ $employee->address }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司电话</th>
                                <td>{{ $employee->telephone }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司简介</th>
                                <td>{{ $employee->description }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">注册人ID</th>
                                <td>{{ $employee->user_id . ' - ' . $common->getValue('users', $employee->user_id) }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">激活状态</th>
                                <td>
                                    @if($employee->is_active == 1)
                                        <span class="label label-success">{{ $common->isActive($employee->is_active) }}</span>
                                    @else
                                        <span class="label label-default">{{ $common->isActive($employee->is_active) }}</span>
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">审核人ID</th>
                                <td>{{ $employee->manager_id . ' - ' . $common->getValue('managers', $employee->manager_id) }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">审核状态</th>
                                <td>
                                    @if($employee->status == 0)
                                        <span class="label label-primary">{{ $employee->getStatus($employee->status) }}</span>
                                    @elseif($employee->status == 1)
                                        <span class="label label-success">{{ $employee->getStatus($employee->status) }}</span>
                                    @elseif($employee->status == 2)
                                        <span class="label label-default">{{ $employee->getStatus($employee->status) }}</span>
                                    @elseif($employee->status == 3)
                                        <span class="label label-warning">{{ $employee->getStatus($employee->status) }}</span>
                                    @endif
                                    {{--                                    {{ $employee->getStatus($employee->status) }}--}}
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">审核失败原因</th>
                                <td>{{ $employee->reason }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">审核通过时间</th>
                                <td>{{ $employee->verified_at }}</td>
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
                                @if($employee->status != $employee::VERIFIED_SUCCEED)
                                    <a href="{{ url('admin/company/' . $employee->id . '/verified') }}" type="button"
                                       class="btn btn-success btn-md">审核</a>
                                @endif
                                <a href="{{ url('admin/company/' . $employee->id . '/edit') }}" type="button"
                                   class="btn btn-primary btn-md">编辑</a>
                                <a href="{{ url('admin/company') }}" type="button" role="button"
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