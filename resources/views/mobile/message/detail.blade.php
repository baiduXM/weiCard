<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title></title>
    <link rel="stylesheet" href="{{ asset('static/message/css/mes-style.css') }}">
</head>
<body>
<div class="had">
    <i class="close"><img src="{{ asset('static/message/images/1_04.png') }}" alt=""></i>
    <span class="had-name">留言详情</span>
    <b class="share rt">
        {{--<img src="{{ asset('static/message/images/1_05.png') }}" alt="">--}}
    </b>
</div>
 <div class="mes-content">
     <div class="mes-cont-list">
          <span>主题 :</span>
          <p>{{$message->title}}</p>
     </div>
     <div class="mes-cont-list">
         <span>姓名 :</span>
         <p>{{$message->name}}</p>
     </div>
     <div class="mes-cont-list mes-cont-phone">
         <span>手机 :</span>
         <p>{{$message->phone}}</p>
         <a href="tel:{{ $message->mobile }}"><i class="iconfont rt">&#xe683;</i></a>
     </div>
     <div class="mes-cont-list">
         <span>邮箱 :</span>
         <p>{{$message->email}}</p>
     </div>
     <div class="  mes-cont-txt">
         <p><span>内容 :   </span>{{$message->content}}</p>
     </div>

     {{--<div class="look-mp"><a href="" >看TA名片</a></div>--}}
 </div>
<script type="text/javascript" src="{{ asset('static/message/js/jquery.min.js') }}"></script>
<!-- function 通用js 如有其它js可只行创建js文件-->
<script type="text/javascript" src="{{ asset('static/message/js/common.js') }}"></script>
<script type="text/javascript">
    window.addEventListener('load', function () {
        setTimeout(function () {
            window.scrollTo(0, 1);
        }, 100);
    });//safari浏览器可以通过此代码来隐藏地址栏
</script>
</body>
</html>