@extends('mobile.common.layout')
@section('title', '编辑名片')
@section('css')
    {{--@parent--}}
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    {{--<div class="card_top">--}}
        {{--<a href="{{ url()->previous() }}" class="back fl"><img--}}
                    {{--src="{{ asset('static/mobile/images/back.png') }}"></a><span>获取名片</span>--}}
    {{--</div>--}}
    <div class="people pr"><img src="{{ asset('static/mobile/images/bg6.png') }}">
        <a href="{{ url('user/avatar') }}">
        <div class="people_tx pa dtc tc vm"><img src="{{ $user->avatar ? asset($user->avatar) : asset('static/mobile/images/tx2.png') }}"></div>
        <p style="text-align: center;margin-top: 0.3rem; font-size: 0.6rem;color:#000; ">更换头像</p>
        </a>
    </div>
    <div class="card_main">
        <div class="card_content car_from">
            <form action="{{ url('user') }}" method="post" enctype="multipart/form-data">
                {{ method_field('put') }}
                {{ csrf_field() }}
                <span>微信二维码：
                    <a href="{{ url('user/qrcode') }}"id="qrcode" class="inputt" ><strong style="background: #23deff;padding: 0 10px; border-radius: 0.3rem; color: #ffffff; line-height: 1.2rem; height: 1.2rem; margin:0.1rem 0;margin-right: 7px;">更换</strong></a>
                    {{--<a href="{{ url('user/delqrcode') }}" class="del" style="background: #23deff;padding: 0 10px; border-radius: 0.3rem;position: absolute;right: 0; color: #ffffff; line-height: 1.2rem; height: 1.2rem; margin:0.1rem 0;">删除</a>--}}
                    @if ($errors->has('User.qrcode'))
                        <p class="show">{{ $errors->first('User.qrcode') }}</p>
                    @endif
                </span>


                {{--<span>微信二维码：--}}
                    {{--<input type="file" name="User[qrcode]"id="qrcode" class="inputt" style="opacity: 0; position:absolute;"><strong style="background: #23deff;padding: 0 10px; border-radius: 0.3rem; color: #ffffff; line-height: 1.2rem; height: 1.2rem; margin:0.1rem 0;margin-right: 50px;">上传图片</strong>--}}
                    {{--<a href="{{ url('user/delqrcode') }}" class="del" style="background: #23deff;padding: 0 10px; border-radius: 0.3rem;position: absolute;right: 0; color: #ffffff; line-height: 1.2rem; height: 1.2rem; margin:0.1rem 0;">删除</a>--}}
                    {{--@if ($errors->has('User.qrcode'))--}}
                        {{--<p class="show">{{ $errors->first('User.qrcode') }}</p>--}}
                    {{--@endif--}}
                {{--</span>--}}
                <span>姓名：
                    <input name="User[nickname]" id="nickname" type="text" class="inputt" value="{{ old('User.nickname') ? old('User.nickname') : $user->nickname }}" onblur="validateName()">
                    <em>*</em>
                    @if ($errors->has('User.nickname'))
                        <p class="show">{{ $errors->first('User.nickname') }}</p>
                    @endif
                </span>
                <span>手机：
                    <input name="User[mobile]" id="mobile" type="text" class="inputt" value="{{ old('User.mobile') ? old('User.mobile') : $user->mobile }}" onblur="validatePhone()">
                    <em>*</em>
                    @if ($errors->has('User.mobile'))
                        <p class="show">{{ $errors->first('User.mobile') }}</p>
                    @endif
                </span>            
                <span>邮箱：
                    <input name="User[email]" id="email" type="text" class="inputt" value="{{ old('User.email') ? old('User.email') : $user->email }}" onblur="validateEmail()">
                    <em>*</em>
                    @if ($errors->has('User.email'))
                        <p class="show">{{ $errors->first('User.email') }}</p>
                    @endif
                </span>
                <span>地址：
                    <input name="User[address]" id="address" type="text" class="inputt" value="{{ old('User.address') ? old('User.address') : $user->address }}">
                </span>
                {{--<span>主页：--}}
                    {{--<input name="User[homepage]" id="homepage" type="text" class="inputt" value="{{ old('User.homepage') ? old('User.homepage') : $user->homepage }}">--}}
                {{--</span>--}}
                {{--<span>传真：--}}
                    {{--<input name="User[fax]" id="fax" type="text" class="inputt" value="{{ old('User.fax') ? old('User.fax') : $user->fax }}">--}}
                {{--</span>--}}
                <span class="bz">签名：
                    <textarea name="User[description]" id="description" rows="7" wrap="virtual" onfocus="ChangeStyle_hb(this,1,5)"
                              onblur="ChangeStyle_hb(this,2,5)">{{ old('User.description') ? old('User.description') : $user->description }}</textarea>
                </span>
                {{--<span>当前模板：{{$template->display_name}}--}}
                    {{--<strong><a href="{{ url('template/mobile-change') }}">更换<i></i></a></strong>--}}
                {{--</span>--}}
                <input type="submit" class="sub fl transition tj" value="确认提交">
            </form>        
        </div>
    </div>
    {{--<div class="sea_l pa">--}}
        {{--<div class="sea_hl1 pa"><img src="{{ asset('static/mobile/images/hl1.png') }}"></div>--}}
        {{--<div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl2.png') }}"></div>--}}
        {{--<div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl3.png') }}"></div>--}}
    {{--</div>--}}
@stop
@section('javascript')
    {{--@parent--}}
    <script src="{{ asset('static/mobile/js/function_bak.js') }}"></script>
    <script>
        //验证姓名，必填
        function validateName(){
            var nickname = $('#nickname').val();
            if(nickname){
                $('#nickname').parent().find('p').remove();               
            }else{                
                $('#nickname').parent().find('p').remove();
                $('#nickname').parent().append('<p class="show">姓名错误，请重新输入!</p>'); 
            }                     
        }
        //验证手机，必填，11位数
        function validatePhone(){
            var mobile = $('#mobile').val();
            if(mobile){
                var regex = /^\d{11}$/;
                var res = regex.test(mobile);
            }else{
                var res = false;
            }
            if(!res){
                $('#mobile').parent().find('p').remove();
                $('#mobile').parent().append('<p class="show">手机号码错误,请重新输入!</p>');
            }else{
                $('#mobile').parent().find('p').remove();
            }                        
        }
        //验证邮箱，必填，邮箱格式
        function validateEmail(){
            var email = $('#email').val();
            if(email){
                var regex = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
                var res = regex.test(email);
            }else{
                var res = false;
            }
            if(!res){
                $('#email').parent().find('p').remove();
                $('#email').parent().append('<p class="show">邮箱错误，请重新输入!</p>');
            }else{
                $('#email').parent().find('p').remove();
            }                        
        }
    </script>
@stop

