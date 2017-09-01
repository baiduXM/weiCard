@extends('mobile.common.amaze')
@section('title', '关注列表')
@section('content')
    <div class="mp-content">
        <div class="mp-bjBox hide">
            <a class="bjBtn" href="javascript:">名片组</a>
            <a class="mp-back rt" href="JavaScript:history.go(-1)">
             <span>
                <i class="iconfont">&#xe600;</i><b>返回</b>
            </span>
            </a>
        </div>
        <div class="mp-group">

            <section class="accordion-gapped">
                <dl class=" accordion-item default-group">
                    <dt class=" accordion-title ">
                        <span> 默认分组</span>
                        <i class="on">12</i>
                    </dt>
                    <dd class=" accordion-bd am-collapse">
                        <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
                        <div class="accordion-content">
                            <div class="group-list">
                                <div class="group-list-mes">
                                    <div class="mes-img"><img src="" alt=""></div>
                                    <div class="mes-data">
                                        <h3>开发人员（null）</h3>
                                        <p>测试测试...</p>
                                        <i>企业</i>
                                    </div>
                                    <div class="mes-gz rt ygz">
                                        <i class="iconfont">&#xe63c;</i>
                                        <span>相互关注</span>
                                    </div>
                                </div>
                                <ul class="group-list-btn">
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe639;</i><span>查看</span></a>
                                    </li>
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe644;</i><span>拨号</span></a>
                                    </li>
                                    <li class="lt" data-am-modal="{target: '#mp-btn5'}"><a href="javascript:"><i
                                                    class="iconfont">&#xe694;</i><span>分组</span></a></li>
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe609;</i><span>取消</span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="group-list">
                                <div class="group-list-mes">
                                    <div class="mes-img"><img src="" alt=""></div>
                                    <div class="mes-data">
                                        <h3>开发人员（null）</h3>
                                        <p>测试测试...</p>
                                        <i>企业</i>
                                    </div>
                                    <div class="mes-gz rt ygz">
                                        <i class="iconfont">&#xe61b;</i>
                                        <span>已关注</span>
                                    </div>
                                </div>
                                <ul class="group-list-btn">
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe639;</i><span>查看</span></a>
                                    </li>
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe644;</i><span>拨号</span></a>
                                    </li>
                                    <li class="lt" data-am-modal="{target: '#mp-btn5'}"><a href="javascript:"><i
                                                    class="iconfont">&#xe694;</i><span>分组</span></a></li>
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe609;</i><span>取消</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl class=" accordion-item custom-group">
                    <b data-am-modal="{target: '#mp-btn3'}"><em class="rt">-</em></b>
                    <dt class=" accordion-title">
                        <span>同事朋友</span>
                        <i class="on">1</i>
                    </dt>
                    <dd class=" accordion-bd am-collapse ">
                        <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
                        <div class="accordion-content">
                            <div class="group-list">
                                <div class="group-list-mes">
                                    <div class="mes-img"><img src="" alt=""></div>
                                    <div class="mes-data">
                                        <h3>开发人员（null）</h3>
                                        <p>测试测试...</p>
                                        <i>企业</i>
                                    </div>
                                    <div class="mes-gz rt ygz">
                                        <i class="iconfont">&#xe61b;</i>
                                        <span>已关注</span>
                                    </div>
                                </div>
                                <ul class="group-list-btn">
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe639;</i><span>查看</span></a>
                                    </li>
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe644;</i><span>拨号</span></a>
                                    </li>
                                    <li class="lt" data-am-modal="{target: '#mp-btn5'}"><a href="javascript:"><i
                                                    class="iconfont">&#xe694;</i><span>分组</span></a></li>
                                    <li class="lt"><a href="javascript:"><i class="iconfont">&#xe609;</i><span>取消</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl class=" accordion-item custom-group">
                    <b data-am-modal="{target: '#mp-btn3'}"><em class="rt">-</em></b>
                    <dt class=" accordion-title">
                        <span>亲戚家庭</span>
                        <i class="on">0</i>
                    </dt>
                    <dd class=" accordion-bd am-collapse ">
                        <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
                        <div class="accordion-content">
                        </div>
                    </dd>
                </dl>
            </section>
            <div class="mp-groupBg"><a href="javascript:"><img src="images/4_03.png" alt=""><span>尚未编建分组</span></a>
            </div>
        </div>
    </div>
    <div class="mp-footBtn">
        <a class="footBtn1 " href="javascript:" tabindex="-1">编辑</a>
        <a class="rt" href="javascript:" tabindex="-1" data-am-modal="{target: '#mp-btn2'}">+ 新建分组</a>
    </div>
@stop
@section('modal')
    <!------------弹出框------------->
    <!--编辑弹出框-->
    <div class="am-modal am-modal-confirm mp-btn1 mp-modal mp-modal1" tabindex="-1" id="mp-btn1">
        <div class="am-modal-dialog  ">
            <form action="">
                <h1 class="modal-header"><span>编辑分组</span></h1>
                <div class="am-modal-bd modal-group-name">
                    <span>名称</span>
                    <input type="text" placeholder="亲朋好友">
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm " data-am-modal-confirm>确定</button>
                </div>
            </form>
        </div>
    </div>
    <!--新建分组弹出框-->
    <div class="am-modal am-modal-confirm mp-btn1 mp-modal mp-modal2" tabindex="-1" id="mp-btn2">
        <div class="am-modal-dialog  ">
            <form action="">
                <h1 class="modal-header"><span>新建分组</span></h1>
                <div class="am-modal-bd modal-group-name">
                    <span>名称</span>
                    <input type="text" placeholder="1-12个字符">
                </div>
                <div class="modal-footer">
                    <button class="mp-close modal5-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm " data-am-modal-confirm>确定</button>
                </div>
            </form>
        </div>
    </div>
    <!--确认删除该分组？弹出框-->
    <div class="am-modal am-modal-confirm   mp-modal " tabindex="-1" id="mp-btn3">
        <div class="am-modal-dialog  ">
            <form action="">

                <div class="am-modal-bd">
                    <p>确认删除该分组？</p>
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <span class="confirm  conRemove">确定</span>
                </div>
            </form>
        </div>
    </div>
    <!--确认不再关注此人？弹出框-->
    <div class="am-modal am-modal-confirm   mp-modal " tabindex="-1" id="mp-btn4">
        <div class="am-modal-dialog  ">
            <form action="">

                <div class="am-modal-bd">
                    <p>确认不再关注此人？</p>
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button class="confirm  conRemove">确定</button>
                </div>
            </form>
        </div>
    </div>
    <!--选择分组弹出框-->
    <div class="am-modal am-modal-confirm   mp-modal mp-modal5  " tabindex="-1" id="mp-btn5">
        <div class="am-modal-dialog  ">
            <form action="">
                <h1 class="modal-header"><span>选择分组</span></h1>
                <div class="am-modal-bd">
                    <ul>
                        <li>
                            <label for="num1">
                                <input type="radio" name="num" id="num1">
                                <span>默认组</span>
                            </label>
                        </li>
                        <li>
                            <label for="num2">
                                <input type="radio" name="num" id="num2">
                                <span>家人亲戚</span>
                            </label>
                        </li>
                        <li>
                            <label for="num3">
                                <input type="radio" name="num" id="num3">
                                <span>同学朋友</span>
                            </label>
                        </li>
                        <li>
                            <label for="num4">
                                <input type="radio" name="num" id="num4">
                                <span>网友</span>
                            </label>
                        </li>
                        <li class="modal5-xj" data-am-modal="{target: '#mp-btn2'}">
                            <span>+ 新建分组</span>
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm " data-am-modal-confirm>确定</button>
                </div>
            </form>
        </div>
    </div>
@stop
@section('javascript')
    @parent
    <script>
        $(function () {
        })
    </script>
@stop

