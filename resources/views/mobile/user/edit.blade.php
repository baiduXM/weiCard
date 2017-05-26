@extends('mobile.common.layout')
@section('title', '编辑名片')
@section('css')
    {{--@parent--}}
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    <div class="card_top">
        <a href="{{ url()->previous() }}" class="back fl"><img
                    src="{{ asset('static/mobile/images/back.png') }}"></a><span>获取名片</span>
    </div>
    <div class="people pr"><img src="{{ asset('static/mobile/images/bg6.png') }}">
        <div class="people_tx pa dtc tc vm"><img src="{{ asset('static/mobile/images/tx2.png') }}"></div>
    </div>
    <div class="card_content car_from">
        <form action="{{ url('user') }}" method="post">
            {{ method_field('put') }}
            {{ csrf_field() }}
            <span>姓名：
                <input name="display_name" id="display_name" type="text" class="inputt" value="">
            </span>
            <span>手机：
                <input name="mobile" id="mobile" type="text" class="inputt" value="">
            </span>
            <span>邮箱：
                <input name="email" id="email" type="text" class="inputt" value="">
            </span>
            <span>地址：
                <input name="address" id="address" type="text" class="inputt" value="">
            </span>
            <span>主页：
                <input name="homepage" id="homepage" type="text" class="inputt" value="">
            </span>
            <span>传真：
                <input name="fax" id="fax" type="text" class="inputt" value="">
            </span>
            <span class="bz">签名：
                <textarea name="details" id="details" rows="7" wrap="virtual" onfocus="ChangeStyle_hb(this,1,5)"
                          onblur="ChangeStyle_hb(this,2,5)"></textarea>
              </span>
            <input type="submit" class="sub fl transition tj" value="确认提交">
        </form>
        <div class="sea_l pa">
            <div class="sea_hl1 pa"><img src="{{ asset('static/mobile/images/hl1.png') }}"></div>
            <div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl2.png') }}"></div>
            <div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl3.png') }}"></div>
        </div>
    </div>
@stop
@section('javascript')
    {{--@parent--}}
    <script src="{{ asset('static/mobile/js/function.js') }}"></script>
@stop

