@extends('admin.common.layout')
@section('title', '角色管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.role') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    角色列表
                    <a href="{{ url('admin/role/create') }}" type="button" class="btn btn-primary pull-right">添加角色</a>
                </div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>角色名</th>
                            <th>可读的角色名</th>
                            <th>角色描述</th>
                            <th>角色类型</th>
                            <th>创建时间</th>
                            <th>最后登录时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        @foreach($roles as $role)
                            <tr>
                                <td>{{ $role->name }}</td>
                                <td>{{ $role->display_name }}</td>
                                <td>{{ $role->description }}</td>
                                <td>{{ $role->setType($role->type) }}</td>
                                <td>{{ $role->created_at }}</td>
                                <td>{{ $role->updated_at }}</td>
                                <td>
                                    <span><a href="{{ url('admin/role/'. $role->id) }}">详情</a></span> -
                                    <span><a href="{{ url('admin/role/'. $role->id .'/edit') }}">修改</a></span>
                                    - <span><a href="{{ url('admin/role', ['id' => $role->id]) }}"
                                               onclick="if (confirm('确认删除？') == false) return false;">删除</a></span>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div class="pull-right">
                        {!! $roles->links() !!}
                    </div>

                </div>
            </div>
        </div>
    </div><!--/.row-->
@stop

@section('javascript')
    <script>
        $(function () {
            //TODO：ajax删除 delete方法提交
        });

    </script>

@stop

