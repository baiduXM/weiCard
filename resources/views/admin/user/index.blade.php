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
                            <div class="columns btn-group pull-left">
                                <button class="btn btn-default operate-batch-delete" type="button"
                                        name="operate-batch-delete"
                                        data-toggle="modal" data-target="#confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                                <!--
                                <button class="btn btn-default operate-add-batch" type="button" name="operate-add-batch"
                                        title="批量添加">
                                    <i class="glyphicon glyphicon-plus-sign"></i>
                                </button>
                                <button class="btn btn-default operate-add-file" type="button" name="operate-add-file"
                                        title="导入文件">
                                    <i class="glyphicon glyphicon-file"></i>
                                </button>
                                -->
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        title="刷新"><i
                                            class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                                {{--<button class="btn btn-default" type="button" name="toggle" title="Toggle"><i--}}
                                            {{--class="glyphicon glyphicon glyphicon-list-alt icon-list-alt"></i></button>--}}
                                {{--<div class="keep-open btn-group" title="Columns">--}}
                                    {{--<button type="button" class="btn btn-default dropdown-toggle"--}}
                                            {{--data-toggle="dropdown"><i class="glyphicon glyphicon-th icon-th"></i> <span--}}
                                                {{--class="caret"></span></button>--}}
                                    {{--<ul class="dropdown-menu" role="menu">--}}
                                        {{--<li><label><input type="checkbox" data-field="id" value="1" checked="checked">--}}
                                                {{--Item ID</label></li>--}}
                                        {{--<li><label><input type="checkbox" data-field="name" value="2" checked="checked">--}}
                                                {{--Item Name</label></li>--}}
                                        {{--<li><label><input type="checkbox" data-field="price" value="3"--}}
                                                          {{--checked="checked"> Item Price</label></li>--}}
                                    {{--</ul>--}}
                                {{--</div>--}}
                            </div><!--显示-->
                            <form name="form_search" action="{{ url('/admin/user') }}" method="get">
                                <div class="input-group pull-right col-md-6">
                                    {{--{{ csrf_field() }}--}}
                                    <div class="input-group-btn btn-group keep-open">
                                        <button name="search_column" type="button"
                                                class="btn btn-default dropdown-toggle"
                                                data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false">用户名
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" id="columnDropdown">
                                            <li><a class="dropdown-item" data-column="name" name="column_name"
                                                   style="cursor: pointer;">用户名</a></li>
                                            <li><a class="dropdown-item" data-column="nickname" name="column_nickname"
                                                   style="cursor: pointer;">昵称</a></li>
                                            <li><a class="dropdown-item" data-column="mobile" name="column_mobile"
                                                   style="cursor: pointer;">手机</a></li>
                                            <li><a class="dropdown-item" data-column="email" name="column_email"
                                                   style="cursor: pointer;">邮箱</a></li>
                                            {{--<li><a href="#">角色</a></li>--}}
                                            {{--<li><a href="#">权限</a></li>--}}
                                        </ul>
                                    </div><!-- /btn-group -->
                                    <input type="hidden" name="column" value="name"/>
                                    <input class="form-control search" type="text" name="keyword"
                                           placeholder="Search"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default operate-search" type="submit" title="查找">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </form><!--查找-->
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
                                            <div class="th-inner ">
                                                <input id="btSelectAll" name="btSelectAll" type="checkbox">
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner">用户名</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner">昵称</div>
                                            <div class="fht-cell"></div>
                                        </th>

                                        {{--<th style="">--}}
                                        {{--<div class="th-inner">邮箱</div>--}}
                                        {{--<div class="fht-cell"></div>--}}
                                        {{--</th>--}}
                                        {{--<th style="">--}}
                                        {{--<div class="th-inner">手机</div>--}}
                                        {{--<div class="fht-cell"></div>--}}
                                        {{--</th>--}}
                                        {{--<th style="">--}}
                                        {{--<div class="th-inner sortable">所属角色</div>--}}
                                        {{--<div class="fht-cell"></div>--}}
                                        {{--</th>--}}
                                        {{--<th style="">--}}
                                        {{--<div class="th-inner sortable">特殊权限</div>--}}
                                        {{--<div class="fht-cell"></div>--}}
                                        {{--</th>--}}
                                        <th style="">
                                            <div class="th-inner">状态</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner sortable">创建时间
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span>
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner">操作</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($users as $user)
                                        <tr>
                                            <td>
                                                <div class="ckbox ckbox-default">
                                                    <input type="checkbox" name="id" id="id-{{ $user->id }} "
                                                           value="{{ $user->id }}" class="selectall-item">
                                                    <label for="id-{{ $user->id }}"></label>
                                                </div>
                                            </td><!--checkbox-->
                                            <td>{{ $user->name }}</td><!--用户名-->
                                            <td>{{ $user->nickname }}</td><!--昵称-->
                                            <td>
                                                @if($user->is_admin == 1)
                                                    <span class="label label-primary">管理员</span>
                                                @endif
                                                @if($user->is_active ==1)
                                                    <span class="label label-success">{{ $user->isActive($user->is_active) }}</span>
                                                @else
                                                    <span class="label label-default">{{ $user->isActive($user->is_active) }}</span>
                                                @endif
                                            </td><!--状态-->
                                            <td>{{ $user->created_at }}</td><!--创建时间-->
                                            {{--<td>{{ $user->getRole($user->id) }}</td>--}}
                                            {{--<td>{{ $user->getPermission($user->id) }}</td>--}}
                                            <td>
                                                <a href="{{ url('admin/user/'.$user->id) }}"
                                                   class="btn btn-white btn-xs" title="详情"><i
                                                            class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                <a href="{{ url('admin/user/'. $user->id .'/edit') }}"
                                                   class="btn btn-white btn-xs" title="编辑"><i
                                                            class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                {{--<a href="{{ url('admin/user/'. $user->id .'/role') }}"--}}
                                                {{--class="btn btn-white btn-xs" title="分配角色"><i--}}
                                                {{--class="glyphicon glyphicon-user"></i>分配角色</a>--}}
                                                {{--<a href="{{ url('admin/user/'. $user->id .'/permission') }}"--}}
                                                {{--class="btn btn-white btn-xs" title="分配权限"><i--}}
                                                {{--class="glyphicon glyphicon-sunglasses"></i>分配权限</a>--}}
                                                <a href="#confirmModel" class="btn btn-danger btn-xs operate-delete"
                                                   data-toggle="modal" data-target="#confirmModal"
                                                   data-id="{{ $user->id }}" data-name="{{ $user->name }}" title="删除">
                                                    <i class="glyphicon glyphicon-trash"></i>删除
                                                </a>
                                            </td><!--操作-->
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

{{--@include('admin.common.modal')--}}

@section('javascript')
    <script>
        $(function () {
            /* 添加 */
            $('.operate-add').click(function () {
                location.href = '{{ url('admin/user/create') }}';
            });

            /* 弹窗 */
            $('.operate-delete').click(function () {
                $('#confirmModal').on('show.bs.modal', function (event) {
                    var relatedTarget = $(event.relatedTarget);
                    var _name = relatedTarget.data('name');
                    var _id = relatedTarget.data('id');
                    var modal = $(this);
                    modal.find('.modal-title').text('删除确认');
                    modal.find('.modal-body').text('是否删除' + _name + '用户？');
                    modal.find('form').attr('action', '/admin/user/' + _id);
                    modal.find('[name="_method"]').val('DELETE');
                });
            })

            /* 全选checkbox */
            $('#btSelectAll').click(function () {
                if (this.checked) {
                    $(".selectall-item").prop("checked", true);
                } else {
                    $(".selectall-item").prop("checked", false);
                }
            });

            /* 单选 */
            $('.selectall-item').click(function () {
                var length = $('.selectall-item').length;
                var select_length = $('.selectall-item:checked').length;
                if (length == select_length) {
                    $('#btSelectAll').prop('checked', true);
                } else {
                    $('#btSelectAll').prop('checked', false);
                }
            });

            /* 批量删除 */
            $(".operate-batch-delete").click(function () {
                var length = $('.selectall-item:checked').length;
                if (length == 0) {
                    alert('未选择');
                    return false;
                } else {
                    var ids_arr = new Array;
                    $('.selectall-item:checked').each(function () {
                        ids_arr.push($(this).val());
                    });
                    var ids_str = ids_arr.join(',');
                    $('#confirmModal').on('show.bs.modal', function (event) {
                        var modal = $(this);
                        modal.find('.modal-title').text('删除确认');
                        modal.find('.modal-body').text('是否删除' + ids_str + '用户？');
                        modal.find('form').attr('action', '/admin/user/batch');
                        modal.find('[name="_method"]').val('DELETE');
                        modal.find('form').append('<input type="hidden" name="ids" value="' + ids_str + '"/>');
                    });
                }
            });

            /* 搜索 */
//            $('.operate-search').click(function () {
//                $('[name="form_search"]').submit();
//            });

            /* 搜索选择列名 */
            $('.dropdown-item').click(function () {
                console.log($(this).text());
                var column = $(this).data('column');
                var txt = $(this).text() + ' <span class="caret"></span>';
                $('[name="search_column"]').html(txt);
                $('[name="column"]').val(column);
            });

            /* 刷新 */
            $('.operate-refresh').click(function () {
                location.href = '{{ url('admin/user') }}';
            });

            /* 初始化 */
            function init() {
                var column = getQueryString('column');
                var keyword = getQueryString('keyword');
                column = (column != null) ? column : 'name';
                keyword = (keyword != null) ? keyword : '';
                var txt = $('[name="column_' + column + '"]').text() + ' <span class="caret"></span>';
                $('[name="search_column"]').html(txt);
                $('[name="keyword"]').val(keyword);
            }

            /* 获取url参数 */
            function getQueryString(name) {
                var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
                var r = window.location.search.substr(1).match(reg);
                if (r != null) {
                    return (r[2]);
                }
                return null;
            }

            /* 运行 */
            init();
        });
    </script>
@stop




