@extends('web.common.layout')
@section('title', '模板组')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.templategroup') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">模板组</a>
            </li>
        </ul>

        <div class="myCard-content rt-main">
            @if(Auth::user()->company)
                <ul class="b-button">
                    {{--<li class="b-btn-bg"><a href="{{ url('company/employee/batch') }}" class="delete"><i class="iconFont">&#xe6d3;</i>批量删除</a></li>--}}
                    <li class="b-btn-bg">
                        <a href="javascript:;" data-toggle="modal" data-target="#modal-templategroup-add">
                            <i class="iconFont">&#xe67d;</i>添加</a>
                    </li>
                    {{--<li class="b-btn-bg"><a href="javascript:;" data-toggle="modal"--}}
                                            {{--data-target="#modal-employee-import">--}}
                            {{--<i class="iconFont">&#xe67d;</i>导入Excel</a></li>--}}
                    {{--<li class="b-btn-bg"><a href="javascript:;" data-toggle="modal"--}}
                                            {{--data-target="#modal-employee-export">--}}
                            {{--<i class="iconFont">&#xe67d;</i>导出数据</a></li>--}}

                    {{--<li class="b-btn-bor b-word-btn ">--}}
                        {{--<a href="javascript:" class="word-select" name="noword">查询字段<i class="iconFont">&#xe618;</i></a>--}}
                        {{--<ul class="b-word none">--}}
                            {{--<li><a class="dropdown-word" id="noword">查询字段</a></li>--}}
                            {{--<li><a class="dropdown-word" id="number">工号</a></li>--}}
                            {{--<li><a class="dropdown-word" id="nickname">姓名</a></li>--}}
                            {{--<li><a class="dropdown-word" id="positions">职位</a></li>--}}
                            {{--<li><a class="dropdown-word" id="mobile">手机</a></li>--}}
                            {{--<li><a class="dropdown-word" id="telephone">电话</a></li>--}}
                            {{--<li><a class="dropdown-word" id="department">部门</a></li>--}}
                        {{--</ul>--}}
                    {{--</li>--}}
                    {{--<li class="b-search  " name='search-form'>--}}
                        {{--<form action="{{ url('/company/employee') }}">--}}
                            {{--<input type="hidden" class="word" name="word" value='nickname'>--}}
                            {{--<input class="b-input b-form-bor" type="text" name="keyword" placeholder="请输入关键字">--}}
                            {{--<input class="b-ser-btn b-form-bg" type="submit" value="查找">--}}
                        {{--</form>--}}
                    {{--</li>--}}
                </ul>
            @endif

            <table class="table b-table table-hover" id="tableList">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="boxAll"><label for="boxAll" class="iconFont"><i>&#xe7de;</i></label>
                    </th>
                    {{--<th class="b-phone-w2"><a href="">工号</a></th>--}}
                    <th class=" "><a href="">名称</a></th>
                    <th class="b-phone-w2"><a href="">模板</a></th>
                    {{--<th class="b-phone-w2"><a href="">职位</a></th>--}}
                    {{--<th class=" b-td-hide"><a href="">手机</a></th>--}}
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th><!--适应手机-->
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($templategroup))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($templategroup as $item)
                        <tr class="">
                            <td class="b-phone-w"><input type="checkbox" id="{{ $item->id }}">
                                <label for="{{ $item->id }}" class="iconFont"><i>&#xe7de;</i></label>
                            </td>
                            <td class="">{{ $item->name }}</td>
                            <td class="">{{ $item->template_displayname }}</td>
                            <td class="b-td-icon b-td-hide w-icon">
                                @if(Auth::user()->company)
                                    <a href="" data-toggle="modal" data-target="#modal-templategroup-edit"
                                       data-url="{{ url('company/templategroup/'.$item->id) }}" class="operate-edit"><i
                                                class="iconFont">&#xe632;</i></a>

                                    <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                       class="operate-delete"
                                       data-url="{{ url('company/templategroup/'.$item->id) }}">
                                        <i class="iconFont">&#xe6d3;</i></a>
                                @endif
                            </td>
                            <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                            </td>
                        </tr>
                        <tr class="td-icon-hide none">
                            <td id="look">
                                <a href="javascript:" data-toggle="modal" data-target=".bs2"><i
                                            class="iconFont">&#xe613;</i></a>
                            </td>
                            <td><a href=""><i class="iconFont">&#xe634;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe632;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe921;</i></a></td>
                            <td><a href="" data-toggle="modal" data-target=".bs3"><i
                                            class="iconFont">&#xe6d3;</i></a></td>
                        </tr><!--适应手机操作-->
                    @endforeach
                @endif
                </tbody>
            </table>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p><!--适应手机-->
            {{--{!! $employees ? $employees->appends($params)->render() : '' !!}--}}
        </div>
    </div>
@stop

@section('modal-extend')


    <!-- 员工 - 添加modal star-->
    <div class="modal fade" id="modal-templategroup-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加模板组</h4>
                </div>
                <form action="{{ url('company/templategroup') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Templategroup[name]" placeholder="" class="info-name
                                       value="{{ old('Templategroup.name') ? old('Templategroup.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>选择模板 : </span>

                                <select class="info-template_id" id="id" name="Templategroup[template_id]">
                                    <option value="">选择模板</option>

                                    @foreach($templates as $template)
                                        <option {{ old('Templategroup.id') == $template->id ? 'selected' : '' }}
                                                value="{{ $template->id }}">{{ $template->display_name }}</option>
                                    @endforeach
                                </select>
                                <span class="error-template_id" style="color: red;"></span>
                            </p>




                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-create">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div><!-- 模板组合 - 添加modal -->

    <div class="modal fade" id="modal-templategroup-edit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加模板组</h4>
                </div>
                <form action="" method="post" class="form-update"
                      enctype="multipart/form-data">
                    {{--{{ method_field('put') }}--}}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Templategroup[name]" placeholder="" class="info-name"
                                       value="{{ old('Templategroup.name') ? old('Templategroup.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>

                            <p>
                                <span>选择模板 : </span>

                                <select class="info-template_id" id="id" name="Templategroup[template_id]"class="info-template_id">
                                    <option value="">选择模板</option>
                                    @foreach($templates as $template)
                                        <option {{ old('Templategroup.id') == $template->id ? 'selected' : '' }}
                                                value="{{ $template->id }}">{{ $template->display_name }}</option>
                                    @endforeach
                                </select>
                                <span class="error-template_id" style="color: red;"></span>
                            </p>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-update">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div><!-- 员工 - 编辑modal -->
@stop
