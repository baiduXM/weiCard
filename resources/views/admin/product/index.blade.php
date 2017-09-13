@extends('admin.common.layout')
@section('title', '产品管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.product') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    产品管理
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
                                            @if($company_id == $company->id)
                                                <option value="{{$company->id}}"
                                                        selected>{{$company->display_name}}</option>
                                            @else
                                                <option value="{{$company->id}}">{{$company->display_name}}</option>
                                            @endif
                                        @endforeach
                                    </select>
                                </div><!--公司信息-->
                                <button class="btn btn-default operate-batch-delete" type="button"
                                        name="operate-batch-delete" data-url="company_product/batch"
                                        data-toggle="modal" data-target=".confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="company_product/create" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        data-url="company_product" title="重置刷新">
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
                                            <div class="th-inner" data-name="name">产品名称</div>
                                            <div class="fht-cell"></div>
                                        </th><!--name-->
                                        <th style="">
                                            <div class="th-inner" data-name="url">产品链接</div>
                                            <div class="fht-cell"></div>
                                        </th><!--url-->
                                        <th style="">
                                            <div class="th-inner" data-name="img">产品图片</div>
                                            <div class="fht-cell"></div>
                                        </th><!--img-->
                                        <th style="">
                                            <div class="th-inner" data-name="company">产品公司</div>
                                            <div class="fht-cell"></div>
                                        </th><!--company-->
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
                                    @foreach($products as $item)
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
                                            <td>{{ $item->product_name }}</td><!--产品名称-->
                                            <td>{{ $item->product_url }}</td><!--产品链接-->
                                            <td align="center"><img style="width:128px;height:142px;margin:0 auto;" src="{{ asset($item->product_img) }}" alt=""> </td><!--产品图片-->
                                            <td>{!! ($item->company) ? '<a href="'.url('mpmanager/company/'.$item->company->id).'">'.$item->company->display_name.'</a>' : '' !!}</td>
                                            <!--公司-->
                                            <td>{{ $item->created_at->format('Y-m-d') }}</td><!--创建时间-->
                                            <td>
                                                <a href="{{ url('mpmanager/company_product/'. $item->id .'/edit') }}"
                                                   class="btn btn-primary btn-xs" title="编辑"><i
                                                            class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                <a class="btn btn-danger btn-xs operate-delete"
                                                   data-toggle="modal" data-target=".confirmModal"
                                                   data-url="company_product/{{ $item->id }}"
                                                   data-info="{{ $item->number }} 产品" title="删除">
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
                                    {!! $products->appends($params)->render() !!}
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




