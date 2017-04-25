<!-- 添加联系人modal -->
<div class="modal fade bs1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content modal1">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加联系人</h4>
            </div>
            <div class="modal-body">
                <form action="">
                    <p><span>姓名 : </span><input type="text"></p>
                    <p><span>电话 : </span><input type="text"></p>
                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" value="添加">
                <input type="reset" data-dismiss="modal" value="取消">
            </div>
        </div>
    </div>
</div>
<!-- 通讯录-查看modal -->
{{--<div class="modal fade bs2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">--}}
    {{--<div class="modal-dialog modal-lg" role="document">--}}
        {{--<div class="modal-content modal1 modal2">--}}
            {{--<div class="modal-header">--}}
                {{--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>--}}
                {{--</button>--}}
                {{--<h4 class="modal-title">通讯录-查看</h4>--}}
            {{--</div>--}}
            {{--<div class="modal-body">--}}
                {{--<form action="">--}}
                    {{--<div class="modal-address">--}}
                        {{--<p><span>姓名 : </span><input type="text"></p>--}}
                        {{--<p><span>固话 : </span><input type="text"></p>--}}
                        {{--<p><span>手机 : </span><input type="text"></p>--}}
                        {{--<p><span>传真 : </span><input type="text"></p>--}}
                        {{--<p><span>邮箱 : </span><input type="text"></p>--}}
                        {{--<p><span> Q Q : </span><input type="text"></p>--}}
                        {{--<p><span>微信 : </span><input type="text"></p>--}}
                    {{--</div>--}}
                    {{--<div class="modal-address-img">--}}
                        {{--<img src="{{ asset('static/home/images/icon12.png') }}" alt="">--}}
                    {{--</div>--}}
                {{--</form>--}}
            {{--</div>--}}
            {{--<div class="modal-footer">--}}
                {{--<input type="submit" value="添加">--}}
                {{--<input type="reset" data-dismiss="modal" value="取消">--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}
<!-- 确认删除吗modal -->
<div class="modal fade bs3" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content modal1 modal3">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p><i class="iconFont">&#xe604;</i>确认彻底删除所选联系人吗？</p>
            </div>
            <div class="modal-footer">
                <input type="submit" value="添加">
                <input type="reset" data-dismiss="modal" value="取消">
            </div>
        </div>
    </div>
</div>
<!-- 添加联系人到分组modal -->
<div class="modal fade bs4" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog " role="document">
        <div class="modal-content modal1 modal4">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加联系人到分组</h4>
            </div>
            <div class="modal-body">
                <form action="">
                    <p>添加“张三”到</p>
                    <div class="add-name">
                        <p><label for="radio1"><input type="radio" name="radio" id="radio1"><span>设计</span></label></p>
                        <p><label for="radio2"><input type="radio" name="radio" id="radio2"><span>研发</span></label></p>
                        <p><label for="radio3"><input type="radio" name="radio" id="radio3"><span>销售</span></label></p>
                        <p><label for="radio4"><input type="radio" name="radio" id="radio4"><span>市场</span></label></p>
                        <p><label for="radio5"><input type="radio" name="radio" id="radio5"><span>策划</span></label></p>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" value="添加">
                <input type="reset" data-dismiss="modal" value="取消">
            </div>
        </div>
    </div>
</div>
<!-- 编辑组联系人-编辑modal -->
<div class="modal fade bs5" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog " role="document">
        <div class="modal-content modal1 modal5">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑组联系人</h4>
            </div>
            <div class="modal-body">
                <form action="">
                    <p><span>姓名 : </span><input type="text"></p>
                    <p><span>固话 : </span><input type="text"></p>
                    <p><span>手机 : </span><input type="text"></p>
                    <p class="remark"><span>备注 : </span><input type="text"></p>
                    <p class="amend">
                        <span>分组 : </span>
                        <span class="set-design">设计
                                    <button type="button" class="close"
                                            data-dismiss="set-design"><span>&times;</span></button></span>
                        <a href="javascript:" data-toggle="modal" data-target=".bs6">修改</a>
                    </p>
                    <p class="set-more"><i class="iconFont">&#xe609;</i><a href="">更多信息 :</a></p>
                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" value="添加">
                <input type="reset" data-dismiss="modal" value="取消">
            </div>
        </div>
    </div>
</div>
<!-- 编辑组联系人-编辑-修改组modal -->
<div class="modal fade bs6" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog " role="document">
        <div class="modal-content modal1 modal4 modal6">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加联系人到分组</h4>
            </div>
            <div class="modal-body modal6-body">
                <form action="">
                    <div class="add-name">
                        <p><label for="radio6-1"><input type="radio" name="radio" id="radio6-1"><span>设计</span></label>
                        </p>
                        <p><label for="radio6-2"><input type="radio" name="radio" id="radio6-2"><span>研发</span></label>
                        </p>
                        <p><label for="radio6-3"><input type="radio" name="radio" id="radio6-3"><span>销售</span></label>
                        </p>
                        <p><label for="radio6-4"><input type="radio" name="radio" id="radio6-4"><span>市场</span></label>
                        </p>
                        <p><label for="radio6-5"><input type="radio" name="radio" id="radio6-5"><span>策划</span></label>
                        </p>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" value="添加">
                <input type="reset" data-dismiss="modal" value="取消">
            </div>
        </div>
    </div>
</div>
<!-- 查看部门员工-设计部工modal -->
<div class="modal fade bs7" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content modal1 modal7">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">查看部门员工-设计部工</h4>
            </div>
            <div class="modal-body">
                <table>
                    <thead>
                    <tr class="active">
                        <th>员工编号</th>
                        <th>员工名称</th>
                        <th>性别</th>
                        <th>籍贯</th>
                        <th class="b-td-hide">入职时间</th>
                        <th class="b-td-hide">工作岗位</th>
                        <th class="b-td-hide">在岗状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>xm12t1008</td>
                        <td>李四</td>
                        <td>男</td>
                        <td>福建</td>
                        <td class="b-td-hide">2017-3-16</td>
                        <td class="b-td-hide">前端</td>
                        <td class="b-td-hide">在职</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer modal-foot">
                <ul class="lt">
                    <li><a href="">当前第 <i>1</i>/3</a></li>
                    <li><a href="">每页10条</a></li>
                    <li><a href="">共24条</a></li>
                </ul>
                <ul class="rt modal-page">
                    <li class="b-td-hide"><a href="">首页</a></li>
                    <li><a href="">上一页</a></li>
                    <li><a href="">下一页</a></li>
                    <li class="b-td-hide"><a href="">末页</a></li>
                    <li class="b-td-hide"><a href="">2</a></li>
                    <li class="modal-ok b-td-hide"><a href="">确认</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- 添加职位modal -->
<div class="modal fade bs9" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content modal1 modal9 modal11">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加职位</h4>
            </div>
            <div class="modal-body">
                <form action="">
                    <p><span>职位名称 : </span><input type="text"></p>
                </form>
            </div>
            <div class="modal-footer">
                <input type="submit" value="保存">
                <input type="reset" data-dismiss="modal" value="取消">
            </div>
        </div>
    </div>
</div>
<!-- 绑定公司/员工modal -->
<div class="modal fade bs10" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content modal1">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">绑定员工</h4>
            </div>
            <form action="user/binding" method="post">
                {{ csrf_field() }}
                <div class="modal-body">
                    <p><span>绑定代码 : </span><input type="text" name="code"></p>
                </div>
                <div class="modal-footer">
                    <input type="submit" value="保存">
                    <input type="reset" data-dismiss="modal" value="取消">
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade hintModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-describedby="myModalContent">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                提示内容
            </div>
            <div class="hidden after-operate" ></div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- 提示模态框.hintModal -->