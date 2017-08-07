@extends('admin.common.layout')
@section('title', '员工管理')
@section('breadcrumb')
    {{--{!! Breadcrumbs::render('mpmanager.department') !!}--}}
@stop
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    部门管理
                </div>
                <div class="panel-body">
                    <div class="bootstrap-table">
                        {{--表单功能栏--}}
                        <div class="fixed-table-toolbar">
                            <div class="columns btn-group pull-left">
                                <button class="btn btn-default operate-batch-delete" type="button"
                                        name="operate-batch-delete" data-url="employee/batch"
                                        data-toggle="modal" data-target=".confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="{{ url()->current().'/create' }}" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                                {{--<button class="btn btn-default operate-add-batch" type="button" name="operate-add-batch"--}}
                                {{--title="批量添加">--}}
                                {{--<i class="glyphicon glyphicon-plus-sign"></i>--}}
                                {{--</button>--}}
                                {{--<button class="btn btn-default operate-import" type="button" name="operate-add-file"--}}
                                {{--title="导入文件">--}}
                                {{--<i class="glyphicon glyphicon-file"></i>--}}
                                {{--</button>--}}
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        data-url="employee" title="重置刷新">
                                    <i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                            </div><!--显示-->
                            {{--<form name="form_search" action="{{ url('/admin/employee') }}" method="get">--}}
                            {{--<div class="input-group pull-right col-md-6">--}}
                            {{--{{ csrf_field() }}--}}
                            {{--<div class="input-group-btn btn-group keep-open">--}}
                            {{--<button name="search_column" type="button"--}}
                            {{--class="btn btn-default dropdown-toggle"--}}
                            {{--data-toggle="dropdown"--}}
                            {{--aria-haspopup="true" aria-expanded="false">用户名--}}
                            {{--<span class="caret"></span>--}}
                            {{--</button>--}}
                            {{--<ul class="dropdown-menu" id="columnDropdown">--}}
                            {{--<li><a class="dropdown-item" data-column="name" name="column_name"--}}
                            {{--style="cursor: pointer;">用户名</a></li>--}}
                            {{--<li><a class="dropdown-item" data-column="nickname" name="column_nickname"--}}
                            {{--style="cursor: pointer;">昵称</a></li>--}}
                            {{--<li><a class="dropdown-item" data-column="mobile" name="column_mobile"--}}
                            {{--style="cursor: pointer;">手机</a></li>--}}
                            {{--<li><a class="dropdown-item" data-column="email" name="column_email"--}}
                            {{--style="cursor: pointer;">邮箱</a></li>--}}
                            {{--</ul>--}}
                            {{--</div><!-- /btn-group -->--}}
                            {{--<input type="hidden" name="column" value="name"/>--}}
                            {{--<input class="form-control search" type="text" name="keyword"--}}
                            {{--placeholder="Search"/>--}}
                            {{--<span class="input-group-btn">--}}
                            {{--<button class="btn btn-default operate-search" type="submit" title="查找">--}}
                            {{--<i class="glyphicon glyphicon-search"></i>--}}
                            {{--</button>--}}
                            {{--</span>--}}
                            {{--</div>--}}
                            {{--</form><!--查找-->--}}
                        </div>
                        {{--表单容器--}}
                        <div class="fixed-table-container">
                            <div class="fixed-table-body">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th class="bs-checkbox " style="width: 36px; ">
                                            <div class="th-inner ">
                                                <input id="btSelectAll" name="btSelectAll" type="checkbox">
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--checkbox-->
                                        <th style="">
                                            <div class="th-inner" data-name="id">#</div>
                                            <div class="fht-cell"></div>
                                        </th><!--ID-->
                                        <th style="">
                                            <div class="th-inner" data-name="number">工号</div>
                                            <div class="fht-cell"></div>
                                        </th><!--number-->
                                        <th style="">
                                            <div class="th-inner" data-name="company">公司</div>
                                            <div class="fht-cell"></div>
                                        </th><!--company-->
                                        <th style="">
                                            <div class="th-inner" data-name="department">部门</div>
                                            <div class="fht-cell"></div>
                                        </th><!--department-->
                                        <th style="">
                                            <div class="th-inner" data-name="name">姓名</div>
                                            <div class="fht-cell"></div>
                                        </th><!--name-->
                                        <th style="">
                                            <div class="th-inner" data-name="title">头衔</div>
                                            <div class="fht-cell"></div>
                                        </th><!--title-->
                                        <th style="">
                                            <div class="th-inner sortable" data-name="created_at">创建时间
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span><!--dropup-->
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--created_at-->
                                        <th style="">
                                            <div class="th-inner">操作</div>
                                            <div class="fht-cell"></div>
                                        </th><!--operation-->
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div><!--表单内容-->
                            <div class="fixed-table-pagination">
                                <div class="pull-right pagination">
                                    {{--{!! $departments->appends($params)->render() !!}--}}
                                </div><!--跳转页码-->
                            </div><!--页码-->
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

        });
    </script>
@stop




