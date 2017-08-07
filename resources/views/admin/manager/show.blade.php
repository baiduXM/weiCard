@extends('admin.common.layout')
@section('title', '客服详情')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.manager.show', $manager->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">账户信息</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th class="text-right col-sm-3">ID</th>
                                <td class="col-md-9">{{ $manager->id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">用户名</th>
                                <td>{{ $manager->name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">邮箱</th>
                                <td>{{ $manager->email }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">手机</th>
                                <td>{{ $manager->mobile }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">昵称</th>
                                <td>{{ $manager->nickname }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">状态</th>
                                <td>
                                    @if($manager->is_super == $manager::IS_SUPER || $manager->name == 'admin')
                                        <span class="label label-primary">{{ $manager->isSuper($manager->is_super) }}</span>
                                    @endif
                                    @if($manager->is_active == $common::IS_ACTIVE)
                                        <span class="label label-success">{{ $common->isActive($manager->is_active) }}</span>
                                    @else
                                        <span class="label label-default">{{ $common->isActive($manager->is_active) }}</span>
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $manager->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">更新时间</th>
                                <td>{{ $manager->updated_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">删除时间</th>
                                <td>{{ $manager->deleted_at }}</td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <a href="{{ url('mpmanager/manager/' . $manager->id . '/edit') }}" type="button"
                                   class="btn btn-primary btn-md">编辑</a>
                                <a href="{{ url()->previous() == url()->current() ? url('mpmanager/employee') : url()->previous() }}"
                                   type="button" role="button"
                                   class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->

@stop