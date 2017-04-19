@extends('admin.common.layout')
@section('title', '公司管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.company') !!}
@stop
@section('content')
    @parent
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    公司管理
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
                                        data-url="company/create" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        data-url="company" title="重置刷新">
                                    <i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                                <button class="btn btn-default operate-retweet" type="button" name="retweet"
                                        data-url="company" title="垃圾箱">
                                    <i class="glyphicon glyphicon-retweet icon-retweet"></i></button>
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
                                        </ul>
                                    </div><!-- /btn-group -->
                                    {{--<input type="hidden" name="column" value="name"/>--}}
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
                                            <div class="th-inner" data-name="display_name">显示名称</div>
                                            <div class="fht-cell"></div>
                                        </th><!--display_name-->
                                        <th style="">
                                            <div class="th-inner" data-name="user_name">创始人</div>
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
                                    @if($companies)
                                        @foreach($companies as $item)
                                            <tr>
                                                <td>
                                                    <div class="ckbox ckbox-default">
                                                        <input type="checkbox" name="id" id="id-{{ $item->id }} "
                                                               value="{{ $item->id }}" class="selectall-item">
                                                        <label for="id-{{ $item->id }}"></label>
                                                    </div>
                                                </td><!--checkbox-->
                                                <td>{{ $item->id }}</td>
                                                <td>{{ $item->name }}</td>
                                                <td>{{ $item->display_name }}</td>
                                                <td>{!! isset($item->user) ? '<a href="'.url('admin/user/'.$item->user->id).'">'.$item->user->name.'</a>' : '' !!}</td>
                                                <td>
                                                    @if($item->deleted_at != null)
                                                        <span class="label label-danger">{{ $common->isDelete($item->deleted_at) }}</span>
                                                    @else
                                                        @if($item->status == $item::VERIFIED_ING)
                                                            <span class="label label-primary">{{ $item->getStatus($item->status) }}</span>
                                                        @elseif($item->status == $item::VERIFIED_SUCCEED)
                                                            <span class="label label-success">{{ $item->getStatus($item->status) }}</span>
                                                        @elseif($item->status == $item::VERIFIED_FAILED)
                                                            <span class="label label-default">{{ $item->getStatus($item->status) }}</span>
                                                        @endif
                                                    @endif
                                                </td>
                                                <td>{{ $item->created_at }}</td>
                                                <td>
                                                    <a href="{{ url('admin/company/'.$item->id) }}"
                                                       class="btn btn-white btn-xs" title="详情"><i
                                                                class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                    <a href="{{ url('admin/employee?company_id='.$item->id) }}"
                                                       class="btn btn-white btn-xs" title="查看员工"><i
                                                                class="glyphicon glyphicon-list-alt"></i>员工</a>
                                                    @if($item->deleted_at == null)
                                                        @if($item->status == $item::VERIFIED_ING)
                                                            <a href="{{ url('admin/company/'.$item->id . '/verified') }}"
                                                               class="btn btn-success btn-xs" title="审核"><i
                                                                        class="glyphicon glyphicon-bookmark"></i>审核</a>
                                                        @endif
                                                        @if(!isset($item->user))
                                                            <a href="" class="btn btn-success btn-xs operate-binding"
                                                               data-toggle="modal" data-target="#bindingModal"
                                                               data-url="company/{{ $item->id }}/binding" title="绑定用户">
                                                                <i class="glyphicon glyphicon-link"></i>绑定</a>
                                                        @endif
                                                        <a href="{{ url('admin/company/'. $item->id .'/edit') }}"
                                                           class="btn btn-primary btn-xs" title="编辑"><i
                                                                    class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                        <a href="#confirmModel"
                                                           class="btn btn-danger btn-xs operate-delete"
                                                           data-toggle="modal" data-target=".confirmModal"
                                                           data-url="company/{{ $item->id }}"
                                                           data-info="{{ $item->name }} 公司" title="删除">
                                                            <i class="glyphicon glyphicon-trash"></i>删除
                                                        </a>
                                                    @else
                                                        <a href="#confirmModel"
                                                           class="btn btn-warning btn-xs operate-recover"
                                                           {{--data-toggle="modal" data-target=".confirmModal"--}}
                                                           {{--data-id="{{ $item->id }}"--}}
                                                           {{--data-url="company/{{ $item->id }}"--}}
                                                           title="恢复">
                                                            <i class="glyphicon glyphicon-repeat"></i>恢复
                                                        </a>
                                                        <a href="#confirmModel"
                                                           class="btn btn-danger btn-xs operate-destroy"
                                                           {{--data-toggle="modal" data-target=".confirmModal"--}}
                                                           {{--data-id="{{ $item->id }}"--}}
                                                           {{--data-url="company/{{ $item->id }}"--}}
                                                           title="彻底删除">
                                                            <i class="glyphicon glyphicon-trash"></i>销毁
                                                        </a>
                                                    @endif

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




