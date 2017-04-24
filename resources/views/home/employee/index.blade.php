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
            {{--<ul class="b-button">--}}
            {{--<li class="b-btn-bg"><a href="" ><i class="iconFont">&#xe6d3;</i>批量删除</a></li>--}}
            {{--<li class="b-btn-bor b-sort-btn ">--}}
            {{--<a href="javascript:" >选择排序<i class="iconFont">&#xe618;</i></a>--}}
            {{--<ul class="b-sort none">--}}
            {{--<li><a href="">按名字排序</a></li>--}}
            {{--<li><a href="">按职位排序</a></li>--}}
            {{--<li><a href="">按部门排序</a></li>--}}
            {{--<li><a href="">按入职时间排序</a></li>--}}
            {{--</ul>--}}
            {{--</li>--}}
            {{--<li class="b-btn-bor"><a href="" >查询字段<i class="iconFont">&#xe618;</i></a></li>--}}
            {{--<li class="b-search  ">--}}
            {{--<form action="">--}}
            {{--<input class="b-input b-form-bor" type="text" placeholder="请输入关键字">--}}
            {{--<input class="b-ser-btn b-form-bg" type="submit" value="查找">--}}
            {{--</form>--}}
            {{--</li>--}}
            {{--</ul>--}}
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
                    <tr>
                        <td class="b-phone-w"><input type="checkbox" id="box10"><label for="box10" class="iconFont"><i>&#xe7de;</i></label>
                        </td>
                        <td class="b-phone-w2">{{ $item->number }}</td>
                        <td class="">{{ $item->name }}</td>
                        <td class="">{{ $item->title }}</td>
                        <td class="b-td-width b-td-hide">{{ $item->mobile }}</td>
                        <td class="b-td-icon b-td-hide w-icon">
                            <a href="javascript:" data-toggle="modal" data-target=".bs2"><i
                                        class="iconFont">&#xe613;</i></a>
                            <a href="" class="w-icon-margin"><i class="iconFont">&#xe634;</i></a>
                            <a href=""><i class="iconFont">&#xe632;</i></a>
                            <a href=""><i class="iconFont">&#xe921;</i></a>
                            <a href="javascript:" data-toggle="modal" data-target=".bs3"><i
                                        class="iconFont">&#xe6d3;</i></a>
                        </td>
                        <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                        </td>
                    </tr>
                    <tr class="td-icon-hide none">
                        <td id="look"><a href="javascript:" data-toggle="modal" data-target=".bs2"><i class="iconFont">&#xe613;</i></a>
                        </td>
                        <td><a href=""><i class="iconFont">&#xe634;</i></a></td>
                        <td><a href=""><i class="iconFont">&#xe632;</i></a></td>
                        <td><a href=""><i class="iconFont">&#xe921;</i></a></td>
                        <td><a href="javascript:" data-toggle="modal" data-target=".bs3"><i
                                        class="iconFont">&#xe6d3;</i></a></td>
                    </tr><!--适应手机操作-->
                @endforeach
                </tbody>
            </table>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p><!--适应手机-->
            {!! $employees->render() !!}
            {{--<ul class="b-page lt">--}}
                {{--<li><a href="" class="iconFont">&#xe61f;</a></li>--}}
                {{--<li><a href="" class="iconFont">&#xe600;</a></li>--}}
                {{--<li class="page-active"><a href="">1</a></li>--}}
                {{--<li><a href="">2</a></li>--}}
                {{--<li><a href="">3</a></li>--}}
                {{--<li><a href="">..</a></li>--}}
                {{--<li><a href="">8</a></li>--}}
                {{--<li><a href="" class="iconFont">&#xe609;</a></li>--}}
                {{--<li><a href="" class="iconFont">&#xe60f;</a></li>--}}
            {{--</ul>--}}
            {{--<ul class="b-rt-page rt">--}}
                {{--<li class="rt-page-active"><a href="">10</a></li>--}}
                {{--<li><a href="">15</a></li>--}}
                {{--<li><a href="">20</a></li>--}}
            {{--</ul>--}}
        </div>
    </div>
@stop
