@extends('mobile.common.layout')
@section('title', '获取名片')
@section('content')
<div class="card_main">
    <div id="content2">
        <div class="content2">
            <div class="wrap_c">
                <div class="img1"><img src="{{ asset('static/mobile/images/binding.png') }}"></div>
                <div class="clearfix"></div>
                <h2 class="title1">当前尚无企业名片</h2>
                <em class="success display"></em>
                <input type="text" value="输入名片码" name="code" class="txt1">
                <input type="submit" value="立即获取" class="submit-btn btn1">
                <input type="button" value="完善个人资料" class="edit-btn btn1">
            </div>
        </div>
    </div>
</div>
<div class="sea_l pa">
    <div class="sea_hl1 pa"><img src="{{ asset('static/mobile/images/hl1.png') }}"></div>
    <div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl2.png') }}"></div>
    <div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl3.png') }}"></div>
</div>
@stop
@section('javascript')
    <script>
        $(function () {
            /* 完善个人资料 */
            $(".edit-btn").click(function () {
                window.location.href = "/user/edit";
            });

            /* 获取名片 */
            $(".submit-btn").click(function () {
                var code = $("[name='code']").val();
                $.ajaxSetup({ // 无form表单时
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.post("/user/binding", {code: code}, function (json) {
                    $(".success").text(json.msg);
                    $(".success").removeClass("display");
                    $("input").hide();
                    $(".success").oneTime('2s', function () {
                        if (json.err % 100 == 0) { // 成功
                            window.location.href = "/user";
                        } else {
                            $("input").show();
                            $(".success").text("");
                            $(".success").addClass("display");
                        }
                    });
                });
            });
        });
    </script>
@stop