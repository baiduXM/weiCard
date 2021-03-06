@extends('home.common.layout')
@section('title', '员工')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.employee') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">我的同事</a>
            </li>
        </ul>

        <div class="myCard-content rt-main">
            @if(Auth::user()->company)
                <ul class="b-button">
                    {{--<li class="b-btn-bg"><a href=""><i class="iconFont">&#xe6d3;</i>批量删除</a></li>--}}
                    {{--<li class="b-btn-bg"><a href=""><i class="iconFont">&#xe67d;</i>批量添加</a></li>--}}
                    {{--<li class="b-btn-bg"><a href="javascript:">导入excel</a></li>--}}
                    <li class="b-btn-bg"><a href="" data-toggle="modal" data-target="#modal-employee-add"><i
                                    class="iconFont">&#xe67d;</i>添加</a>
                    </li>
                    {{--<li class="b-btn-bor b-sort-btn ">--}}
                    {{--<a href="javascript:">选择排序<i class="iconFont">&#xe618;</i></a>--}}
                    {{--<ul class="b-sort none">--}}
                    {{--<li><a href="">按名字排序</a></li>--}}
                    {{--<li><a href="">按职位排序</a></li>--}}
                    {{--<li><a href="">按部门排序</a></li>--}}
                    {{--<li><a href="">按入职时间排序</a></li>--}}
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
                    <th class="b-phone-w2"><a href="">工号</a></th>
                    <th class=" "><a href="">姓名</a></th>
                    <th class="b-phone-w2"><a href="">职位</a></th>
                    <th class=" b-td-hide"><a href="">电话</a></th>
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th><!--适应手机-->
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($employees))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($employees as $item)
                        <tr class="{{ $item->user_id == Auth::id() ? 'info' : '' }}">
                            <td class="b-phone-w"><input type="checkbox" id="box10">
                                <label for="box10" class="iconFont"><i>&#xe7de;</i></label>
                            </td>
                            <td class="b-phone-w2">{{ $item->number }}</td>
                            <td class="">{{ $item->name }}</td>
                            <td class="">{{ $item->position ? $item->position->name : '' }}</td>
                            <td class="b-td-width b-td-hide">{{ $item->telephone }}</td>
                            <td class="b-td-icon b-td-hide w-icon">
                                <a href="" data-toggle="modal" data-target="#modal-employee-show"
                                   class="operate-show"
                                   data-url="{{ url('company/employee/'.$item->id) }}"><i
                                            class="iconFont">&#xe613;</i></a>
                                <a href="javascript:void(0);" class="w-icon-margin operate-follow"
                                   data-url="{{ url('cardcase/follow/e-'.$item->id) }}">
                                    @if(count($item->followers)<1)
                                        <i class="iconFont" title="收藏">&#xe634;</i>
                                    @else
                                        <i class="iconFont" title="取消收藏">&#xe601;</i>
                                    @endif
                                </a>
                                @if(Auth::user()->company)
                                    <a href="" data-toggle="modal" data-target="#modal-employee-edit"
                                       data-url="{{ url('company/employee/'.$item->id) }}" class="operate-edit"><i
                                                class="iconFont">&#xe632;</i></a>
                                    {{--<a href="javascript:void(0);" class="operate-share"--}}
                                    {{--data-url="{{ url('cardcase/follow/e-'.$item->id) }}"><i class="iconFont">&#xe921;</i></a>--}}
                                    <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                       class="operate-delete"
                                       data-url="{{ url('company/employee/'.$item->id) }}">
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
            {!! $employees ? $employees->render() : '' !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <!-- 员工 - 添加modal -->
    <div class="modal fade" id="modal-employee-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加部门员工</h4>
                </div>
                <form action="{{ url('company/employee') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>工号 : </span>
                                <input type="text" name="Employee[number]" placeholder=""
                                       value="{{ old('Employee.number') ? old('Employee.number') : '' }}">
                                <span class="error-number hidden" style="color: red;">123</span>
                            </p>
                            <p>
                                <span>姓名 : </span>
                                <input type="text" name="Employee[name]" placeholder=""
                                       value="{{ old('Employee.name') ? old('Employee.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            {{--<p>--}}
                            {{--<span>部门 : </span>--}}
                            {{--<input type="text" name="Employee[department]" placeholder=""--}}
                            {{--value="{{ old('Employee.department') ? old('Employee.department') : '' }}">--}}
                            {{--</p>--}}
                            {{--<p>--}}
                            {{--<span>职位 : </span>--}}
                            {{--<input type="text" name="Employee[position]" placeholder=""--}}
                            {{--value="{{ old('Employee.position') ? old('Employee.position') : '' }}">--}}
                            {{--</p>--}}
                            <p>
                                <span>照片 : </span>
                                <input type="file" name="Employee[avatar]" placeholder="公司名称">
                                <span class="error-avatar" style="color: red;"></span>
                            </p>

                            <p>
                                <span>座机 : </span>
                                <input type="text" name="Employee[telephone]" placeholder=""
                                       value="{{ old('Employee.telephone') ? old('Employee.telephone') : '' }}">
                                <span class="error-telephone" style="color: red;"></span>
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
    </div>
    <!-- 员工 - 查看modal -->
    <div class="modal fade" id="modal-employee-show" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">查看</h4>
                </div>
                <div class="modal-body">
                    <div class="modal-address">
                        <p><span>公司 : </span><input type="text" name="info-company" value="" readonly></p>
                        {{--<p><span>部门 : </span><input type="text" name="info-department" value="" readonly></p>--}}
                        {{--<p><span>职位 : </span><input type="text" name="info-position" value="" readonly></p>--}}
                        <p><span>工号 : </span><input type="text" name="info-number" value="" readonly></p>
                        <p><span>姓名 : </span><input type="text" name="info-name" value="" readonly></p>
                        <p><span>绑定用户 : </span><input type="text" name="info-user" value="" readonly></p>
                        <p><span>座机 : </span><input type="text" name="info-telephone" value="" readonly></p>
                    </div>
                    <div class="modal-address-img">
                        <img name="info-avatar" src="{{ asset('static/home/images/avatar.jpg') }}" alt="">
                        {{--<img name="info-avatar" src="../uploads/company/STQ564/img1493984327.jpg" alt="">--}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 员工 - 编辑modal -->
    <div class="modal fade" id="modal-employee-edit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">编辑部门员工</h4>
                </div>
                <form action="" method="post" class="form-update"
                      enctype="multipart/form-data">
                    {{--{{ method_field('put') }}--}}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>工号 : </span>
                                <input type="text" name="Employee[number]" placeholder="" class="info-number"
                                       value="{{ old('Employee.number') ? old('Employee.number') : '' }}" readonly>
                                <span class="error-number" style="color: red;"></span>
                            </p>
                            <p>
                                <span>姓名 : </span>
                                <input type="text" name="Employee[name]" placeholder="" class="info-name"
                                       value="{{ old('Employee.name') ? old('Employee.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>照片 : </span>
                                <input type="file" name="Employee[avatar]" placeholder="公司名称">
                                <span class="error-avatar" style="color: red;"></span>
                            </p>
                            <p>
                                <span>座机 : </span>
                                <input type="text" name="Employee[telephone]" placeholder="" class="info-telephone"
                                       value="{{ old('Employee.telephone') ? old('Employee.telephone') : '' }}">
                                <span class="error-telephone" style="color: red;"></span>
                            </p>
                        </div>
                        <div class="modal-address-img">
                            <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="" class="info-avatar">
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