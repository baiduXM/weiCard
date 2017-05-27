@extends('home.common.layout')
@section('title', '用户')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('user.edit') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a>个人信息</a>
            </li>
        </ul><!--tab标签-->
        <div class="myCard-content  main-cont">
            <p class="phone-show">个人信息</p>
            <form action="{{ url('user') }}" class="lt" method="post" enctype="multipart/form-data">
                {{ method_field('put') }}
                {{ csrf_field() }}

                <div class="file-img rt  col-sm-12">
                    <img src="{{ $user->avatar ? asset($user->avatar) : asset('static/home/images/avatar.jpg') }}"
                         alt="">
                </div>
                <div class="input rt ">

                    <div>
                        <span>用户名: </span>
                        <input type="text" name="User[name]" placeholder="英文或数字"
                               value="{{ old('User.name') ? old('User.name') : $user->name }}" readonly>
                    </div>
                    @if ($errors->has('User.name'))
                        <p class="pass-error show">{{ $errors->first('User.name') }}</p>
                    @endif

                    <div>
                        <span>姓名: </span>
                        <input type="text" name="User[nickname]" placeholder="中文姓名"
                               value="{{ old('User.nickname') ? old('User.nickname') : $user->nickname }}">
                    </div>
                    @if ($errors->has('User.nickname'))
                        <p class="pass-error show">{{ $errors->first('User.nickname') }}</p>
                    @endif

                    <div>
                        <span>邮箱: </span>
                        <input type="text" name="User[email]" placeholder="个人邮箱"
                               value="{{ old('User.email') ? old('User.email') : $user->email }}">
                    </div>
                    @if ($errors->has('User.email'))
                        <p class="pass-error show">{{ $errors->first('User.email') }}</p>
                    @endif

                    <div>
                        <span>手机: </span>
                        <input type="text" name="User[mobile]" placeholder="11位数字"
                               value="{{ old('User.mobile') ? old('User.mobile') : $user->mobile }}">
                    </div>
                    @if ($errors->has('User.mobile'))
                        <p class="pass-error show">{{ $errors->first('User.mobile') }}</p>
                    @endif

                    <div>
                        <span>传真: </span>
                        <input type="text" name="User[fax]" placeholder="传真号码"
                               value="{{ old('User.fax') ? old('User.fax') : $user->fax }}">
                    </div>
                    @if ($errors->has('User.fax'))
                        <p class="pass-error show">{{ $errors->first('User.fax') }}</p>
                    @endif

                    <div>
                        <span>地址: </span>
                        <input type="text" name="User[address]" placeholder=""
                               value="{{ old('User.address') ? old('User.address') : $user->address }}">
                    </div>
                    @if ($errors->has('User.address'))
                        <p class="pass-error show">{{ $errors->first('User.address') }}</p>
                    @endif

                    <div>
                        <span>网址: </span>
                        <input type="text" name="User[homepage]" placeholder="个人主页网址"
                               value="{{ old('User.homepage') ? old('User.homepage') : $user->homepage }}">
                    </div>
                    @if ($errors->has('User.homepage'))
                        <p class="pass-error show">{{ $errors->first('User.homepage') }}</p>
                    @endif

                    <div class="file">
                        <span>头像: </span>
                        <input type="file" name="User[avatar]">
                    </div>
                    @if ($errors->has('User.avatar'))
                        <p class="pass-error show">{{ $errors->first('User.avatar') }}</p>
                    @endif

                    <div class="user-j">
                        <span>个性签名: </span>
                        <textarea name="User[description]" >{{ old('User.description') ? old('User.description') : $user->description }}</textarea>
                    </div>
                    @if ($errors->has('User.description'))
                        <p class="pass-error show">{{ $errors->first('User.description') }}</p>
                    @endif

                    <input type="submit" value="确认">
                    <input type="reset" value="重置">
                </div>

            </form>
        </div>
    </div>
@stop