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

        <div>
            <span>地址: </span>
            <input type="text" name="Company[address]" placeholder=""
                   value="{{ old('Company.address') ? old('Company.address') : $company->address }}">
        </div>
        @if ($errors->has('Company.address'))
            <p class="pass-error show">{{ $errors->first('Company.address') }}</p>
        @endif

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

        <div class="user-j">
            <span>公司简介: </span>
            <textarea name="Company[description]"
                      id="">{{ old('Company.description') ? old('Company.description') : $company->description }}</textarea>
        </div>
        @if ($errors->has('Company.description'))
            <p class="pass-error show">{{ $errors->first('Company.description') }}</p>
        @endif

        <input type="submit" value="确认">
        <input type="reset" value="重置">

    </div>

</form>
