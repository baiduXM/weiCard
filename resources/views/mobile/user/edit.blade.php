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
        <div class="people_tx pa dtc tc vm"><img src="{{ $user->avatar ? asset($user->avatar) : asset('static/mobile/images/tx2.png') }}"></div>
    </div>
    <div class="card_content car_from">
        <form action="{{ url('user') }}" method="post">
            {{ method_field('put') }}
            {{ csrf_field() }}
            <span>姓名：
                <input name="User[nickname]" id="nickname" type="text" class="inputt" placeholder="必填" value="{{ old('User.nickname') ? old('User.nickname') : $user->nickname }}" onblur="validateName()">
                @if ($errors->has('User.nickname'))
                    <strong class="pass-error show" style='color:red;font-size:0.5rem;'>{{ $errors->first('User.nickname') }}</strong>
                @endif
            </span>
            <span>手机：
                <input name="User[mobile]" id="mobile" type="text" class="inputt" placeholder="必填" value="{{ old('User.mobile') ? old('User.mobile') : $user->mobile }}" onblur="validatePhone()">
                @if ($errors->has('User.mobile'))
                    <strong class="pass-error show" style='color:red;font-size:0.5rem;'>{{ $errors->first('User.mobile') }}</strong>
                @endif
            </span>            
            <span>邮箱：
                <input name="User[email]" id="email" type="text" class="inputt" placeholder="必填" value="{{ old('User.email') ? old('User.email') : $user->email }}" onblur="validateEmail()">
                @if ($errors->has('User.email'))
                    <strong class="pass-error show" style='color:red;font-size:0.5rem;'>{{ $errors->first('User.email') }}</strong>
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
    <script>
        //验证姓名，必填
        function validateName(){
            var mobile = $('#nickname').val();
            if(mobile){
                $('#nickname').parent().find('strong').remove();
                $('#nickname').parent().css("border",'1px solid #e6e6e6'); 
            }else{
                $('#nickname').parent().find('strong').remove();
                $('#nickname').parent().css("border",'1px solid red');
                $('#nickname').parent().append('<strong style="color:red;font-size:0.5rem;">姓名必填</strong>');
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
                $('#mobile').parent().find('strong').remove();
                $('#mobile').parent().css("border",'1px solid red');
                $('#mobile').parent().append('<strong style="color:red;font-size:0.5rem;">手机号码不正确</strong>');
            }else{
                $('#mobile').parent().find('strong').remove();
                $('#mobile').parent().css("border",'1px solid #e6e6e6');
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
                $('#email').parent().find('strong').remove();
                $('#email').parent().css("border",'1px solid red');
                $('#email').parent().append('<strong style="color:red;font-size:0.5rem;">邮箱不正确</strong>');
            }else{
                $('#email').parent().find('strong').remove();
                $('#email').parent().css("border",'1px solid #e6e6e6');
            }                        
        }
    </script>
@stop

