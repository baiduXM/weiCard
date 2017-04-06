@extends('home.common.layout')
@section('title', '公司')
@section('content')
    <div id="myCard">
        <ul class="cont-nav rt">
            <li><a href="">我的公司> </a></li>
            <li class="cont-nav-act"><a href="">注册公司</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">注册公司</a>
            </li>
        </ul>
        <div class="myCard-content  main-cont">
            <p class="phone-show">注册公司</p>
            <form action="" class="lt">
                <div class="file-img rt  col-sm-12">
                    <img src="image/icon12.png" alt="">
                </div>
                <div class="input rt ">
                    <div>
                        <span>公司名称 : </span>
                        <input type="text">
                    </div>
                    <div class="file">
                        <span>logo : </span>
                        <input type="file">
                    </div>
                    <div>
                        <span>地址 : </span>
                        <input type="text">
                    </div>
                    <div>
                        <span>联系电话 : </span>
                        <input type="text">
                    </div>
                    <div class="user-j">
                        <span>公司简介 : </span>
                        <textarea name="" id=""></textarea>
                    </div>
                    <input type="submit" value="确认">
                </div>

            </form>
        </div>
    </div>
@stop
@section('modal-extend')
    <!-- 确认删除吗modal -->
    <div class="modal fade bs3" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal3">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加部门员工</h4>
                </div>
                <div class="modal-body">
                    <form action="">
                        <div class="modal-address">
                            <p><span>工号 : </span><input type="text"></p>
                            <p><span>照片 : </span><input type="file"></p>
                            <p><span>姓名 : </span><input type="text"></p>
                            <p><span>职位 : </span><input type="text"></p>
                            <p><span>电话 : </span><input type="text"></p>
                            <p class="m8"><span>备注 : </span><textarea name="" id=""></textarea></p>
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
@stop

@section('javascript')
    <script>
        $("label").click(function(){
            $(this).children("i").toggleClass("label-bg")
        });
    </script>
@stop
