@extends('admin.common.admin')
@section('title', '用户详情')
@section('breadcrumb')
    {!! Breadcrumbs::render('detail', $user->id) !!}
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
                                <th class="text-right">角色</th>
                                <td>{{ $user->role($user->role) }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $user->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">更新时间</th>
                                <td>{{ $user->updated_at }}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->

@stop