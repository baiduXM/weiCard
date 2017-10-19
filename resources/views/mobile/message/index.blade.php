<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title></title>
    <link href="css/animate.css" rel="stylesheet">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/mes-style.css">
    <script type="text/javascript">
        (function(doc,win){
            var docEl = doc.documentElement,
                resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize' ,
                recalc = function()
                {
                    var clientWidth = docEl.clientWidth;
                    if(!clientWidth) return;
                    if(clientWidth>640){
                        clientWidth=640;
                    }
                    docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
                };
            recalc();
            if(!doc.addEventListener) return;
            win.addEventListener(resizeEvt,recalc,false);
            doc.addEventListener('DOMContentLoaded',recalc,false);
        })(document,window);
    </script>
</head>
<body>
<div class="had">
    <i class="close"><img src="{{ asset('static/message/images/1_04.png') }}" alt=""></i>
    <span class="had-name">我要留言</span>
    {{--<b class="share rt"><img src="images/1_05.png" alt=""></b>--}}
</div>
<div class="want_message">
    <form action="">
        <div class="mes_cont">
            <b>*</b>
            <div class="mes_input">
                <span>主题  </span>
                <input type="text" placeholder="输入您的留言主题">
            </div>
        </div>
        <div class="mes_cont">
            <b>*</b>
            <div class="mes_input">
                <span>姓名  </span>
                <input type="text" placeholder="您的姓名或昵称">
            </div>
        </div>
        <div class="mes_cont">
            <b>*</b>
            <div class="mes_input">
                <span>手机  </span>
                <input type="text" placeholder="请输入您的手机号码">
            </div>
        </div>
        <div class="mes_cont">
            <b></b>
            <div class="mes_input">
                <span>邮箱  </span>
                <input type="text" placeholder="请输入您的邮箱">
            </div>
        </div>
        <div class="mes_cont">
            <b>*</b>
            <div class="mes_input textarea">
                <span>内容  </span>
                <textarea name="" id=""   rows="10" placeholder="请输入您的留言内容"></textarea>
            </div>
        </div>

        <div class="mes_btn">
            <button class="mes_reset">取消</button>
            <button class="mes_sub">提交</button>
            <!--<input type="submit" value="取消" class="mes_reset">-->
            <!--<input type="submit" value=" cc" class="mes_sub">-->
        </div>
    </form>

</div>

<!-- 留言板弹框 -->
<div id="want-mess" class="want-mess qy-mess" >
    <div class="mask"></div>
    <div class="companypage popMiddle animated bounceInDown go" style="top: 80px;">
        <div class="tab-com">
            <div class="companyinfo1">
                <div class="close"><em class="iconfonty slowest wobble go"></em></div>
                <div class="person_picc">
                    <img src="images/3_03d_03.png" alt="">
                    <h2>您的留言已提交成功！</h2>
                </div>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<!-- function 通用js 如有其它js可只行创建js文件-->
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
    window.addEventListener('load', function () {
        setTimeout(function () {
            window.scrollTo(0, 1);
        }, 100);
    });//safari浏览器可以通过此代码来隐藏地址栏
</script>
</body>
</html>