@extends('admin.common.layout')
@section('title', '名片夹管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.cardcase') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    名片夹管理
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
                                        data-url="user_cardcase" title="重置刷新">
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
                                        <!-- <th style="">
                                            <div class="th-inner" data-name="id">#</div>
                                            <div class="fht-cell"></div>
                                        </th> --><!--ID-->
                                        <th style="">
                                            <div class="th-inner" data-name="user">所属用户</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner" data-name="follower">名片</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner" data-name="follower_type">类型</div>
                                            <div class="fht-cell"></div>
                                        </th>
                                        <th style="">
                                            <div class="th-inner">操作</div>
                                            <div class="fht-cell"></div>
                                        </th><!--operation-->
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @if(!count($cardcases))
                                        <tr class="no-records-found">
                                            <td colspan="10">未找到记录</td>
                                        </tr>
                                    @else
                                        @foreach($cardcases as $item)
                                            <tr>
                                                <td>
                                                    <div class="ckbox ckbox-default">
                                                        <input type="checkbox" name="id" id="id-{{ $item->id }} "
                                                               value="{{ $item->id }}" class="selectall-item">
                                                        <label for="id-{{ $item->id }}"></label>
                                                    </div>
                                                </td><!--checkbox-->
                                                <td>{!! ($item->user) ? '<a href="'.url('mpmanager/user/'.$item->user->id).'">'.$item->user->nickname.'</a>' : '' !!}</td>
                                                <td>
                                                    @if($item->getFollowerType($item->follower_type) == 'u')
                                                        {!! ($item->follower) ? '<a href="'.url('mpmanager/user/'.$item->follower_id).'">'.$item->follower->nickname.'</a>' : '用户不存在' !!}
                                                    @else
                                                        {!! ($item->follower) ? '<a href="'.url('mpmanager/company_employee/'.$item->follower_id).'">'.$item->follower->nickname.'</a>' : '员工不存在' !!}
                                                    @endif
                                                </td>
                                                <td>{{ $item->getFollowerType($item->follower_type) == 'u' ? '个人' : '企业' }}</td>
                                                <td>
                                                    <a href="{{ url('mpmanager/employee/'.$item->id) }}"
                                                       class="btn btn-white btn-xs" title="详情"><i
                                                                class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                    <a href="{{ url('mpmanager/employee/'. $item->id .'/edit') }}"
                                                       class="btn btn-primary btn-xs" title="编辑"><i
                                                                class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                    @if(!isset($item->user))
                                                        <a class="btn btn-primary btn-xs operate-code"
                                                           data-toggle="modal" data-target="#shareModal"
                                                           data-code="{{ $item->company->name . '/' . $item->number }}"
                                                           data-url-code="{{ url('/user/binding?code=' . $item->company->name . '/' . $item->number) }}"
                                                           title="代码">
                                                            <i class="glyphicon glyphicon-copy"></i>代码
                                                        </a>
                                                    @endif
                                                    <a class="btn btn-danger btn-xs operate-delete"
                                                       data-toggle="modal" data-target=".confirmModal"
                                                       data-url="employee/{{ $item->id }}"
                                                       data-info="{{ $item->number }} 员工" title="删除">
                                                        <i class="glyphicon glyphicon-trash"></i>删除
                                                    </a>
                                                </td><!--操作-->
                                            </tr>
                                        @endforeach
                                    @endif
                                    </tbody>
                                </table>
                            </div><!--表单内容-->
                            <div class="fixed-table-pagination">
                                <div class="pull-right pagination">
                                    {!! $cardcases->appends($params)->render() !!}
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




