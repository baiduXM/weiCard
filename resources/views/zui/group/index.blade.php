@extends('home.common.layout')
@section('title', '设置分组')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">我的通讯录 > </a></li>
            <li class="cont-nav-act"><a href="">设置分组</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href=""   >设置分组</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <ul class="b-button">
                <li class="b-btn-bg"><a href="javascript:" ><i class="iconFont">&#xe67d;</i>新建组</a></li>
                <li class="b-btn-bor b-sort-btn ">
                    <a href="javascript:">所有分组<i class="iconFont">&#xe618;</i></a>
                    <ul class="b-sort none">
                        <li><a href="">设计</a></li>
                        <li><a href="">研发</a></li>
                        <li><a href="">销售</a></li>
                        <li><a href="">市场</a></li>
                        <li><a href="">策划</a></li>
                    </ul>
                </li>
                <li class="b-search setting ">
                    <form action="">
                        <input class="b-input b-form-bor" type="text" placeholder="请输入关键字">
                        <input class="b-ser-btn b-form-bg" type="submit" value="查找">
                    </form>
                </li>
            </ul>
            <table class="table b-table">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="box6"><label for="box6"><i class="iconFont">&#xe7de;</i></label></th>
                    <th class="b-phone-w2"><a href="">姓名</a></th>
                    <th class=" b-td-hide"><a href="">电话</a></th>
                    <th class="b-phone-w2"><a href="">所在分组</a></th>
                    <th class=" b-td-show"><a href=""><i class="iconFont">&#xe652;</i></a></th>
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                <tr class="b-no-bor">
                    <td></td>
                </tr>
                <tr>
                    <td class="b-phone-w"><input type="checkbox" id="box5"><label for="box5"><i class="iconFont">&#xe7de;</i></label></td>
                    <td class="b-phone-w2">张三</td>
                    <td class="b-td-hide">1352000112</td>
                    <td class="b-td-width">设计</td>
                    <td class="b-td-icon b-td-hide">
                        <a href="javascript:" data-toggle="modal" data-target=".bs4"><i class="iconFont">&#xe67d;</i></a>
                        <a href="javascript:" data-toggle="modal" data-target=".bs5"><i class="iconFont">&#xe921;</i></a>
                        <a href="javascript:" data-toggle="modal" data-target=".bs3"><i class="iconFont">&#xe6d3;</i></a>
                    </td>
                    <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a></td>
                </tr>
                <tr class="td-icon-hide none">
                    <td>  <a href=""><i class="iconFont">&#xe613;</i></a></td>
                    <td>  <a href=""><i class="iconFont">&#xe632;</i></a></td>
                    <td>  <a href="javascript:" data-toggle="modal" data-target=".bs5"><i class="iconFont">&#xe921;</i></a></td>
                    <td>  <a href="javascript:" data-toggle="modal" data-target=".bs3"><i class="iconFont">&#xe6d3;</i></a></td>
                </tr>

                </tbody>
            </table>
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