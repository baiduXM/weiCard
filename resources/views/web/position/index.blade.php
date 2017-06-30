@extends('web.common.layout')
@section('title', '职位')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.position') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">公司职位</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            @if(Auth::user()->company)
                <ul class="b-button">
                    {{--<li class="b-btn-bg"><a href=""><i class="iconFont">&#xe6d3;</i>批量删除</a></li>--}}
                    {{--<li class="b-btn-bg"><a href=""><i class="iconFont">&#xe67d;</i>批量添加</a></li>--}}
                    {{--<li class="b-btn-bg"><a href="javascript:">导入excel</a></li>--}}
                    <li class="b-btn-bg"><a href="" data-toggle="modal" data-target="#modal-position-add"><i
                                    class="iconFont">&#xe67d;</i>添加</a>
                    </li>
                    {{--<li class="b-btn-bor b-sort-btn ">--}}
                    {{--<a href="javascript:">选择排序<i class="iconFont">&#xe618;</i></a>--}}
                    {{--<ul class="b-sort none">--}}
                    {{--<li><a href="">按名称排序</a></li>--}}
                    {{--<li><a href="">按时间排序</a></li>--}}
                    {{--</ul>--}}
                    {{--</li>--}}
                    {{--<li class="b-btn-bor"><a href="">查询字段<i class="iconFont">&#xe618;</i></a></li>--}}
                    {{--<li class="b-search  ">--}}
                    {{--<form action="">--}}
                    {{--<input class="b-input b-form-bor" type="text" placeholder="请输入关键字">--}}
                    {{--<input class="b-ser-btn b-form-bg" type="submit" value="查找">--}}
                    {{--</form>--}}
                    {{--</li>--}}
                </ul>
            @endif
            <table class="table b-table table-hover">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="box9"><label for="box9" class="iconFont"><i>&#xe7de;</i></label>
                    </th>
                    <!-- <th class="b-phone-w2"><a href="">#</a></th> -->
                    <th class=" "><a href="">职位</a></th>
                    <!-- <th class=" "><a href="">是否唯一</a></th> -->
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th><!--适应手机-->
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($positions))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($positions as $item)
                        <tr class="{{ $item->user_id == Auth::id() ? 'info' : '' }}">
                            <td class="b-phone-w"><input type="checkbox" id="box10">
                                <label for="box10" class="iconFont"><i>&#xe7de;</i></label>
                            </td>
                            <!-- <td class="b-phone-w2">{{ $item->id }}</td> -->
                            <td class="">{{ $item->name }}</td>
                            <!-- <td>
                                @if($item->is_only == 1)
                                    是
                                @else
                                    否
                                @endif
                            </td> -->
                            <td class="b-td-icon b-td-hide w-icon">
                                @if(Auth::user()->company)
                                    <a href="" data-toggle="modal" data-target="#modal-employee-edit"
                                       data-url="{{ url('company/position/'.$item->id) }}" class="operate-edit"><i
                                                class="iconFont">&#xe632;</i></a>
                                    {{--<a href="javascript:void(0);" class="operate-share"--}}
                                    {{--data-url="{{ url('cardcase/follow/e-'.$item->id) }}"><i class="iconFont">&#xe921;</i></a>--}}
                                    <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                       class="operate-delete"
                                       data-url="{{ url('company/position/'.$item->id) }}">
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
            {!! $positions ? $positions->render() : '' !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <!-- 职位 - 添加modal -->
    <div class="modal fade" id="modal-position-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加职位</h4>
                </div>
                <form action="{{ url('company/position') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>职位名称 : </span>
                                <input type="text" name="Position[name]" placeholder=""
                                       value="{{ old('Position.name') ? old('Position.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            <!-- <p>
                                <span>职位级别 : </span>
                                <input type="text" name="Position[level]" placeholder="填写数字，越小级别越高"
                                       value="{{ old('Position.level') ? old('Position.level') : '' }}">
                                <span class="error-level" style="color: red;"></span>
                            </p> -->
                            <!-- <p>
                                <span>是否唯一 : </span>
                                <input type="checkbox" name="Position[is_only]" value="1" style="display:block;height:13px;" />是
                                <span class="error-is_only" style="color: red;"></span>
                            </p> -->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-create">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 职位 - 编辑modal -->
    <div class="modal fade" id="modal-employee-edit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">编辑职位</h4>
                </div>
                <form action="" method="post" class="form-update"
                      enctype="multipart/form-data">
                    {{--{{ method_field('put') }}--}}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>职位名称 : </span>
                                <input type="text" name="Position[name]" placeholder="" class="info-name"
                                       value="{{ old('Position.name') ? old('Position.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            <!-- <p>
                                <span>职位级别 : </span>
                                <input type="text" name="Position[level]" placeholder="" class="info-level"
                                       value="{{ old('Position.level') ? old('Position.level') : '' }}">
                                <span class="error-level" style="color: red;"></span>
                            </p> -->
                            <!-- <p>
                                <span>是否唯一 : </span>
                                <input type="checkbox" name="Position[is_only]" value="1" class="info-is_only" style="display:block;height:13px;" />是
                                <span class="error-is_only" style="color: red;"></span>
                            </p> -->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-update">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop