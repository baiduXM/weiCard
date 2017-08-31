<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title></title>

    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="{{assets}}i/favicon.png">

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="{{assets}}i/app-icon72x72@2x.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
  <link rel="canonical" href="http://www.example.com/">
  -->
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-1.11.3.js"></script>
    <script src="js/amazeui.min.js"></script>
    <script src="js/function.js"></script>
</head>
<body>
<div class="gz-had">
    <span class="gz-back lt"><i class="iconfont">&#xe600;</i>返回</span>
    <div class="gz-num">
        <div class="gz-my current">
            <span><b>3</b>人</span>
            <i>关注我的</i>
        </div>
        <div class="my-gz">
            <span><b>1</b>人</span>
            <i>关注我的</i>
        </div>
    </div>
</div>

<div class="my-btn gzTab">
    <div class="my-found current">
        <span>关注我的</span>
    </div>
    <div class="my-add rt">
        <span>我关注的</span>
    </div>
</div>
<div class="w-content">
    <div class="w-list current">
        <div class="list"><!--关注我的列表数据-->
            <div class="gz-peopleList">
                <p class="gz-time">2017-7-08</p>
                <div class="group-list">
                    <div class="group-list-mes">
                        <div class="mes-img"><img src="" alt=""></div>
                        <div class="mes-data">
                            <h3>王大饼&nbsp;&nbsp;&nbsp;<span>研发人员</span></h3>
                            <p>厦门艾特传媒有限公司</p>
                            <i>企业</i>
                        </div>
                        <div class="mes-gz rt ygz">
                            <i class="iconfont">&#xe63c;</i>
                            <span>相互关注</span>
                        </div>
                    </div>
                </div>
                <div class="group-list">
                    <div class="group-list-mes gz-group">
                        <div class="mes-img"><img src="" alt=""></div>
                        <div class="mes-data">
                            <h3>开发人员（null）</h3>
                            <p>测试测试...</p>
                            <i class="on">企业</i> <b>已分组</b>
                        </div>
                        <div class="mes-gz rt jgz">
                            <i class="iconfont">&#xe610;</i>
                            <span>加关注</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="gz-peopleList">
                <p class="gz-time">2017-7-02</p>
                <div class="group-list">
                    <div class="group-list-mes gz-group">
                        <div class="mes-img"><img src="" alt=""></div>
                        <div class="mes-data">
                            <h3>开发人员（null）</h3>
                            <p>测试测试...</p>
                            <i>企业</i> <b>未分组</b>
                        </div>
                        <div class="mes-gz rt jgz"   >
                            <i class="iconfont">&#xe610;</i>
                            <span>加关注</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-list">
        <div class="list"><!--我关注的列表数据-->
            <div class="gz-peopleList">
                <p class="gz-time">2017-7-02</p>
                <div class="group-list">
                    <div class="group-list-mes gz-group">
                        <div class="mes-img"><img src="" alt=""></div>
                        <div class="mes-data">
                            <h3>开发人员（null）</h3>
                            <p>测试测试...</p>
                            <i>企业</i> <b>未分组</b>
                        </div>
                        <div class="mes-gz rt jgz">
                            <i class="iconfont">&#xe610;</i>
                            <span>加关注</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="" class="gz-more">查看更多</a>
</div>

<!------------弹出框------------->
<!--确认不再关注此人？弹出框-->
<div class="am-modal am-modal-confirm   mp-modal " tabindex="-1" id="mp-btn4"  >
    <div class="am-modal-dialog  ">
        <form action="">

            <div class="am-modal-bd">
                <p>确认不再关注此人？</p>
            </div>
            <div class="modal-footer">
                <button class="mp-close" data-am-modal-close>取消</button>
                <button  class="confirm  conRemove">确定</button>
            </div>
        </form>
    </div>
</div>
<!--选择分组弹出框-->
<div class="am-modal am-modal-confirm   mp-modal mp-modal5  " tabindex="-1" id="mp-btn5"  >
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
                    <li class="modal5-xj"  data-am-modal="{target: '#mp-btn2'}">
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
<!--新建分组弹出框-->
<div class="am-modal am-modal-confirm mp-btn1 mp-modal mp-modal2" tabindex="-1" id="mp-btn2"  >
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

</body>
</html>