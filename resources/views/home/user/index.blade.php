@extends('home.common.layout')
@section('title', '名片')
@section('content')
    <div id="myCard">
        <ul class="cont-nav rt">
            <li><a href="">我的名片 > </a></li>
            <li class="cont-nav-act"><a href="">我的名片</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">我的名片</a>
            </li>
        </ul>
        <div class="myCard-content  main-cont">
            <div class="tab-pane card-a">
                <div class="card-cont">
                    <span>我的名片</span>
                    <div class="card-text">
                        <img class="lt" src="image/front-icon.png" alt="">
                        <span>林先生</span>
                        <div>
                            <span>电话 :</span>
                            <input type="text">
                        </div>
                        <div>
                            <span>手机 :</span>
                            <input type="text">
                        </div>
                        <div>
                            <span>地址 :</span>
                            <input type="text">
                        </div>
                    </div>
                </div>
                <div class="card-share">
                    <span class="lt">分享到 : </span>
                    <div class="lt bshare-custom">
                        <div class="bsPromo bsPromo2"></div>
                        <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
                        <a title="分享到微信" class="bshare-weixin"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a>
                        <a title="分享到QQ空间" class="bshare-qzone"></a><a title="更多平台"
                                                                       class="bshare-more bshare-more-icon more-style-addthis"></a>
                    </div>
                    <script type="text/javascript" charset="utf-8"
                            src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
                    <script type="text/javascript" charset="utf-8"
                            src="http://static.bshare.cn/b/bshareC0.js"></script>
                </div>
            </div>
        </div>
    </div>
@stop
