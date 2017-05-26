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
        <div class="people_tx pa dtc tc vm"><img src="{{ $user->avatar ? asset($user->avatar) : asset('static/mobile/images/tx2.png') }}"></div>
    </div>
    <div class="card_content car_from">
        <form action="{{ url('user') }}" method="post">
            {{ method_field('put') }}
            {{ csrf_field() }}
            <span>姓名：
                <input name="User[nickname]" id="nickname" type="text" class="inputt" value="{{ old('User.nickname') ? old('User.nickname') : $user->nickname }}">
            </span>
            <span>手机：
                <input name="User[mobile]" id="mobile" type="text" class="inputt" value="{{ old('User.mobile') ? old('User.mobile') : $user->mobile }}">
            </span>
            <span>邮箱：
                <input name="User[email]" id="email" type="text" class="inputt" value="{{ old('User.email') ? old('User.email') : $user->email }}">
            </span>
            <span>地址：
                <input name="User[address]" id="address" type="text" class="inputt" value="{{ old('User.address') ? old('User.address') : $user->address }}">
            </span>
            <span>主页：
                <input name="User[homepage]" id="homepage" type="text" class="inputt" value="{{ old('User.homepage') ? old('User.homepage') : $user->homepage }}">
            </span>
            <span>传真：
                <input name="User[fax]" id="fax" type="text" class="inputt" value="{{ old('User.fax') ? old('User.fax') : $user->fax }}">
            </span>
            <span class="bz">签名：
                <textarea name="User[description]" id="description" rows="7" wrap="virtual" onfocus="ChangeStyle_hb(this,1,5)"
                          onblur="ChangeStyle_hb(this,2,5)">{{ old('User.description') ? old('User.description') : $user->description }}</textarea>
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

