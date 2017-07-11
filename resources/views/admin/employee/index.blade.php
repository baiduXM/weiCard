@extends('admin.common.layout')
@section('title', '员工管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.employee') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    员工管理
                    <span class="text-danger">{{ request()->is('*/trash') ? '(垃圾箱)' : '' }}</span>
                </div>
                <div class="panel-body">
                    <div class="bootstrap-table">
                        {{--表单功能栏--}}
                        <div class=" fixed-table-toolbar">
                            <div class="columns btn-group pull-left">
                                <div class="pull-left cell-3">
                                    <select name="select-company" class="form-control select-company">
                                        <option value="0">选择公司</option>
                                        @foreach($companies as $company)
                                            @if(isset($params['company_id']) && $params['company_id']== $company->id)
                                                <option value="{{$company->id}}"
                                                        selected>{{$company->display_name}}</option>
                                            @else
                                                <option value="{{$company->id}}">{{$company->display_name}}</option>
                                            @endif
                                        @endforeach
                                    </select>
                                </div><!--公司信息-->
                                <button class="btn btn-default operate-batch-delete" type="button"
                                        name="operate-batch-delete" data-url="company_employee/batch"
                                        data-toggle="modal" data-target=".confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="company_employee/create" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <a class="btn btn-default operate-refresh" type="button" name="refresh"
                                   data-url="{{ url('admin/company_employee') }}" title="重置刷新">
                                    <i class="glyphicon glyphicon-refresh icon-refresh"></i></a>
                                <a class="btn btn-default operate-dustbin" type="button" name="dustbin"
                                   href="{{ url('admin/company_employee/trash') }}"
                                   title="垃圾箱">
                                    <i class="glyphicon glyphicon-retweet icon-retweet"></i></a>
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
                                            <div class="th-inner" data-name="number">工号</div>
                                            <div class="fht-cell"></div>
                                        </th><!--number-->
                                        <th style="">
                                            <div class="th-inner" data-name="nickname">姓名</div>
                                            <div class="fht-cell"></div>
                                        </th><!--nickname-->
                                        <th style="">
                                            <div class="th-inner" data-name="company">公司</div>
                                            <div class="fht-cell"></div>
                                        </th><!--company-->
                                        <th style="">
                                            <div class="th-inner" data-name="department">部门</div>
                                            <div class="fht-cell"></div>
                                        </th><!--department-->
                                        <th style="">
                                            <div class="th-inner" data-name="position">职位</div>
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
                                    @foreach($employees as $item)
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
                                            <td>{{ $item->number }}</td><!--工号-->
                                            <td>{!! ($item->user) ? '<a href="'.url('admin/user/'.$item->user->id).'">'.$item->nickname.'</a>' : $item->nickname !!}</td>
                                            <!--姓名-->
                                            <td>{!! ($item->company) ? '<a href="'.url('admin/company/'.$item->company->id).'">'.$item->company->display_name.'</a>' : '' !!}</td>
                                            <!--公司-->
                                            <td>{!! ($item->department) ? '<a href="'.url('admin/company_department/'.$item->department->id).'">'.$item->department->name.'</a>' : '' !!}</td>
                                            <!--部门-->
                                            <td>{{ $item->positions or '' }}</td>
                                            <!--头衔-->
                                            <td>{!! ($item->created_at) ? $item->created_at->format('Y-m-d'): '' !!}</td>
                                            <!--创建时间-->
                                            <td>
                                                <a href="{{ url('admin/company_employee/'.$item->id) }}"
                                                   class="btn btn-white btn-xs" title="详情"><i
                                                            class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                @if(request()->is('*/trash'))
                                                    <a href="" class="btn btn-success btn-xs operate-recover"
                                                       data-toggle="modal" data-target=".confirmModal"
                                                       data-url="{{ url('admin/company_employee/'.$item->id.'/recover') }}"
                                                       data-info="{{ $item->nickname }} 员工"
                                                       title="恢复">
                                                        <i class="glyphicon glyphicon-transfer"></i>恢复
                                                    </a>
                                                    <a class="btn btn-danger btn-xs operate-delete"
                                                       data-toggle="modal" data-target=".confirmModal"
                                                       data-url="{{ url('admin/company_employee/trash/'.$item->id) }}"
                                                       data-info="{{ $item->number }} 员工" title="彻底删除">
                                                        <i class="glyphicon glyphicon-trash"></i>彻底删除
                                                    </a>
                                                @else
                                                    <a href="{{ url('admin/company_employee/'. $item->id .'/edit') }}"
                                                       class="btn btn-primary btn-xs" title="编辑"><i
                                                                class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                    @if($item->user)
                                                        <a href="" class="btn btn-warning btn-xs operate-unbinding"
                                                           data-toggle="modal" data-target=".confirmModal"
                                                           data-url="company_employee/{{ $item->id }}/unbinding"
                                                           data-info="{{ $item->user->nickname }}"
                                                           title="解绑用户">
                                                            <i class="glyphicon glyphicon-link"></i>解绑</a>
                                                    @endif
                                                    <a class="btn btn-danger btn-xs operate-delete"
                                                       data-toggle="modal" data-target=".confirmModal"
                                                       data-url="company_employee/{{ $item->id }}"
                                                       data-info="{{ $item->number }} 员工" title="删除">
                                                        <i class="glyphicon glyphicon-trash"></i>删除
                                                    </a>
                                                @endif
                                            </td><!--操作-->
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div><!--表单内容-->
                            <div class="fixed-table-pagination">
                                <div class="pull-right pagination">
                                    {!! $employees->appends($params)->render() !!}
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




