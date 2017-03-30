@extends('home.common.layout')
@section('title', '公司')
@section('content')
    <div id="myCard" >
    <ul class="cont-nav rt" >
        <li><a href="">我的公司 > </a></li>
        <li class="cont-nav-act"><a href="">公司部门</a></li>
    </ul>
    <ul class="nav nav-tabs" id="myTab">
        <li class="active" >
            <a href=""   >公司部门</a>
        </li>
    </ul>
    <div class="myCard-content rt-main">
        <p class="phone-show add-yg">公司部门</p>
        <ul class="b-button">
            <li class="b-btn-bg"><a href="" ><i class="iconFont">&#xe6d3;</i>批量删除</a></li>
            <li class="b-btn-bg" ><a href="javascript:" data-toggle="modal" data-target=".bs1" ><i class="iconFont">&#xe67d;</i>添加部门</a></li>
            <li class="b-btn-bg" ><a href="javascript:" data-toggle="modal" data-target=".bs9" ><i class="iconFont">&#xe67d;</i>添加职位</a></li>
            <li class="b-btn-bor b-sort-btn ">
                <a href="javascript:" >选择排序<i class="iconFont">&#xe618;</i></a>
                <ul class="b-sort none">
                    <li><a href="">按人数排序</a></li>
                    <li><a href="">按时间排序</a></li>
                </ul>
            </li>
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
                <th class=""><input type="checkbox" id="box4"><label for="box4" ><i class="iconFont">&#xe7de;</i></label></th>
                <th class="b-phone-w2"><a href="">部门名称</a></th>
                <th ><a href="">负责人</a></th>
                <th class="b-phone-w2"><a href="">绑定数/人数</a></th>
                <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th>
                <th class=" b-td-hide"><a href="">操作</a></th>
            </tr>
            </thead>
            <tbody>
            <tr class="b-no-bor">
                <td></td>
            </tr>
            <tr>
                <td class="b-phone-w"><input type="checkbox" id="box3"><label for="box3" ><i class="iconFont">&#xe7de;</i></label></td>
                <td class="b-phone-w2">设计部</td>
                <td >李四</td>
                <td class="b-td-width">13 </td>
                <td class="b-td-icon b-td-hide">
                    <a  href="javascript:" data-toggle="modal" data-target=".bs7"><i class="iconFont">&#xe613;</i></a>
                    <a href="javascript:" data-toggle="modal" data-target=".bs8"><i class="iconFont">&#xe67d;</i></a>
                    <a href=""><i class="iconFont">&#xe921;</i></a>
                    <a href="javascript:" data-toggle="modal" data-target=".bs3"><i class="iconFont">&#xe6d3;</i></a>
                </td>
                <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a></td>
            </tr>
            <tr class="td-icon-hide none" id="firmIcon">
                <td id="look">  <a  href="wdgs-gsbm-phone-look.html"><i class="iconFont">&#xe613;</i></a></td>
                <td>  <a href="javascript:" data-toggle="modal" data-target=".bs8"><i class="iconFont">&#xe67d;</i></a></td>
                <td>  <a href=""><i class="iconFont">&#xe921;</i></a></td>
                <td>  <a href="javascript:" data-toggle="modal" data-target=".bs3"><i class="iconFont">&#xe6d3;</i></a></td>
                <td>  <a href=""></a></td>
            </tr>

            </tbody>
        </table>
        <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p>
        <ul class="b-page lt">
            <li><a href="" class="iconFont">&#xe61f;</a></li>
            <li><a href=""  class="iconFont">&#xe600;</a></li>
            <li class="page-active"><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">..</a></li>
            <li><a href="">8</a></li>
            <li><a href="" class="iconFont">&#xe609;</a></li>
            <li><a href="" class="iconFont">&#xe60f;</a></li>
        </ul>
        <ul class="b-rt-page rt">
            <li class="rt-page-active"><a href="">10</a></li>
            <li><a href="">15</a></li>
            <li><a href="">20</a></li>
        </ul>
    </div>
</div>
@stop