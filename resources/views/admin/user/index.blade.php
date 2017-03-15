@extends('admin.common.layout')
@section('title', '用户管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.user') !!}
@stop
@section('content')
    @parent
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    用户管理
                </div>
                <div class="panel-body">
                    <div class="bootstrap-table">
                        {{--表单功能栏--}}
                        <div class="fixed-table-toolbar">
                            {{--添加/删除--}}
                            <div class="columns btn-group pull-left">
                                <button class="btn btn-default operate-delete" type="button" name="operate-delete"
                                        title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                                <button class="btn btn-default operate-add-batch" type="button" name="operate-add-batch"
                                        title="批量添加">
                                    <i class="glyphicon glyphicon-plus-sign"></i>
                                </button>
                                <button class="btn btn-default operate-add-file" type="button" name="operate-add-file"
                                        title="导入文件">
                                    <i class="glyphicon glyphicon-file"></i>
                                </button>
                            </div>
                            {{--显示--}}
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default" type="button" name="refresh" title="Refresh"><i
                                            class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                                <button class="btn btn-default" type="button" name="toggle" title="Toggle"><i
                                            class="glyphicon glyphicon glyphicon-list-alt icon-list-alt"></i></button>
                                <div class="keep-open btn-group" title="Columns">
                                    <button type="button" class="btn btn-default dropdown-toggle"
                                            data-toggle="dropdown"><i class="glyphicon glyphicon-th icon-th"></i> <span
                                                class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><label><input type="checkbox" data-field="id" value="1" checked="checked">
                                                Item ID</label></li>
                                        <li><label><input type="checkbox" data-field="name" value="2" checked="checked">
                                                Item Name</label></li>
                                        <li><label><input type="checkbox" data-field="price" value="3"
                                                          checked="checked"> Item Price</label></li>
                                    </ul>
                                </div>
                            </div>
                            {{--查找--}}
                            <div class="pull-right input-group col-sm-6">
                                <div class="input-group-btn btn-group keep-open">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">昵称 <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">昵称</a></li>
                                        <li><a href="#">账号</a></li>
                                        <li><a href="#">邮箱</a></li>
                                        <li><a href="#">手机</a></li>
                                        <li><a href="#">角色</a></li>
                                        <li><a href="#">权限</a></li>
                                    </ul>
                                </div><!-- /btn-group -->
                                <input class="form-control search" type="text" placeholder="Search">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" title="查找"><i
                                                class="glyphicon glyphicon-search"></i></button>
                                </span>
                            </div>
                        </div>
                        {{--表单容器--}}
                        <div class="fixed-table-container">
                            {{--？--}}
                            <div class="fixed-table-header">
                                <table></table>
                            </div>
                            {{--表单内容--}}
                            <div class="fixed-table-body">
                                <div class="fixed-table-loading" style="top: 37px; display: none;">Loading, please
                                    wait…
                                </div>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th class="bs-checkbox " style="width: 36px; ">
                                            <div class="th-inner "><input name="btSelectAll" type="checkbox"></div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner sortable">账号</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner sortable">昵称
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span>
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner sortable">邮箱</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner sortable">手机</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        {{--<th style="">--}}
                                        {{--<div class="th-inner sortable">所属角色</div>--}}
                                        {{--<div class="fht-cell"></div>--}}
                                        {{--</th>--}}
                                        {{--<th style="">--}}
                                        {{--<div class="th-inner sortable">特殊权限</div>--}}
                                        {{--<div class="fht-cell"></div>--}}
                                        {{--</th>--}}
                                        <th style="">
                                            <div class="th-inner sortable">操作</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($users as $user)
                                        <tr>
                                            <td>
                                                <div class="ckbox ckbox-default">
                                                    <input type="checkbox" name="id" id="id-{{ $user->id }}"
                                                           value="{{ $user->id }}" class="selectall-item">
                                                    <label for="id-{{ $user->id }}"></label>
                                                </div>
                                            </td>
                                            <td>{{ $user->name }}</td>
                                            <td>{{ $user->nickname }}</td>
                                            <td>{{ $user->email }}</td>
                                            <td>{{ $user->mobile }}</td>
                                            {{--<td>{{ $user->getRole($user->id) }}</td>--}}
                                            {{--<td>{{ $user->getPermission($user->id) }}</td>--}}
                                            <td>
                                                <span><a href="{{ url('admin/manager/detail', ['id' => $user->id]) }}">详情</a></span>
                                                -
                                                <span><a href="{{ url('admin/manager/update', ['id' => $user->id]) }}">编辑</a></span>
                                                -
                                                <span><a href="{{ url('admin/manager/update', ['id' => $user->id]) }}">分配角色</a></span>
                                                -
                                                <span><a href="{{ url('admin/manager/update', ['id' => $user->id]) }}">分配权限</a></span>
                                                -
                                                <span><a href="{{ url('admin/manager/delete', ['id' => $user->id]) }}"
                                                         onclick="if (confirm('确认删除？') == false) return false;">删除</a></span>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            {{--页码--}}
                            <div class="fixed-table-pagination">
                                {{--每页几条--}}
                                <div class="pull-left pagination-detail">
                                    <span class="pagination-info">每页显示
                                        <span class="page-list">
                                            <span class="btn-group dropup">
                                                <button type="button"
                                                        class="btn btn-default dropdown-toggle"
                                                        data-toggle="dropdown">
                                                    <span class="page-size">10</span> <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li class="active"><a href="javascript:void(0);">10</a></li>
                                                    <li><a href="javascript:void(0);">25</a></li>
                                                    <li><a href="javascript:void(0);">50</a></li>
                                                    <li><a href="javascript:void(0);">100</a></li>
                                                </ul>
                                            </span>
                                        </span> 条
                                    </span>
                                </div>
                                {{--跳转页码--}}
                                <div class="pull-right pagination">
                                    {!! $users->render() !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
@stop
@section('javascript')
    <script>
        $(function () {
            $(".operate-add").click(function () {
                location.href = "{{ url('admin/user/create') }}";
            });
        });
    </script>
@stop




