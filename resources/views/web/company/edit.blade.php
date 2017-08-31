<form action="{{ url('company') }}" class="lt" method="post" enctype="multipart/form-data">
    {{ method_field('put') }}
    {{ csrf_field() }}
    {{--@if ($company->logo)--}}
    <div class="file-img rt  col-sm-12">
        <img src="{{ $company->logo ? asset($company->logo) : asset('static/home/images/company-logo.jpg') }}" alt="">
    </div>
    {{--@endif--}}

    <div class="input rt">
        <div class="file">
            <span>公司图标: </span>
            <input type="file" name="Company[logo]">
        </div>
        @if ($errors->has('Company.logo'))
            <p class="pass-error show">{{ $errors->first('Company.logo') }}</p>
        @endif
        <div>
            <span><i class="" style="color: red;">*</i>公司账号:</span>
            <input type="text" name="Company[name]" placeholder="公司账号" readonly
                   value="{{ old('Company.name') ? old('Company.name') : $company->name }}">
        </div>
        @if ($errors->has('Company.name'))
            <p class="pass-error show">{{ $errors->first('Company.name') }}</p>
        @endif

        <div>
            <span><i class="" style="color: red;">*</i>公司名称:</span>
            <input type="text" name="Company[display_name]" placeholder="公司名称"
                   value="{{ old('Company.display_name') ? old('Company.display_name') : $company->display_name }}">
            @if ($errors->has('Company.display_name'))
                <p class="pass-error show">{{ $errors->first('Company.display_name') }}</>
            @endif
        </div>

        <div>
            <span>公司备注: </span>
            <input type="comment" name="Company[comment]" placeholder=""
                   value="{{ old('Company.comment') ? old('Company.comment') : $company->comment }}">
        </div>
        @if ($errors->has('Company.comment'))
            <p class="pass-error show">{{ $errors->first('Company.comment') }}</p>
        @endif

        <div>
            <span>注册资本: </span>
            <input type="registered_capital" name="Company[registered_capital]" placeholder=""
                   value="{{ old('Company.registered_capital') ? old('Company.registered_capital') : $company->registered_capital }}">
        </div>
        @if ($errors->has('Company.registered_capital'))
            <p class="pass-error show">{{ $errors->first('Company.registered_capital') }}</p>
        @endif

        <div>
            <span>工商注册号: </span>
            <input type="registered_number" name="Company[registered_number]" placeholder=""
                   value="{{ old('Company.registered_number') ? old('Company.registered_number') : $company->registered_number }}">
        </div>
        @if ($errors->has('Company.registered_number'))
            <p class="pass-error show">{{ $errors->first('Company.registered_number') }}</p>
        @endif

        <div>
            <span>税号: </span>
            <input type="taxpayer_number" name="Company[taxpayer_number]" placeholder=""
                   value="{{ old('Company.taxpayer_number') ? old('Company.taxpayer_number') : $company->taxpayer_number }}">
        </div>
        @if ($errors->has('Company.taxpayer_number'))
            <p class="pass-error show">{{ $errors->first('Company.taxpayer_number') }}</p>
        @endif
        <div>
            <span>发票联系电话: </span>
            <input type="invoice_tel" name="Company[invoice_tel]" placeholder=""
                   value="{{ old('Company.invoice_tel') ? old('Company.invoice_tel') : $company->invoice_tel }}">
        </div>
        @if ($errors->has('Company.invoice_tel'))
            <p class="pass-error show">{{ $errors->first('Company.invoice_tel') }}</p>
        @endif
        <div>
            <span>开户银行: </span>
            <input type="bank" name="Company[bank]" placeholder=""
                   value="{{ old('Company.bank') ? old('Company.bank') : $company->bank }}">
        </div>
        @if ($errors->has('Company.bank'))
            <p class="pass-error show">{{ $errors->first('Company.bank') }}</p>
        @endif<div>
            <span>银行账户: </span>
            <input type="bank_account" name="Company[bank_account]" placeholder=""
                   value="{{ old('Company.bank_account') ? old('Company.bank_account') : $company->bank_account }}">
        </div>
        @if ($errors->has('Company.bank_account'))
            <p class="pass-error show">{{ $errors->first('Company.bank_account') }}</p>
        @endif


        <div class="user-j">
            <span>服务范围: </span>
            <textarea name="Company[service_area]"
                      id="">{{ old('Company.service_area') ? old('Company.service_area') : $company->service_area }}</textarea>
        </div>
        @if ($errors->has('Company.service_area'))
            <p class="pass-error show">{{ $errors->first('Company.service_area') }}</p>
        @endif

        <div class="user-j">
            <span>公司简介: </span>
            <textarea name="Company[description]"
                      id="">{{ old('Company.description') ? old('Company.description') : $company->description }}</textarea>
        </div>
        @if ($errors->has('Company.description'))
            <p class="pass-error show">{{ $errors->first('Company.description') }}</p>
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
            <span>公司邮箱: </span>
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
            @if ($errors->has('Company.homepage'))
                <span class="pass-error show">{{ $errors->first('Company.homepage') }}</span>
            @endif

        </div>

        <div>
            <span>简介栏目名: </span>
            <input type="text" name="Company[des_classifyname]" placeholder=""
                   value="{{ old('Company.des_classifyname') ? old('Company.des_classifyname') : $company->des_classifyname }}">
            @if ($errors->has('Company.des_classifyname'))
                <span class="pass-error show">{{ $errors->first('Company.des_classifyname') }}</span>
            @endif

        </div>
        <div>
            <span>产品栏目名: </span>
            <input type="text" name="Company[pro_classifyname]" placeholder=""
                   value="{{ old('Company.pro_classifyname') ? old('Company.pro_classifyname') : $company->pro_classifyname }}">
            @if ($errors->has('Company.pro_classifyname'))
                <span class="pass-error show">{{ $errors->first('Company.pro_classifyname') }}</span>
            @endif

        </div>
        <div>
            <span>分享栏目名: </span>
            <input type="text" name="Company[share_classifyname]" placeholder=""
                   value="{{ old('Company.share_classifyname') ? old('Company.share_classifyname') : $company->share_classifyname }}">
            @if ($errors->has('Company.share_classifyname'))
                <span class="pass-error show">{{ $errors->first('Company.share_classifyname') }}</span>
            @endif

        </div>
        <div>
            <span>导航栏目名: </span>
            <input type="text" name="Company[nav_classifyname]" placeholder=""
                   value="{{ old('Company.nav_classifyname') ? old('Company.nav_classifyname') : $company->nav_classifyname }}">
            @if ($errors->has('Company.nav_classifyname'))
                <span class="pass-error show">{{ $errors->first('Company.nav_classifyname') }}</span>
            @endif

        </div>
        <div>
            <span>信息栏目名: </span>
            <input type="text" name="Company[per_classifyname]" placeholder=""
                   value="{{ old('Company.per_classifyname') ? old('Company.per_classifyname') : $company->per_classifyname }}">
            @if ($errors->has('Company.per_classifyname'))
                <span class="pass-error show">{{ $errors->first('Company.per_classifyname') }}</span>
            @endif

        </div>
        <div class="companyLink">
            <span>简介外链开关:</span>
            <div class="com">
                <input type="text" name="Company[profilelink]" class="comLinkInput cardInput"
                       value="{{ old('Company.profilelink') ? old('Company.profilelink') : $company->profilelink }}">
                @if ($company->is_profilelink=='1')
                    <input class="comLinkInput" name="Company[is_profilelink]" type="radio" checked="checked" value="1">
                    开
                @else
                    <input class="comLinkInput" name="Company[is_profilelink]" type="radio" value="1">开
                @endif
                @if ($company->is_profilelink=='1')
                    <input class="comLinkInput" name="Company[is_profilelink]" type="radio" value="0">关
                @else
                    <input class="comLinkInput" name="Company[is_profilelink]" type="radio" checked="checked" value="0">
                    关
                @endif

            </div>
            {{--<h6 class="comTap"><span>备注:</span>公司简介外链</h6>--}}
        </div>
        @if ($errors->has('Company.profilelink'))
            <p class="pass-error show">{{ $errors->first('Company.profilelink') }}</p>
        @endif
        <div class="companyLink">
            <span>个人名片展示:</span>
            <div class="com">
                @if ($company->is_person=='0')
                    <input class="comLinkInput" name="Company[is_person]" type="radio" checked="checked" value="0">开
                @else
                    <input class="comLinkInput" name="Company[is_person]" type="radio" value="0">开
                @endif
                @if ($company->is_person=='0')
                    <input class="comLinkInput" name="Company[is_person]" type="radio" value="1">关
                @else
                    <input class="comLinkInput" name="Company[is_person]" type="radio" checked="checked" value="1">关
                @endif
            </div>
        </div>


        <div>
            <span>公司地址：</span>
            <input id="where" name="Company[address]" type="text"
                   value="{{ old('Company.address') ? old('Company.address') : $company->address }}">
            <input style="width:70px;height:35px;border:1px solid gray" type="button" value="搜索"
                   onClick="sear(document.getElementById('where').value);"/>
            <p><输入完地址后，点击搜索，用鼠标在地图上点击定位></p>
            {{--经度：--}}
            <input id="lon" name="Company[coordinate_lng]" type="hidden"
                   value="{{ old('Company.coordinate_lng') ? old('Company.coordinate_lng') : $company->coordinate_lng }}">
            {{--纬度：--}}
            <input id="lat" name="Company[coordinate_lat]" type="hidden"
                   value="{{ old('Company.coordinate_lat') ? old('Company.coordinate_lat') : $company->coordinate_lat }}">
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