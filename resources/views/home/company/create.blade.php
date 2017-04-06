@extends('home.common.layout')
@section('title', '公司')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.create') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">注册公司</a>
            </li>
        </ul>
        <div class="myCard-content  main-cont">
            <p class="phone-show">注册公司</p>
            <form action="{{ url('company') }}" class="lt" method="post">
                {{ csrf_field() }}

                <div class="input rt">

                    <div>
                        <span><i class="" style="color: red;">*</i>公司名称:</span>
                        <input type="text" name="Company[name]" value="{{ old('Company.name') }}" placeholder="公司名称(至少4字符)">
                    </div>
                    @if ($errors->has('Company.name'))
                        <p class="pass-error show">{{ $errors->first('Company.name') }}</p>
                    @endif

                    <div>
                        <span><i class="" style="color: red;">*</i>公司代码:</span>
                        <input type="text" name="Company[code]" value="{{ old('Company.code') }}" placeholder="唯一代码(字母、数字至少5个字符)">
                    </div>
                    @if ($errors->has('Company.code'))
                        <p class="pass-error show">{{ $errors->first('Company.code') }}</p>
                    @endif

                    <div class="file">
                        <span>图标: </span>
                        <input type="file" name="Company[logo]">
                    </div>
                    @if ($errors->has('Company.logo'))
                        <p class="pass-error show">{{ $errors->first('Company.logo') }}</p>
                    @endif

                    <div>
                        <span>地址: </span>
                        <input type="text" name="Company[address]" value="{{ old('Company.address') }}" placeholder="">
                    </div>
                    @if ($errors->has('Company.address'))
                        <p class="pass-error show">{{ $errors->first('Company.address') }}</p>
                    @endif

                    <div>
                        <span>联系电话: </span>
                        <input type="text" name="Company[telephone]" value="{{ old('Company.telephone') }}" placeholder="">
                    </div>
                    @if ($errors->has('Company.telephone'))
                        <p class="pass-error show">{{ $errors->first('Company.telephone') }}</p>
                    @endif

                    <div class="user-j">
                        <span>公司简介: </span>
                        <textarea name="Company[description]" id=""></textarea>
                    </div>
                    @if ($errors->has('Company.description'))
                        <p class="pass-error show">{{ $errors->first('Company.description') }}</p>
                    @endif

                    <input type="submit" value="确认">
                </div>

            </form>
        </div>
    </div>
@stop

@section('javascript')
    <script>

    </script>
@stop
