@extends('mobile.common.layout')
@section('title', '获取名片')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    <div class="card_top">
        <a href="{{ url()->previous() }}" class="back fl"><img src="{{ asset('static/mobile/images/back.png') }}"></a><span>获取名片</span>
    </div>
    <div class="card_choose">
        <ul>
            <li class="on"><a href="{{ url('user') }}">个人名片</a></li>
            <li><a href="{{ url('employee') }}">企业名片</a></li>
        </ul>
    </div>
    <div class="card_content">
        <div class="card_c_we pr"><img src="{{ asset('static/mobile/images/bg2.png') }}">
            <div class="card_c_wephoto pa dtc tc vm"><img src="{{ asset('static/mobile/images/tx1.png') }}"></div>
            <div class="card_c_bt pa"><img src="{{ asset('static/mobile/images/bt.png') }}"></div>
            <div class="card_c_gth pa"><img src="{{ asset('static/mobile/images/gth.png') }}"></div>
        </div>
        <div class="card_c_cjbox">
            <p>* 当前尚无个人名片！</p>
            <a href="{{ url('user/edit') }}" class="card_c_cj">完善资料</a>
        </div>
        <div class="sea_l pa">
            <div class="sea_hl1 pa"><img src="{{ asset('static/mobile/images/hl1.png') }}"></div>
            <div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl2.png') }}"></div>
            <div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl3.png') }}"></div>
        </div>
    </div>
@stop
@section('javascript')
    @parent
    <script src="{{ asset('static/mobile/js/function.js') }}"></script>
@stop

