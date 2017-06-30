@extends('admin.common.layout')
@section('title', '用户管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.user') !!}
@stop
@section('content')
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
                                        name="operate-batch-delete" data-url="user/batch"
                                        data-toggle="modal" data-target=".confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="user/create" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                                {{--
                                <button class="btn btn-default operate-add-batch" type="button" name="operate-add-batch"
                                        title="批量添加">
                                    <i class="glyphicon glyphicon-plus-sign"></i>
                                </button>
                                <button class="btn btn-default operate-add-file" type="button" name="operate-add-file"
                                        title="导入文件">
                                    <i class="glyphicon glyphicon-file"></i>
                                </button>
                                --}}
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        data-url="user" title="重置刷新">
                                    <i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
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
                            <div class="fixed-table-header">
                                <table></table>
                            </div><!--表单头部-->
                            <div class="fixed-table-body">
                                <div class="fixed-table-loading" style="top: 37px; display: none;">
                                    Loading, please wait…
                                </div><!--无内容显示-->
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
                                        </th><!--用户名-->
                                        <th style="">
                                            <div class="th-inner">公司</div>
                                            <div class="fht-cell"></div>
                                        </th><!--公司-->
                                        <th style="">
                                            <div class="th-inner">员工</div>
                                            <div class="fht-cell"></div>
                                        </th><!--员工-->
                                        <th style="">
                                            <div class="th-inner sortable" data-name="is_active">状态
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span>
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--状态-->
                                        <th style="">
                                            <div class="th-inner sortable" data-name="created_at">创建时间
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span><!--dropup-->
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--创建时间-->
                                        <th style="">
                                            <div class="th-inner">操作</div>
                                            <div class="fht-cell"></div>
                                        </th><!--操作-->
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($users as $item)
                                        <tr>
                                            <td>
                                                <div class="ckbox ckbox-default">
                                                    <input type="checkbox" name="id" id="id-{{ $item->id }} "
                                                           value="{{ $item->id }}" class="selectall-item">
                                                    <label for="id-{{ $item->id }}"></label>
                                                </div>
                                            </td><!--checkbox-->
                                            <!-- <td>{{ $item->id }}</td> -->
                                            <!--ID-->
                                            <td>{{ $item->nickname }}</td><!--用户名-->
                                            <td>{!! ($item->employee) ? '<a href="'.url('admin/company/'.$item->employee->company_id).'">'.$item->employee->company->name.'</a>' : '' !!}</td><!--公司-->
                                            <td>{!! ($item->employee) ? '<a href="'.url('admin/employee/'.$item->employee->id).'">'.$item->employee->number.'</a>' : '' !!}</td><!--员工-->
                                            <td>
                                                @if($item->is_active == $common::IS_ACTIVE)
                                                    <span class="label label-success">{{ $common->isActive($item->is_active) }}</span>
                                                @else
                                                    <span class="label label-default">{{ $common->isActive($item->is_active) }}</span>
                                                @endif
                                            </td><!--状态-->
                                            <td>{{ $item->created_at->format('Y-m-d') }}</td><!--创建时间-->
                                            <td>
                                                <a href="{{ url('admin/user/'.$item->id) }}"
                                                   class="btn btn-white btn-xs" title="详情"><i
                                                            class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                <a href="{{ url('admin/user_cardcase/?user_id='.$item->id) }}"
                                                   class="btn btn-white btn-xs" title="名片夹"><i
                                                            class="glyphicon glyphicon-list-alt"></i>名片夹</a>
                                                <a href="{{ url('admin/user/'. $item->id .'/edit') }}"
                                                   class="btn btn-primary btn-xs" title="编辑"><i
                                                            class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                @if(($item->employee))
                                                    <a href="" class="btn btn-warning btn-xs operate-unbinding"
                                                       data-toggle="modal" data-target=".confirmModal"
                                                       data-info="{{ $item->employee->company->name }}"
                                                       data-url="user/{{ $item->id }}/binding" title="解绑员工">
                                                        <i class="glyphicon glyphicon-link"></i>解绑</a>
                                                @else
                                                    <a href="" class="btn btn-success btn-xs operate-binding"
                                                       data-toggle="modal" data-target="#bindingModal"
                                                       data-url="user/{{ $item->id }}/binding" title="绑定员工">
                                                        <i class="glyphicon glyphicon-link"></i>绑定</a>
                                                @endif
                                                <a href="" class="btn btn-danger btn-xs operate-delete"
                                                   data-toggle="modal" data-target=".confirmModal"
                                                   data-url="user/{{ $item->id }}" data-info="{{ $item->name }} 用户"
                                                   title="删除">
                                                    <i class="glyphicon glyphicon-trash"></i>删除
                                                </a>
                                                <a href="{{ url('admin/user/'. $item->id .'/refresh') }}"
                                                   class="btn btn-success btn-xs" title="切换状态"><i
                                                            class="glyphicon glyphicon-repeat"></i>切换状态</a>
                                            </td><!--操作-->
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div><!--表单内容-->
                            <div class="fixed-table-pagination">
                                <div class="pull-right pagination">
                                    {!! $users->render() !!}
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




