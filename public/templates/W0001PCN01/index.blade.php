<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="shortcut icon" href="http://mp.soqi.cn/favicon.ico" type="image/x-icon">
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
    <title>厦门易尔通网络科技有限公司</title>
    <link href="{{ asset('templates/'.$template_name.'/css/css.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('templates/'.$template_name.'/css/public.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('templates/'.$template_name.'/css/swiper-3.3.1.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('templates/'.$template_name.'/css/iconfont.css') }}" rel="stylesheet" type="text/css"/>
    <!-- <script src="js/TouchSlide.1.1.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script> -->
    <script type="text/javascript" src="{{ asset('templates/'.$template_name.'/js/jquery-1.9.1.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('templates/'.$template_name.'/js/swiper-3.3.1.jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('templates/'.$template_name.'/js/PerfectLoad.js') }}"></script>
    <script type="text/javascript" src="{{ asset('templates/'.$template_name.'/js/function.js') }}"></script>
    <!-- <script src="js/idangerous.swiper-2.0.min.js"></script>
    <script src="js/idangerous.swiper.3dflow-2.0.js"></script>
    <script src="js/simple-app.js"></script>-->
    <script type="text/javascript">
        window.addEventListener('load', function () {
            setTimeout(function () {
                window.scrollTo(0, 1);
            }, 100);
        });//safari浏览器可以通过此代码来隐藏地址栏
    </script>
</head>
<body>
<div class="body">
    <div class="class page-prev">
        <h1 class="class-top"><span class="class-close">×</span>快速导航</h1>
        <div class="class-m">
            <div class="swiper-container scroll-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <ul class="class-list">
                            <li><a href="index.blade.php">首页</a></li>
                            <li><a href="about.html">关于我们</a></li>
                            <li class="menu_head">
                                <dl class="icon"><span class="icon1">-</span><span class="icon2">+</span></dl>
                                <a href="news.html">新闻中心</a>
                            </li>
                            <li class="menu_body">
                                <dl><a href="#">二级分类</a></dl>
                                <dl><a href="#">二级分类</a></dl>
                                <dl><a href="#">二级分类</a></dl>
                            </li>
                            <li class="menu_head">
                                <dl class="icon"><span class="icon1">-</span><span class="icon2">+</span></dl>
                                <a href="prod.html">产品展示</a>
                            </li>
                            <li class="menu_body">
                                <dl><a href="#">二级分类</a></dl>
                            </li>
                            <li><a href="about.html">企业文化</a></li>
                            <li><a href="about.html">人才招聘</a></li>
                            <li><a href="about.html">联系我们</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap page-active">
        <div class="opacity2"></div>
        <!-- <div class="newsclass">
          <div class="share-con">
            <div class="swiper-container thumbs-cotnainer">
                  <div class="swiper-wrapper">
                  <div class="swiper-slide">
                      <a title="分享到Qzone空间" href="javascript:void(0);" class="qqzone"><img src="icon/kongjian.gif" width="60" height="60"><dt class=" title">Qzone</dt></a>
                  </div>
                  <div class="swiper-slide">
                      <a title="分享到腾讯微博" href="javascript:void(0);"  onclick="postToWb();" class="qqweibo"><img src="icon/tengxun.gif" width="60" height="60"><dt class=" title">腾讯微博</dt></a>
                  </div>
                  <div class="swiper-slide">
                      <a title="分享到百度收藏" href="javascript:void(0);" class="baidusoucang"><img src="icon/baidu.gif" width="60" height="60"><dt class=" title">百度收藏</dt></a>
                  </div>
                  <div class="swiper-slide">
                      <a title="分享到新浪微博" href="javascript:void(0)" class="xinlang"><img src="icon/xinlang.gif" width="60" height="60"><dt class=" title">新浪微博</dt></a>
                  </div>
                  </div>
              </div>
          </div>
          <div class="share-cance">取消</div>
        </div>
        <div class="fixed">
            <ul class=" box" id="box">
            <li><a href="#" id="class"><p class="fix_icon"><img src="icon/1.png" width="33"></p><p class="title">导航</p></a></li>
              <li><a href="#"><p class="fix_icon"><img src="icon/2.png" width="33"></p><p class="title">电话</p></a></li>
            <li><a href="#"><p class="fix_icon"><img src="icon/3.png" width="33"></p><p class="title">短信</p></a></li>
            <li><a href="#"><p class="fix_icon"><img src="icon/4.png" width="33"></p><p class="title">咨询</p></a></li>
            <li><a href="#"><p class="fix_icon"><img src="icon/5.png" width="33"></p><p class="title">地图</p></a></li>
            <li><a href="#" id="share_btn"><p class="fix_icon"><img src="icon/6.png" width="33"></p><p class="title">分享</p></a></li>
          </ul>
        </div> -->
        <!--  <div class="tell-icon display-block"><span class="close">&times;</span><p>服务热线：<i>400-127-808</i></p></div> -->


        <!-- <div class="index-wrap"> -->
        <header class="head">
            <a href="javascript:void(0)" class="btn-menu iconfont"></a>
            <h1 class="ui-elli"><span>GG</span></h1>
        </header>
        <div class="m-wrap">
            <div class="m-infobox">
                <section class="m-infos">
                    <a href="personal.html" class="m-face-box">
                        <div class="m-face iconfont"></div>
                    </a>
                    <div class="m-infos-cont">
                        <div class="m-name ui-elli"><span>{{ $employee->name }}</span></div>
                        <div class="m-post ui-elli"><span>职位：</span>&nbsp;&nbsp;<span>{{ $employee->title }}</span></div>
                    </div>
                </section>
                <section class="m-visitors">
                    <i class="iconfont i-visitor"></i>
                    <div class="m-num">32</div>
                </section>
            </div>
            <div class="m-scroll">
                <div class="m-modbox">
                    <div class="m-modbox-inner">
                        <section class="m-mod fixed">
                            <ul class="m-personalinfo">
                                <li class="fixed">
                                    <i class="iconfont i-qrcode"></i>
                                    <!-- <a href="" class="m-tel">
                                      <i class="iconfont i-tel"></i>
                                      <span>15373426588</span>
                                    </a> -->
                                    <div class="m-tel">
                                        <i class="iconfont i-tel"></i>
                                        <span>{{ $employee->mobile }}</span>
                                    </div>
                                </li>
                                <li>
                                    <span class="m-mail">公司:</span>
                                    <div class="cont">
                                        <div class="ui-elli num">{{$company->name}}</div>
                                    </div>
                                </li>
                            </ul>
                        </section>
                        <section class="m-mod fixed">
                            <div class="m-signature">
                                <h3>邮箱</h3>
                                <div class="m-cont">{{$employee->email}}</div>
                            </div>
                        </section>
                        <section class="m-mod fixed">
                            <div class="m-signature">
                                <h3>地址</h3>
                                <div class="m-cont">{{ $company->address }}</div>
                            </div>
                        </section>
                        {{--
                        <section class="m-mod fixed">
                            <div class="m-signature">
                                <h3>我的签名</h3>
                                <div class="m-cont">测试一下</div>
                            </div>
                        </section>--}}
                    </div>
                </div>
            </div>
        </div>
        <footer class="m-foot flexbox">
            <a href="" class="flex">
                <i class="iconfont i-call"></i>
            </a>
            <a href="" class="flex">
                <i class="iconfont i-map"></i>
            </a>
            <a href="" class="flex">
                <i class="iconfont i-more"></i>
            </a>
            <a href="" class="flex">
                <i class="iconfont i-shop"></i>
            </a>
            <a href="" class="flex">
                <i class="iconfont i-link"></i>
            </a>
        </footer>
        <!-- </div> -->
    </div>
</div>
<div class="pop-coverCodebg flex-center">
    <div class="theme-popcode shape-chrome" id="shape-chrome">
        <h2>名片二维码</h2>
        <div class="theme-popcode-cnt">

            <div class="codebox"><img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data={{ $url }}"></div>
            <p class="text">扫描二维码，访问他的名片</p>
        </div>
        <div class="flex-center theme-popcode-close"><i class="iconfont">&#xe625</i></div>
    </div>
</div>
</body>
</html>
