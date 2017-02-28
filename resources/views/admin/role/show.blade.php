@extends('admin.common.layout')
@section('title', '角色详情')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.role.show', $role->id) !!}
@stop
@section('content')

    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">角色详情</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th class="text-right col-md-3">用户名</th>
                                <td class="col-md-9">{{ $role->name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">可读的角色名</th>
                                <td>{{ $role->display_name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">角色描述</th>
                                <td>{{ $role->description }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">角色类型</th>
                                <td>{{ $role->setType($role->type) }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $role->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">更新时间</th>
                                <td>{{ $role->updated_at }}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop