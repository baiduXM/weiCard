@extends('mobile.common.layout')
@section('title', '粉丝列表')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    {{--内容--}}
@show
<body>
<div class="gz_page">
    <div class="gz_head">
        <h2><em>682<img src="{{ asset('static/mobile/images/gzpic.png') }}"></em><span>次</span></h2>
    </div>
    <div id="tabBox1" class="tabBox">
        <div class="hd">
            <ul>
                <li class="on"><a href="#">全部</a></li>
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
                            <div class="wrap_img fl"><img src="{{ asset('static/mobile/images/pic1.png') }}"></div>
                            <div class="gzinfo fl">
                                <h2>揭剑琼 主美</h2>
                                <p>厦门光环信息科技有限公司</p>
                                <span>TA关注了你的名片</span>
                            </div>
                            <div class="wrap_gzzt fr">
                                <div class="gzzt">关注TA</div>
                                <div class="gzzt1 hide"><img src="{{ asset('static/mobile/images/gz1.png') }}"><br>已互关注</div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="clearfix">
                            <div class="wrap_img fl"><img src="{{ asset('static/mobile/images/pic1.png') }}"></div>
                            <div class="gzinfo fl">
                                <h2>揭剑琼 主美</h2>
                                <p>厦门光环信息科技有限公司</p>
                                <span>TA关注了你的名片</span>
                            </div>
                            <div class="wrap_gzzt fr">
                                <div class="gzzt hide">关注TA</div>
                                <div class="gzzt1"><img src="{{ asset('static/mobile/images/gz1.png') }}"><br>已互关注</div>
                            </div>
                        </a>
                    </li>
                    <a href=""><div class="gz_more">加载更多...</div></a>
                    <div class="gz_none">已经到底了</div>
                </ul>
                <ul>
                    <h2 class="gzdate"><em>2017-07-28</em></h2>
                    <li>
                        <a href="#" class="clearfix">
                            <div class="wrap_img fl"><img src="{{ asset('static/mobile/images/pic1.png') }}"></div>
                            <div class="gzinfo fl">
                                <h2>揭剑琼 主美</h2>
                                <p>厦门光环信息科技有限公司</p>
                                <span>TA关注了你的名片</span>
                            </div>
                            <div class="wrap_gzzt fr">
                                <div class="gzzt hide">关注TA</div>
                                <div class="gzzt1"><img src="{{ asset('static/mobile/images/gz1.png') }}"><br>已互关注</div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
