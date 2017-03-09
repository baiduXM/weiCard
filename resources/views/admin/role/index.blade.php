@extends('admin.common.layout')
@section('title', '角色管理')
@section('css')
    <style type="text/css">
        /*.a {*/
            /*cursor: pointer;*/
        /*}*/
    </style>
@stop
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
                                    <span><a href="{{ url('admin/role/'. $role->id .'/edit') }}">修改</a></span> -
                                    <span>
                                        {{--<a tabindex="0" class="delete" role="button" data-id="{{ $role->id }}"--}}
                                        {{--data-toggle="popover" data-trigger="focus" title="Dismissible popover"--}}
                                        {{--data-content="确认是否删除?">删除</a>--}}
                                        <a href="#confirmModel" data-toggle="modal" data-target="#confirmModal"
                                           data-id="{{ $role->id }}"
                                           data-name="{{ $role->name }}">删除</a>
                                    </span>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div class="pull-right">
                        {!! $roles->render() !!}
                    </div>

                </div>
            </div>
        </div>
    </div><!--/.row-->
@stop

@include('admin.common.modal')

@section('javascript')

    <script>
        $(function () {
            $('#confirmModal').on('show.bs.modal', function (event) {
                var relatedTarget = $(event.relatedTarget);
                var _name = relatedTarget.data('name');
                var _id = relatedTarget.data('id');
                var modal = $(this);
                modal.find('.modal-title').text('删除确认');
                modal.find('.modal-body').text('是否删除' + _name + '角色？');
                modal.find('form').attr('action', '/admin/role/' + _id);

            });
        });
    </script>
@stop

