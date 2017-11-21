@extends('admin.common.layout')
@section('title', '模板管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.template') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    模板列表
                </div>
                <div class="panel-body">
                    <div class="bootstrap-table">
                        {{--表单功能栏--}}
                        <div class="fixed-table-toolbar">
                            <div class="columns btn-group pull-left">
                                <button class="btn btn-default operate-batch-delete" type="button"
                                        name="operate-batch-delete" data-url="template/batch"
                                        data-toggle="modal" data-target=".confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="template/create" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        data-url="template" title="重置刷新">
                                    <i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                                {{--<button class="btn btn-default operate-dustbin" type="button" name="dustbin"--}}
                                        {{--data-url="template" title="垃圾箱">--}}
                                    {{--<i class="glyphicon glyphicon-retweet"></i></button>--}}
                            </div><!--显示-->
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
                                            <div class="th-inner" data-name="name">编号</div>
                                            <div class="fht-cell"></div>
                                        </th><!--name-->
                                        <th style="">
                                            <div class="th-inner" data-name="display_name">名称</div>
                                            <div class="fht-cell"></div>
                                        </th><!--display_name-->
                                        <th style="">
                                            <div class="th-inner" data-name="sort">序号</div>
                                            <div class="fht-cell"></div>
                                        </th><!---->
                                        <th style="">
                                            <div class="th-inner" data-name="category_number">栏目个数</div>
                                            <div class="fht-cell"></div>
                                        </th><!---->
                                        <th style="">
                                            <div class="th-inner" data-name="type">类型</div>
                                            <div class="fht-cell"></div>
                                        </th><!--type-->
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
                                    @foreach($templates as $item)
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
                                            <td>{{ $item->display_name }}</td><!--display_name-->
                                            <td>{{ $item->sort }}</td><!--sort-->
                                            <td>{{ $item->category_number }}</td><!--sort-->
                                            <td>
                                                @if($item->type == $item::TYPE_ALL)
                                                    <span class="label label-default">{{ $item->getType($item->type) }}</span>
                                                @elseif($item->type == $item::TYPE_USER)
                                                    <span class="label label-success">{{ $item->getType($item->type) }}</span>
                                                @elseif($item->type == $item::TYPE_COMPANY)
                                                    <span class="label label-primary">{{ $item->getType($item->type) }}</span>
                                                @endif
                                            </td><!--操作-->

                                            <td>{{ $item->created_at->format('Y-m-d') }}</td><!--created_at-->
                                            <td>
                                                {{--<a href="{{ url('mpmanager/template/'.$item->id) }}"--}}
                                                   {{--class="btn btn-white btn-xs" title="详情"><i--}}
                                                            {{--class="glyphicon glyphicon-list-alt"></i>详情</a>--}}
                                                <a href="{{ url('mpmanager/template/'. $item->id .'/edit') }}"
                                                   class="btn btn-primary btn-xs" title="编辑"><i
                                                            class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                <a href="" class="btn btn-danger btn-xs operate-delete"
                                                   data-toggle="modal" data-target=".confirmModal"
                                                   data-url="template/{{ $item->id }}"
                                                   data-info="{{ $item->name }} 管理员" title="删除">
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
                                    {!! $templates->render() !!}
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




