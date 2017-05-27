@extends('mobile.common.layout')
@section('title', '获取名片')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    {{--<div class="card_top">--}}
    {{--<a href="{{ url()->previous() }}" class="back fl"><img--}}
    {{--src="{{ asset('static/mobile/images/back.png') }}"></a><span>获取名片</span>--}}
    {{--</div>--}}
    <div class="card_choose">
        <ul>
            <li class="on"><a href="{{ url('user') }}">个人名片</a></li>
            <li><a href="{{ url('company/employee') }}">企业名片</a></li>
        </ul>
    </div>
    <div class="card_content">
        @if($isComplete)
            <div class="cards pr">
                <a href="{{ url('user/edit') }}" title="修改资料">
                    <img src="{{ asset('static/mobile/images/bg7.png') }}">
                    <div class="cards_tx dtc tc vm pa"><img
                                src="{{ asset($user->avatar) }}"></div>
                    <div class="name pa">• 姓名：{{ $user->nickname }}</div>
                    <div class="tell pa">• 手机：{{ $user->mobile }}</div>
                </a>
            </div>
            <a href="{{ url('cardcase/show/u') }}">
                <div class="choose_card pr">使用这张名片
                    {{--<div class="choose_box pa">已获取成功！</div>--}}
                </div>
            </a>
        @else
            <div class="card_c_we pr"><img src="{{ asset('static/mobile/images/bg2.png') }}">
                <div class="card_c_wephoto pa dtc tc vm"><img src="{{ asset('static/mobile/images/tx1.png') }}"></div>
                <div class="card_c_bt pa"><img src="{{ asset('static/mobile/images/bt.png') }}"></div>
                <div class="card_c_gth pa"><img src="{{ asset('static/mobile/images/gth.png') }}"></div>
            </div>
            <div class="card_c_cjbox">
                <p>* 个人信息不完整！</p>
                <a href="{{ url('user/edit') }}" class="card_c_cj">完善资料</a>
            </div>
        @endif
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

