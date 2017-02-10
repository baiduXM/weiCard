@extends('layouts.admin')
@section('title', '用户详情')

@section('content')

    @parent
    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">账户信息</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th class="text-right">#编号</th>
                                <td>{{ $user->id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">用户名</th>
                                <td>{{ $user->name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">邮箱</th>
                                <td>{{ $user->email }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">权限</th>
                                <td>{{ $user->privilege($user->privilege) }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $user->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">最后登录时间</th>
                                <td>{{ $user->updated_at }}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->

@stop