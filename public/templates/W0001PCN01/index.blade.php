<!DOCTYPE html>
<html>
<head>
  <meta name="x5-orientation" content="portrait">
  <title>G宝盆--名片</title>
  <meta name="keywords" content="G宝盆--名片" />
  <meta name="description" content="G宝盆--名片" />
  <link rel="shortcut icon" href="{$favicon}" type="image/x-icon" />
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
  <meta name="x5-orientation" content="portrait">
  <link href="{{ asset('templates/'.$template_name.'/css/animate.css') }}" rel="stylesheet">
  <link href="{{ asset('templates/'.$template_name.'/css/css.css') }}" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="{{ asset('templates/'.$template_name.'/js/jquery.min.js') }}"></script>
  <script src="{{ asset('templates/'.$template_name.'/js/TouchSlide.1.1.js') }}"></script>
  <script type="text/javascript" src="{{ asset('templates/'.$template_name.'/js/fontsize.js') }}"></script>
  <script type="text/javascript" src="{{ asset('templates/'.$template_name.'/js/function.js') }}"></script>
  <script type="text/javascript">
    window.addEventListener('load', function(){
     setTimeout(function(){ window.scrollTo(0, 1); }, 100);
  });//safari浏览器可以通过此代码来隐藏地址栏
  </script>
</head>
<body>
<div id="content">
<div class="wrap">
    <img class="headerbg" src="{{ asset('templates/'.$template_name.'/images/bg.png') }}">
    <div class="contentpic">
      <div class="header">
        <a href="" class="back animated fadeInLeftBig go">返回</a>
        <h2 class="slowest flipInX go">{{ $employee->name }}</h2>
        <a href="" class="set animated fadeInRightBig go"></a>
      </div>
      <div class="picinfo">
        <a href="{{'http://'.$server_name.'/cardcase/follow/e-'.$employee->id}}" class="concern fl slower rotateInDownLeft go"></a>
        <div class="portrait fl">
          <div class="div_img animated rotateIn go"><img src="{{'http://'.$server_name.'/'.$company->logo}}"></div>
          <h2 class="wow slowest flipInX go">{{$company->name}}</h2>
          <div class="identification">
            <div class="identification1 slowest fadeInDown go">已认证</div>
            <!-- <div class="identification2 slowest fadeInDown go">未认证</div> -->
          </div>
        </div>
        <a href="javascript:;" class="code fl slowest rotateInDownRight go"></a>
      </div>
    </div>
</div>

  <div class="information">
    <p class="p1 animated fadeInUp go">{{ $employee->title }}</p>
    <a href="tel:{{ $employee->mobile }}"><p class="p2 slow fadeInUp go">{{ $employee->mobile }}</p></a>
    <p class="p3 slower fadeInUp go">{{$company->email}}</p>
    <p class="p4 slowest fadeInUp go">{{ $company->address }}</p>
  </div>
  <div class="information inforend">
    <div class="pp animated fadeInUp go">
      <h2>公司简介</h2>
      <span>{{ $company->description }}</span></div>

  </div>
<div class="footer">
  <a href="javascript:;" class="tel same animated fadeInLeftBig go">一键拨号</a>
  <a href="{{'http://'.$server_name.'/cardcase'}}" class="name same slow fadeInLeftBig go">名片夹</a>
  <a href="{{'http://'.$server_name.'/cardcase/follow/e-'.$employee->id}}" class="follow same slower fadeInRightBig go">关注</a>
  <a href="" class="share same slowest fadeInRightBig go fxBtn">分享</a>
</div>
</div>
</body>
<div class="mask"></div>
<div class="call titlerer flip go">
  <div class="img1 slowest tada go"><img src="{{ asset('templates/'.$template_name.'/images/tel.png') }}"></div>
  <h2>手机</h2>
  <a href="tel:{{ $employee->mobile }}"><p class="p">{{ $employee->mobile }}<em class="slower wobble go"></em></p></a>
  <!-- <p class="p">18759975489<em class="slower wobble go"></em></p> -->
  <!-- <p class="p">18759975489<em class="slower wobble go"></em></p> -->
  <div class="close"><em class="slowest wobble go"></em></div>
</div>
<div class="call1 animated flip go">
  <div class="wrap_code">
    <div class="list">
      <h2>长按二维码保存到手机通讯录</h2>
      <div class="img1"><img src="{{ $mpqrcodeurl }}"></div>
    </div>
    <div class="card">
      <h2>长按二维码收藏我的移动名片</h2>
      <div class="img1"><img src="{{ $qrcodeurl }}"></div>
    </div>
  </div>
  <div class="tab"><a href="javascript:;" class="li1 on"><em>通讯录</em></a><a href="javascript:;" class="ca1"><em>名片</em></a></div>
  <h2>点击图标可切换对应的二维码</h2>
  <div class="img2 slowest tada go"><img src="{{ asset('templates/'.$template_name.'/images/c2.png') }}"></div>
  <div class="close"><em></em></div>
</div>
<div id="fenxiang">
  <img src="{{ asset('templates/'.$template_name.'/images/fenxiang.png') }}" alt="分享提示图">
  <p>点击右上角按钮，分享给朋友</p>
  <span class="fxClose">[关闭]</span>
</div>
</html>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script>
    wx.config({
        debug: false,
        appId: '{{ $AppID }}',
        timestamp: "{{ $timestamp }}",
        nonceStr: '{{ $noncestr }}',
        signature: '{{ $signature }}',
        jsApiList: [
            'onMenuShareTimeline',
            'onMenuShareAppMessage'
        ]
    });
    wx.ready(function () {

        wx.onMenuShareTimeline({
            title: 'G宝盆-名片', // 分享标题
            link: '{{'http://'.$server_name.'/cardview?com='.$employee->company_id}}&&emp={{$employee->id}}', // 分享链接
            imgUrl: '{{'http://'.$server_name.'/'.$company->logo}}', // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        wx.onMenuShareAppMessage({
            title: 'G宝盆-名片', // 分享标题
            desc: '{{ $employee->name }}', // 分享描述
            link: '{{'http://'.$server_name.'/cardview?com='.$employee->company_id}}&&emp={{$employee->id}}', // 分享链接
            imgUrl: '{{'http://'.$server_name.'/'.$company->logo}}', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

    });

</script>