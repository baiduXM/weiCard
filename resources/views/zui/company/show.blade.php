<form class="lt">

    {{--@if ($company->logo)--}}
    <div class="file-img rt  col-sm-12">
        <img src="{{ $company->logo ? asset($company->logo) : asset('static/home/images/company-logo.jpg') }}" alt="">
    </div>
    {{--@endif--}}

    <div class="input rt">
        <div>
            <span><i class="" style="color: red;">*</i>公司名称:</span>
            <input type="text" name="Company[name]" value="{{ $company->name }}" disabled>
        </div>

        <div>
            <span><i class="" style="color: red;">*</i>显示名称:</span>
            <input type="text" name="Company[display_name]" value="{{ $company->display_name }}" disabled>
        </div>

        <div>
            <span>地址: </span>
            <input type="text" name="Company[address]" value="{{ $company->address }}" disabled>
        </div>

        <div>
            <span>邮箱: </span>
            <input type="email" name="Company[email]" value="{{ $company->email }}" disabled>
        </div>

        <div>
            <span>联系电话: </span>
            <input type="tel" name="Company[telephone]" value="{{ $company->telephone }}" disabled>
        </div>

        <div class="user-j">
            <span>公司简介: </span>
            <textarea name="Company[description]" id="" disabled>{{ $company->description }}</textarea>
        </div>
    </div>

</form>
