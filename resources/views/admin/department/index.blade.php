@extends('admin.common.layout')
@section('title', '职位管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.department') !!}
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
                                <div class="pull-left cell-3">
                                    <select name="select-company" class="form-control select-company">
                                        <option value="0">选择公司</option>
                                        @foreach($companies as $company)
                                            @if(isset($params['company_id']) && $params['company_id'] == $company->id)
                                                <option value="{{$company->id}}"
                                                        selected>{{$company->display_name}}</option>
                                            @else
                                                <option value="{{$company->id}}">{{$company->display_name}}</option>
                                            @endif
                                        @endforeach
                                    </select>
                                </div><!--公司信息-->
                                <button class="btn btn-default operate-batch-delete" type="button"
                                        name="operate-batch-delete" data-url="company_department/batch"
                                        data-toggle="modal" data-target=".confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="company_department/create" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        data-url="company_department" title="重置刷新">
                                    <i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                            </div><!--显示-->
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
                                            <div class="th-inner" data-name="name">部门名称</div>
                                            <div class="fht-cell"></div>
                                        </th><!--name-->
                                        <!-- <th style="">
                                            <div class="th-inner" data-name="level">职位级别</div>
                                            <div class="fht-cell"></div>
                                        </th> --><!--level-->
                                        <th style="">
                                            <div class="th-inner" data-name="company">所属公司</div>
                                            <div class="fht-cell"></div>
                                        </th><!--company-->
                                        <th style="">
                                            <div class="th-inner" data-name="employee">交接人</div>
                                            <div class="fht-cell"></div>
                                        </th><!--is_only-->
                                        <th style="">
                                            <div class="th-inner" data-name="count">人数</div>
                                            <div class="fht-cell"></div>
                                        </th><!--is_only-->
                                        <th style="">
                                            <div class="th-inner">操作</div>
                                            <div class="fht-cell"></div>
                                        </th><!--operation-->
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($departments as $item)
                                        <tr>
                                            <td>
                                                <div class="ckbox ckbox-default">
                                                    <input type="checkbox" name="id" id="id-{{ $item->id }} "
                                                           value="{{ $item->id }}" class="selectall-item">
                                                    <label for="id-{{ $item->id }}"></label>
                                                </div>
                                            </td><!--checkbox-->
                                            <!--ID-->
                                            <td>{{ $item->name }}</td><!--职位名称-->
                                            <td>{!! ($item->company) ? '<a href="'.url('admin/company/'.$item->company->id).'">'.$item->company->display_name.'</a>' : '' !!}</td>
                                            <!--公司-->
                                            <td>{!! $item->owner ? '<a href="'.url('admin/company_employee/'.$item->owner->id).'">'.$item->owner->nickname.'</a>' : '' !!}</td>
                                            <!--职位级别-->
                                            <td>{{ count($item->employees) }}</td><!--职位名称-->
                                            <!--是否唯一-->
                                            <td>
                                                <a href="{{ url('admin/company_department/'.$item->id) }}"
                                                   class="btn btn-white btn-xs" title="详情"><i
                                                            class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                <a href="{{ url('admin/company_department/'. $item->id .'/edit') }}"
                                                   class="btn btn-primary btn-xs" title="编辑"><i
                                                            class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                <a class="btn btn-danger btn-xs operate-delete"
                                                   data-toggle="modal" data-target=".confirmModal"
                                                   data-url="company_department/{{ $item->id }}"
                                                   data-info="{{ $item->name }} 部门" title="删除">
                                                    <i class="glyphicon glyphicon-trash"></i>删除
                                                </a>
                                            </td><!--操作-->
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div><!--表单内容-->
                            <div class="fixed-table-pagination">
                                <div class="pull-right pagination">
                                    {!! $departments->appends($params)->render() !!}
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




