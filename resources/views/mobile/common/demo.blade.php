<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="telephone=no, email=no" name="format-detection">
    <!-- 启用360浏览器的极速模式(webkit) -->
    <meta name="renderer" content="webkit">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
    <meta name="HandheldFriendly" content="true">
    <!-- 微软的老式浏览器 -->
    <meta name="MobileOptimized" content="320">
    <!-- uc强制竖屏 -->
    <meta name="screen-orientation" content="portrait">
    <!-- QQ强制竖屏 -->
    <meta name="x5-orientation" content="portrait">
    <title>G名片案例</title>
    <link rel="stylesheet" href="{{ asset('static/mobile/demo/css/demo.css') }}" />
    <script type="text/javascript" src="{{ asset('static/mobile/demo/js/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('static/mobile/demo/js/function.js') }}"></script>
    <script type="text/javascript">
        window.addEventListener('load', function(){
            setTimeout(function(){ window.scrollTo(0, 1);}, 100);
        });//safari浏览器可以通过此代码来隐藏地址栏
    </script>
</head>
<body>
<div class="main">
    <div class="head pr">
        <p>G名片案例</p>
        <div class="work pa"><img src="{{ asset('static/mobile/demo/images/zhuo.png') }}">
            <div class="computer pa"></div>
        </div>
        <div class="ren pa"><img src="{{ asset('static/mobile/demo/images/ren.png') }}"></div>
    </div>
    <div class="content pr">
        <div class="con_bg pa">
            <div class="linebox">
                <div class="line1 pr"></div>
                <div class="line2 pr"></div>
                <div class="line3 pr"></div>
            </div>
            <div class="linebox linebox2">
                <div class="line1 pr"></div>
                <div class="line2 pr"></div>
                <div class="line3 pr"></div>
            </div>
            <div class="linebox linebox3">
                <div class="line1 pr"></div>
                <div class="line2 pr"></div>
                <div class="line3 pr"></div>
            </div>
            <div class="sanjk pa"><img src="{{ asset('static/mobile/demo/images/k1.png') }}"></div>
            <div class="sanjk sanjk2 pa"><img src="{{ asset('static/mobile/demo/images/k1.png') }}"></div>
            <div class="sanjk sanjk3 pa"><img src="{{ asset('static/mobile/demo/images/k1.png') }}"></div>
        </div>
        <div class="anli">
            <div class="compny compny1 pa"><p>1</p><a href="{{ url('http://mp.gbpen.com/cardview/e-3217') }}"><img src="{{ asset('static/mobile/demo/images/1.JPG') }}"></a></div>
            <div class="compny compny2 pa"><p>2</p><a href="{{ url('http://mp.gbpen.com/cardview/e-3225') }}"><img src="{{ asset('static/mobile/demo/images/2.JPG') }}"></a></div>
            <div class="compny compny3 pa"><p>3</p><a href="{{ url('http://mp.gbpen.com/cardview/e-3233') }}"><img src="{{ asset('static/mobile/demo/images/3.JPG') }}"></a></div>
            <ul>
                <li><span>4</span><a href="{{ url('http://mp.gbpen.com/cardview/e-3218') }}">厦门海腾辉建材有限公司</a></li>
                <li><span>5</span><a href="{{ url('http://mp.gbpen.com/cardview/e-3234') }}">漳浦亿晟绿化苗木有限公司 </a></li>
                <li><span>6</span><a href="{{ url('http://mp.gbpen.com/cardview/e-3219') }}">惠州市宇富电子科技有限公司</a></li>
                <li><span>7</span><a href="{{ url('http://mp.gbpen.com/cardview/e-3235') }}">泉州市隆事达装饰工程有限公司</a></li>
                <li><span>8</span><a href="{{ url('http://mp.gbpen.com/cardview/e-3232') }}">漳州龙文土形生教育咨询有限责任公司</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
