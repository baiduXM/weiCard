@extends('admin.common.layout')
@section('title', '客服管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.manager') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    客服列表
                </div>
                <div class="panel-body">
                    <div class="bootstrap-table">
                        {{--表单功能栏--}}
                        <div class="fixed-table-toolbar">
                            <div class="columns btn-group pull-left">
                                <button class="btn btn-default operate-batch-delete" type="button"
                                        name="operate-batch-delete" data-url="company/batch"
                                        data-toggle="modal" data-target=".confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="{{ url('admin/manager/create') }}" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        data-url="manager" title="重置刷新">
                                    <i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                                <button class="btn btn-default operate-dustbin" type="button" name="dustbin"
                                        data-url="manager" title="垃圾箱">
                                    <i class="glyphicon glyphicon-retweet"></i></button>
                            </div><!--显示-->
                            {{--<form name="form_search" action="{{ url('/admin/manager') }}" method="get">--}}
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
                                        <!-- <th style="">
                                            <div class="th-inner" data-name="id">#</div>
                                            <div class="fht-cell"></div>
                                        </th> --><!--ID-->
                                        <th style="">
                                            <div class="th-inner" data-name="name">用户名</div>
                                            <div class="fht-cell"></div>
                                        </th><!--name-->
                                        <th style="">
                                            <div class="th-inner" data-name="status">状态</div>
                                            <div class="fht-cell"></div>
                                        </th><!--status-->
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
                                    @foreach($managers as $item)
                                        <tr>
                                            <td>
                                                <div class="ckbox ckbox-default">
                                                    <input type="checkbox" name="id" id="id-{{ $item->id }}"
                                                           value="{{ $item->id }}" class="selectall-item">
                                                    <label for="id-{{ $item->id }}"></label>
                                                </div>
                                            </td><!--checkbox-->
                                            <!-- <td>{{ $item->id }}</td> -->
                                            <!--ID-->
                                            <td>{{ $item->name }}</td><!--name-->
                                            <td>
                                                @if($item->is_super == $item::IS_SUPER || $item->name == 'admin')
                                                    <span class="label label-primary">{{ $item->isSuper($item->is_super) }}</span>
                                                @endif
                                                @if($item->is_active == $common::IS_ACTIVE)
                                                    <span class="label label-success">{{ $common->isActive($item->is_active) }}</span>
                                                @else
                                                    <span class="label label-default">{{ $common->isActive($item->is_active) }}</span>
                                                @endif
                                            </td><!--操作-->
                                            <td>{{ $item->created_at->format('Y-m-d') }}</td><!--created_at-->
                                            <td>
                                                <a href="{{ url('admin/manager/'.$item->id) }}"
                                                   class="btn btn-white btn-xs" title="详情"><i
                                                            class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                <a href="{{ url('admin/manager/'. $item->id .'/edit') }}"
                                                   class="btn btn-primary btn-xs" title="编辑"><i
                                                            class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                @if(Auth::guard('admin')->user()->is_super == $item::IS_SUPER)
                                                    @if($item->name != 'admin')
                                                        <a href="" class="btn btn-danger btn-xs operate-delete"
                                                           data-toggle="modal" data-target=".confirmModal"
                                                           data-url="manager/{{ $item->id }}"
                                                           data-info="{{ $item->name }} 管理员" title="删除">
                                                            <i class="glyphicon glyphicon-trash"></i>删除
                                                        </a>
                                                    @endif
                                                @endif
                                            </td><!--操作-->
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div><!--表单内容-->
                            <div class="fixed-table-pagination">
                                <div class="pull-right pagination">
                                    {!! $managers->render() !!}
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
@stop




