@extends('admin.common.layout')
@section('title', '用户详情')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.user.show', $user->id) !!}
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
                                <th class="text-right col-md-3">用户名</th>
                                <td class="col-md-9">{{ $user->name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">邮箱</th>
                                <td>{{ $user->email }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">手机</th>
                                <td>{{ $user->mobile }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">昵称</th>
                                <td>{{ $user->nickname }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">头像</th>
                                <td>
                                    <img src="{{ $user->avatar ? asset($user->avatar) : ''}}" class="img-responsive" style="max-height: 200px;max-width: 200px;">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">个性签名</th>
                                <td>{{ $user->description }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">绑定公司</th>
                                <td>{{ $user->company_id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">绑定员工</th>
                                <td>{{ $user->employee_id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">管理员</th>
                                <td>{{ $user->is_admin == 1 ? '是' : '否' }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">状态</th>
                                <td>{{ $user->isActive($user->is_active) }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $user->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">更新时间</th>
                                <td>{{ $user->updated_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">删除时间</th>
                                <td>{{ $user->deleted_at }}</td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <a href="{{ url('admin/user/' . $user->id . '/edit') }}" type="button"
                                   class="btn btn-primary btn-md">编辑</a>
                                <a href="{{ url('admin/user') }}" type="button" role="button"
                                   class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->

@stop