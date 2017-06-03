@extends('home.common.layout')
@section('title', '安全中心')
@section('content')
    <div id="myCard" >
        @section('breadcrumb')
            {!! Breadcrumbs::render('security.password') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href="">修改密码</a>
            </li>
        </ul>
         <form method="post" action="{{ URL('security/postpassword')}}">
             {{csrf_field()}}
        <div class="myCard-content rt-main t-s">
            <div class="sj-cont ">
                <p><span>原密码 : </span><input type="password"name="User[password_o]"></p>
                @if( Session::get('warning'))
                    <h6>{{ Session::get('warning') }}</h6>
                @endif
                <p><span>新密码 : </span><input type="password"name="User[password]"></p>
                <p><span>确认新密码 : </span><input type="password"name="User[password_confirmation]"></p>
                @if ($errors->has('User.password'))
                    <h6>{{ $errors->first('User.password') }}</h6>
                @endif
                <p><span></span><input class="sj-btn" type="submit" value="确认"></p>
            </div>
        </div>
         </form>
    </div>
@stop
