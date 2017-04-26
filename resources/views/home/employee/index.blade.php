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
            <ul class="b-button">
                @if(Auth::user()->company)
                    <li class="b-btn-bg"><a href=""><i class="iconFont">&#xe6d3;</i>批量删除</a></li>
                    <li class="b-btn-bg"><a href=""><i class="iconFont">&#xe67d;</i>批量添加</a></li>
                    <li class="b-btn-bg"><a href="javascript:">导入excel</a></li>
                    <li class="b-btn-bg"><a href="" data-toggle="modal" data-target=".bs8"><i
                                    class="iconFont">&#xe67d;</i>添加</a>
                    </li>
                @endif

                <li class="b-btn-bor b-sort-btn ">
                    <a href="javascript:">选择排序<i class="iconFont">&#xe618;</i></a>
                    <ul class="b-sort none">
                        <li><a href="">按名字排序</a></li>
                        <li><a href="">按职位排序</a></li>
                        <li><a href="">按部门排序</a></li>
                        <li><a href="">按入职时间排序</a></li>
                    </ul>
                </li>
                <li class="b-btn-bor"><a href="">查询字段<i class="iconFont">&#xe618;</i></a></li>
                <li class="b-search  ">
                    <form action="">
                        <input class="b-input b-form-bor" type="text" placeholder="请输入关键字">
                        <input class="b-ser-btn b-form-bg" type="submit" value="查找">
                    </form>
                </li>
            </ul>
            <table class="table b-table">
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
                {{--<tr class="b-no-bor">--}}
                {{--<td></td>--}}
                {{--</tr><!--?-->--}}
                @foreach($employees as $item)
                    <tr class="{{ $item->user_id == Auth::id() ? 'info' : '' }}">
                        <td class="b-phone-w"><input type="checkbox" id="box10">
                            <label for="box10" class="iconFont"><i>&#xe7de;</i></label>
                        </td>
                        <td class="b-phone-w2">{{ $item->number }}</td>
                        <td class="">{{ $item->name }}</td>
                        <td class="">{{ $item->title }}</td>
                        <td class="b-td-width b-td-hide">{{ $item->mobile }}</td>
                        <td class="b-td-icon b-td-hide w-icon">
                            <a href="" data-toggle="modal" data-target=".bs2" class="operate-show"
                               data-url="{{ url('company/employee/'.$item->id) }}"><i
                                        class="iconFont">&#xe613;</i></a>
                            <a href="" class="w-icon-margin"><i class="iconFont">&#xe634;</i></a>
                            <a href=""><i class="iconFont">&#xe632;</i></a>
                            <a href=""><i class="iconFont">&#xe921;</i></a>
                            <a href="" data-toggle="modal" data-target=".bs3" class="operate-delete"><i
                                        class="iconFont">&#xe6d3;</i></a>
                        </td>
                        <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                        </td>
                    </tr>
                    <tr class="td-icon-hide none">
                        <td id="look"><a href="javascript:" data-toggle="modal" data-target=".bs2"><i
                                        class="iconFont">&#xe613;</i></a>
                        </td>
                        <td><a href=""><i class="iconFont">&#xe634;</i></a></td>
                        <td><a href=""><i class="iconFont">&#xe632;</i></a></td>
                        <td><a href=""><i class="iconFont">&#xe921;</i></a></td>
                        <td><a href="" data-toggle="modal" data-target=".bs3"><i
                                        class="iconFont">&#xe6d3;</i></a></td>
                    </tr><!--适应手机操作-->
                @endforeach
                </tbody>
            </table>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p><!--适应手机-->
            {!! $employees->render() !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <!-- 添加部门员工modal -->
    <div class="modal fade bs8" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加部门员工</h4>
                </div>
                <form action="{{ url('company/employee') }}" method="post" id="employee" enctype="multipart/form-data">
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
                            <p>
                                <span>照片 : </span>
                                <input type="file" name="Employee[avatar]" placeholder="公司名称">
                                <span class="error-avatar" style="color: red;"></span>
                            </p>
                            <p>
                                <span>职位 : </span>
                                <input type="text" name="Employee[title]" placeholder=""
                                       value="{{ old('Employee.title') ? old('Employee.title') : '' }}">
                            </p>
                            <p>
                                <span>手机 : </span>
                                <input type="text" name="Employee[mobile]" placeholder=""
                                       value="{{ old('Employee.mobile') ? old('Employee.mobile') : '' }}">
                            </p>
                            <p class="m8">
                                <span>简介 : </span>
                                <textarea
                                        name="Employee[description]">{{ old('Employee.description') ? old('Employee.description') : '' }}</textarea>
                            </p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-add">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 通讯录-查看modal -->
    <div class="modal fade bs2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">查看</h4>
                </div>
                <div class="modal-body">
                    {{--<form action="">--}}
                        <div class="modal-address">
                            <p><span>姓名 : </span><input type="text"></p>
                            <p><span>固话 : </span><input type="text"></p>
                            <p><span>手机 : </span><input type="text"></p>
                            <p><span>传真 : </span><input type="text"></p>
                            <p><span>邮箱 : </span><input type="text"></p>
                            <p><span> Q Q : </span><input type="text"></p>
                            <p><span>微信 : </span><input type="text"></p>
                        </div>
                        <div class="modal-address-img">
                            <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="">
                        </div>
                    {{--</form>--}}
                </div>
                <div class="modal-footer">
                    <input type="submit" value="添加">
                    <input type="reset" data-dismiss="modal" value="取消">
                </div>
            </div>
        </div>
    </div>
@stop