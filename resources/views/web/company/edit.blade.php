<form action="{{ url('company') }}" class="lt" method="post" enctype="multipart/form-data">
    {{ method_field('put') }}
    {{ csrf_field() }}
    {{--@if ($company->logo)--}}
    <div class="file-img rt  col-sm-12">
        <img src="{{ $company->logo ? asset($company->logo) : asset('static/home/images/company-logo.jpg') }}" alt="">
    </div>
    {{--@endif--}}

    <div class="input rt">
        <div>
            <span><i class="" style="color: red;">*</i>公司名称:</span>
            <input type="text" name="Company[name]" placeholder="公司名称" readonly
                   value="{{ old('Company.name') ? old('Company.name') : $company->name }}">
        </div>
        @if ($errors->has('Company.name'))
            <p class="pass-error show">{{ $errors->first('Company.name') }}</p>
        @endif

        <div>
            <span><i class="" style="color: red;">*</i>显示名称:</span>
            <input type="text" name="Company[display_name]" placeholder="显示名称"
                   value="{{ old('Company.display_name') ? old('Company.display_name') : $company->display_name }}">
        </div>
        @if ($errors->has('Company.display_name'))
            <p class="pass-error show">{{ $errors->first('Company.display_name') }}</p>
        @endif

        <div class="file">
            <span>图标: </span>
            <input type="file" name="Company[logo]">
        </div>
        @if ($errors->has('Company.logo'))
            <p class="pass-error show">{{ $errors->first('Company.logo') }}</p>
        @endif

        {{--
        <div>
            <span>地址: </span>
            <input type="text" name="Company[address]" placeholder=""
                   value="{{ old('Company.address') ? old('Company.address') : $company->address }}">
        </div>
        @if ($errors->has('Company.address'))
            <p class="pass-error show">{{ $errors->first('Company.address') }}</p>
        @endif
        --}}
        <div>
            <span>邮箱: </span>
            <input type="email" name="Company[email]" placeholder=""
                   value="{{ old('Company.email') ? old('Company.email') : $company->email }}">
        </div>
        @if ($errors->has('Company.email'))
            <p class="pass-error show">{{ $errors->first('Company.email') }}</p>
        @endif

        <div>
            <span>联系电话: </span>
            <input type="tel" name="Company[telephone]" placeholder=""
                   value="{{ old('Company.telephone') ? old('Company.telephone') : $company->telephone }}">
        </div>
        @if ($errors->has('Company.telephone'))
            <p class="pass-error show">{{ $errors->first('Company.telephone') }}</p>
        @endif

        <div>
            <span>公司网址: </span>
            <input type="url" name="Company[homepage]" placeholder=""
                   value="{{ old('Company.homepage') ? old('Company.homepage') : $company->homepage }}">

        </div>
        @if ($errors->has('Company.homepage'))
            <p class="pass-error show">{{ $errors->first('Company.homepage') }}</p>
        @endif
        <div class="companyLink">
            <span>是否外链:</span>
            <div class="com">
                @if ($company->is_profilelink=='1')
                    <input class="comLinkInput"  name="Company[is_profilelink]" type="radio" checked="checked"   value="1">开
                @else
                    <input class="comLinkInput"  name="Company[is_profilelink]" type="radio"    value="1">开
                @endif
                @if ($company->is_profilelink=='1')
                    <input class="comLinkInput"  name="Company[is_profilelink]" type="radio"    value="0">关
                @else
                    <input class="comLinkInput"  name="Company[is_profilelink]" type="radio"  checked="checked"  value="0">关
                @endif
                <input type="text" name="Company[profilelink]"class="comLinkInput cardInput"
                       value="{{ old('Company.profilelink') ? old('Company.profilelink') : $company->profilelink }}">
            </div>
            <h6 class="comTap"><span>备注:</span>公司简介外链</h6>
        </div>
        @if ($errors->has('Company.profilelink'))
            <p class="pass-error show">{{ $errors->first('Company.profilelink') }}</p>
        @endif
        <div class="user-j">
            <span>公司简介: </span>
            <textarea name="Company[description]"
                      id="">{{ old('Company.description') ? old('Company.description') : $company->description }}</textarea>
        </div>
        @if ($errors->has('Company.description'))
            <p class="pass-error show">{{ $errors->first('Company.description') }}</p>
        @endif

        <div>
            <span>地址：</span>
            <input id="where" name="Company[address]" type="text" value="{{ old('Company.address') ? old('Company.address') : $company->address }}">
            <input style="width:70px;height:35px;border:1px solid gray"type="button" value="搜索" onClick="sear(document.getElementById('where').value);" />
            <p><输入完地址后，点击搜索，用鼠标在地图上点击定位></p>
            {{--经度：--}}
            <input id="lon" name="Company[coordinate_lng]" type="hidden" value="{{ old('Company.coordinate_lng') ? old('Company.coordinate_lng') : $company->coordinate_lng }}">
            {{--纬度：--}}
            <input id="lat" name="Company[coordinate_lat]" type="hidden" value="{{ old('Company.coordinate_lat') ? old('Company.coordinate_lat') : $company->coordinate_lat }}" >
            <div style="width:600px;height:400px;border:1px solid gray" id="container"></div>
        </div>
        @if ($errors->has('Company.address'))
            <p class="pass-error show">{{ $errors->first('Company.address') }}</p>
        @endif

        <input type="submit" value="更新">
        <input type="reset" value="重置">

    </div>

</form>
{{--百度地图JavaScript API--}}
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
<script src="{{ asset('static/common/js/map.api.js') }}"></script>