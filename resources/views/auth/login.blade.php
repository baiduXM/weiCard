<!doctype html>
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微名片后台登录</title>
<link rel="stylesheet" href="{{ asset('static/home/css/style.css') }}">
<link rel="stylesheet" href="{{ asset('static/home/css/animate.css') }}" />
<script type="text/javascript" src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}"></script>
{{--<script type="text/javascript" src="{{ asset('static/common/js/jquery-1.11.3.min.js') }}js/jquery.SuperSlide.2.1.1.js"></script>--}}
<script src="js/site.js" type="text/javascript"></script><!--主要是用在实现的效果上 必须要的-->
<script src="js/wow.min.js"></script><!--主要是用在实现的效果上 必须要的-->
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/function.js"></script>
</head>
<body>
  <div class="wrapper">
          <div class="into">
              <p class="w-card">微名片后台登录</p>
              <span>
                 <i class="icon1"></i>帐号:<input value="" class="username" type="username" name="username"/>
              </span>
              <span>
                 <i class="icon2"></i>密码:<input value="" class="password" type="password" name="password">
              </span>
              <input class="dl" type="submit" value="登录">
              <a href="" class="forget">忘记密码？</a>
          </div>
      <div id="footer">
           copyright 厦门易尔通网络科技有限公司 版权所有 
      </div>
  </div>
</body>
</html>