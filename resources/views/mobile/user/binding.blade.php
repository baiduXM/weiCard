@extends('mobile.common.layout')
@section('title', '获取名片')
@section('content')
    <div id="content2">
        {{--<div class="header2">--}}
        {{--<a href="" class="back animated fadeInLeftBig go"></a>--}}
        {{--<h2 class="slowest flipInX go">获取名片</h2>--}}
        {{--</div>--}}
        <div class="content2">
            <div class="img1"><img src="{{ asset('static/mobile/images/binding.png') }}"></div>
            <h2 class="title1">当前尚无企业名片</h2>
            <em class="success display"></em>
            <input type="text" value="输入名片码" name="code" class="txt1">
            <input type="submit" value="立即获取" class="submit-btn btn1">
        </div>
        <div class="copyright1 animated fadeInDown go">
            <p>copyright© 厦门易尔通网络科技有限公司 版权所有</p>
        </div>
    </div>
    <div class="mask1"></div>
@stop
@section('javascript')
    <script>
        $(function () {
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
                            $(".success").addClass("display");
                        }
                    });
                });
            });
        });
    </script>
@stop