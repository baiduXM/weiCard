@extends('admin.common.layout')
@section('title', '用户管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.company') !!}
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
                                        name="operate-batch-delete" data-url="company/batch"
                                        data-toggle="modal" data-target="#confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="company/create" title="添加">
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
                                        data-url="company"
                                        title="重置刷新"><i
                                            class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                                {{--
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
                                --}}
                            </div><!--显示-->
                            <form name="form_search" action="{{ url('/admin/company') }}" method="get">
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
                                        <th style="">
                                            <div class="th-inner" data-name="id">#</div>
                                            <div class="fht-cell"></div>
                                        </th><!--id-->
                                        <th style="">
                                            <div class="th-inner" data-name="name">公司名称</div>
                                            <div class="fht-cell"></div>
                                        </th><!--name-->
                                        <th style="">
                                            <div class="th-inner" data-name="code">公司代码</div>
                                            <div class="fht-cell"></div>
                                        </th><!--code-->
                                        <th style="">
                                            <div class="th-inner" data-name="user_name">注册人</div>
                                            <div class="fht-cell"></div>
                                        </th><!--user_name-->
                                        <th style="">
                                            <div class="th-inner sortable" data-name="status">状态
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span>
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--status-->
                                        <th style="">
                                            <div class="th-inner" data-name="manager_name">审核人</div>
                                            <div class="fht-cell"></div>
                                        </th><!--manager_name-->
                                        <th style="">
                                            <div class="th-inner sortable" data-name="created_at">创建时间
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span><!--dropup-->
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--created_at-->
                                        <th style="">
                                            <div class="th-inner sortable" data-name="verified_at">审核时间
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span><!--dropup-->
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--verified_at-->
                                        <th style="">
                                            <div class="th-inner">操作</div>
                                            <div class="fht-cell"></div>
                                        </th><!--operation-->
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @if($companies)
                                        @foreach($companies as $company)
                                            <tr>
                                                <td>
                                                    <div class="ckbox ckbox-default">
                                                        <input type="checkbox" name="id" id="id-{{ $company->id }} "
                                                               value="{{ $company->id }}" class="selectall-item">
                                                        <label for="id-{{ $company->id }}"></label>
                                                    </div>
                                                </td><!--checkbox-->
                                                <td>{{ $company->id }}</td>
                                                <td>{{ $company->name }}</td>
                                                <td>{{ $company->code }}</td>
                                                <td>{{ $user->getName($company->user_id) }}</td>
                                                <td>
                                                    @if($company->status == 0)
                                                        <span class="label label-primary">{{ $company->getStatus($company->status) }}</span>
                                                    @elseif($company->status == 1)
                                                        <span class="label label-success">{{ $company->getStatus($company->status) }}</span>
                                                    @elseif($company->status == 2)
                                                        <span class="label label-warning">{{ $company->getStatus($company->status) }}</span>
                                                    @elseif($company->status == 3)
                                                        <span class="label label-default">{{ $company->getStatus($company->status) }}</span>
                                                    @endif
                                                </td>
                                                <td>{{ $manager->getName($company->manager_id) }}</td>
                                                <td>{{ $company->created_at }}</td>
                                                <td>{{ $company->verified_at }}</td>
                                                <td>
                                                    <a href="{{ url('admin/company/'.$company->id) }}"
                                                       class="btn btn-white btn-xs" title="详情"><i
                                                                class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                    <a href="{{ url('admin/company/'. $company->id .'/edit') }}"
                                                       class="btn btn-white btn-xs" title="编辑"><i
                                                                class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                    <a href="#confirmModel" class="btn btn-danger btn-xs operate-delete"
                                                       data-toggle="modal" data-target="#confirmModal"
                                                       data-name="{{ $company->name }}"
                                                       data-url="company/{{ $company->id }}"
                                                       title="删除">
                                                        <i class="glyphicon glyphicon-trash"></i>删除
                                                    </a>
                                                </td><!--操作-->
                                            </tr>
                                        @endforeach
                                    @else
                                        <tr>
                                            <td colspan="10">无数据</td>
                                        </tr>
                                    @endif
                                    </tbody>
                                </table>
                            </div><!--表单内容-->
                            <div class="fixed-table-pagination">
                                {{--
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
                                    </div><!--每页几条-->
                                    --}}
                                <div class="pull-right pagination">
                                    {!! $companies->render() !!}
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




