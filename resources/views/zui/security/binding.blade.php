@extends('home.common.layout')
@section('title', '安全中心')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('security.binding') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">第三方绑定</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <div class="zh-cont an-cont">
                {{--<a href="{{ url('security/binding/qq') }}" class="{{ $user->oauth_weixin ? 'has' : '' }}"><i class="iconFont lt">&#xe607;</i><span>绑定QQ账号</span></a>--}}
                @if(\Illuminate\Support\Facades\Session::get('is_mobile'))
                    <a data-url="{{ url('security/binding/weixin') }}"
                       class="{{ $user->oauth_weixin ? 'has' : '' }} binding">
                        <i style="margin-top:6px;" class="iconFont lt">&#xe616;</i><span>绑定微信账号</span></a>
                @else
                    <a data-url="{{ url('security/binding/weixinweb') }}"
                       class="{{ $user->oauth_weixin ? 'has' : '' }} binding">
                        <i style="margin-top:6px;" class="iconFont lt">&#xe616;</i><span>绑定微信账号</span></a>
                @endif
                {{--<a href="{{ url('security/binding/weibo') }}" class=""><i class="iconFont lt">&#xe645;</i><span>绑定微博账号</span></a>--}}
                <input class="sj-btn" type="submit" value="确认">
            </div>
        </div>
    </div>
@stop
@section('javascript')
    <script>
        $(function () {
            $('.binding').click(function () {
                if ($(this).hasClass('has')) {
                    alert('已绑定账号');
                } else {
                    var url = $(this).data('url');
                    window.location.href = url;
                }
            });
        });
    </script>
@stop
