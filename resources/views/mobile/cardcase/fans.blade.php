@extends('mobile.common.layout')
@section('title', '获取名片')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop



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
<title>厦门易尔通网络科技有限公司</title>
<link rel="stylesheet" href="css/public.css" /> 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/TouchSlide.1.1.js"></script>
<script type="text/javascript" src="js/function.js"></script>
<script type="text/javascript">
	window.addEventListener('load', function(){
   setTimeout(function(){ window.scrollTo(0, 1);}, 100);
});//safari浏览器可以通过此代码来隐藏地址栏
</script>
</head>
<body>
<div class="gz_page">
    <div class="gz_head">
         <h2><em>682<img src="images/gzpic.png"></em><span>次</span></h2>
    </div>
    <div id="tabBox1" class="tabBox">
        <div class="hd">
          <ul>
            <li><a href="#">全部</a></li>
            <li><a href="#">未关注</a></li>
            <li><a href="#">已互关注</a></li>
          </ul>
        </div>
        <div class="bd" id="tabBox1-bd">
            <div class="con">
            <ul>
              <h2 class="gzdate"><em>2017-07-28</em></h2>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                          <div class="gzzt1 hide"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt hide">关注TA</div>
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                          <div class="gzzt1 hide"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <h2 class="gzdate"><em>2017-07-28</em></h2>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                          <div class="gzzt1 hide"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt hide">关注TA</div>
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt hide">关注TA</div>
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <h2 class="gzdate"><em>2017-07-28</em></h2>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                          <div class="gzzt1 hide"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt hide">关注TA</div>
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt hide">关注TA</div>
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <div class="gz_more">加载更多...</div>
              <div class="gz_none">已经到底了</div>
            </ul>
            </div>
            <div class="con">
            <ul>
              <h2 class="gzdate"><em>2017-07-28</em></h2>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                      </div>
                  </a>
              </li>
              <h2 class="gzdate"><em>2017-07-28</em></h2>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt">关注TA</div>
                      </div>
                  </a>
              </li>
              <div class="gz_more">加载更多...</div>
              <div class="gz_none">已经到底了</div>
            </ul>
            </div>
            <div class="con">
            <ul>
              <h2 class="gzdate"><em>2017-07-28</em></h2>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <h2 class="gzdate"><em>2017-07-28</em></h2>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt1"><img src="images/gz1.png"><br>已互关注</div>
                      </div>
                  </a>
              </li>
              <li>
                  <a href="#" class="clearfix">
                      <div class="wrap_img fl"><img src="images/pic1.png"></div>
                      <div class="gzinfo fl">
                          <h2>揭剑琼   主美</h2>
                          <p>厦门光环信息科技有限公司</p>
                          <span>TA关注了你的名片</span>
                      </div>
                      <div class="wrap_gzzt fr">
                          <div class="gzzt1"><img src="images/gz1.png"><br></div>
                      </div>
                  </a>
              </li>
              <div class="gz_more">加载更多...</div>
              <div class="gz_none">已经到底了</div>
            </ul>
            </div>
        </div>
      </div>
</div>
</body>
</html>
