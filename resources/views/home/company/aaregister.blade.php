@extends('home.common.layout')
@section('title', '公司')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">我的公司 > </a></li>
            <li class="cont-nav-act"><a href="">添加员工</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href=""   >添加员工</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <p class="phone-show add-yg">添加员工</p>
            <ul class="b-button add-y">
                <li class="b-btn-bg"><a href="" ><i class="iconFont">&#xe67d;</i>批量添加</a></li>
                <li class="b-btn-bg" ><a href="javascript:"  >导入excel</a></li>
                <li class="b-btn-bg" ><a href="javascript:" data-toggle="modal" data-target=".bs8" ><i class="iconFont">&#xe67d;</i>添加</a></li>
            </ul>
            <table class="table b-table">
                <thead>
                <tr class="active">
                    <th class=""><input type="checkbox" id="box2"><label for="box2" class="iconFont"><i>&#xe7de;</i></label></th>
                    <th class=""><a href="">工号</a></th>
                    <th ><a href="">照片</a></th>
                    <th class=" t-sort-btn">
                        <a href="javascript:" class="iconFont">部门 <i>&#xe60e;</i></a>
                        <ul class=" t-sort none">
                            <li><a href="">设计部</a></li>
                            <li><a href="">研发部</a></li>
                            <li><a href="">销售部</a></li>
                            <li><a href="">市场部</a></li>
                            <li><a href="">策划部</a></li>
                        </ul>
                    </th>
                    <th class=""><a href="" class="iconFont">职位<i>&#xe60e;</i></a></th>
                    <th class=" b-td-hide"><a href="">电话</a></th>
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th>
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                <tr class="b-no-bor">
                    <td></td>
                </tr>
                <tr>
                    <td class="b-phone-w">
                        <input type="checkbox" id="box1">
                        <label for="box1" class="iconFont"><i>&#xe7de;</i></label>
                    </td>
                    <td class="b-phone-w2">xm12t1008</td>
                    <td class="td-img"><a href=""><img src="image/icon12.png" alt="" width="56" height="65"></a></td>
                    <td class="">设计部</td>
                    <td class="">前端</td>
                    <td class="b-td-hide">13215221020</td>
                    <td class="b-td-icon b-td-hide tj-icon">
                        <a href=""><i class="iconFont">&#xe921;</i></a>
                        <a href="javascript:" data-toggle="modal" data-target=".bs3"><i class="iconFont">&#xe6d3;</i></a>
                    </td>
                    <td class=" b-td-show add-icon" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a></td>
                </tr>
                <tr class="td-icon-hide none" id="firmIcon">
                    <td>  <a href=""></a></td>
                    <td id="look">  <a  href=""><i class="iconFont">&#xe613;</i></a></td>
                    <td>  <a href=""><i class="iconFont">&#xe67d;</i></a></td>
                    <td>  <a href=""><i class="iconFont">&#xe921;</i></a></td>
                    <td>  <a href="javascript:" data-toggle="modal" data-target=".bs3"><i class="iconFont">&#xe6d3;</i></a></td>
                    <td>  <a href=""></a></td>

                </tr>

                </tbody>
            </table>
            <p class="add-btn">
                <button>确认添加</button>
                <button>取消添加</button>
            </p>
        </div>

    </div>
@stop
<!-- 确认删除吗modal -->
<div class="modal fade bs3" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal1 modal3">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <p><i class="iconFont">&#xe604;</i>确认彻底删除所选联系人吗？</p>
            </div>
            <div class="modal-footer">
                <input type="submit" value="添加">
                <input type="submit" value="取消">
            </div>
        </div>
    </div>
</div>
<!-- 添加部门员工modal -->
<div class="modal fade bs8" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal1 modal2 modal8">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >添加部门员工</h4>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="modal-address">
                        <p><span>工号 : </span><input type="text"></p>
                        <p><span>照片 : </span><input type="file"></p>
                        <p><span>姓名 : </span><input type="text"></p>
                        <p><span>职位 : </span><input type="text"></p>
                        <p><span>电话 : </span><input type="text"></p>
                        <p class="m8"><span>备注 : </span><textarea name="" id="" ></textarea></p>
                    </div>
                    <div class="modal-address-img">
                        <img src="image/icon12.png" alt="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" value="添加">
                <input type="submit" value="取消">
            </div>
        </div>
    </div>
</div>