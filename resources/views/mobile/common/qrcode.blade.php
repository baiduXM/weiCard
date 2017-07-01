@extends('mobile.common.layout')
@section('title', '关注公众号二维码')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    <div class="pro_wrap">
		<div class="top_imgbg"><img class="img1" src="{{ asset('static/mobile/images/cloud.png') }}"><img class="img2" src="{{ asset('static/mobile/images/clod3.png') }}"><img class="img3" src="{{ asset('static/mobile/images/clod3.png') }}"></div>
	    <div class="pro_code">
	    	<img src="{{ asset('static/mobile/images/procode.png') }}">
	    	<h2>长按二维码关注名片公众号</h2>
	    </div>
	    <div class="pro_way">
	    	<dl>
	    		<dt>获取名片方式</dt>
	    		<dd>1、关注名片公众号<br/>（扫二维码或搜公众号jianzhan12t）</dd>
	    		<dd>2、登录公众号创建名片并完善资料</dd>
	    		<dd>3、创建成功</dd>
	    	</dl>
	    </div>
	</div>
@stop