@extends('mobile.common.layout')
@section('title', '获取名片')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    {{--<div class="card_top">--}}
    {{--<a href="{{ url()->previous() }}" class="back fl"><img--}}
    {{--src="{{ asset('static/mobile/images/back.png') }}"></a><span>获取名片</span>--}}
    {{--</div>--}}
    <div class="card_choose">
        <ul>
            <li><a href="{{ url('user') }}">个人名片</a></li>
            <li class="on"><a href="{{ url('company/employee') }}">企业名片</a></li>
        </ul>
    </div>
    <div class="card_content">
        @if($employee)
            <div class="cards pr"><img src="{{ asset('static/mobile/images/bg9.png') }}">
                <div class="cards_tx dtc tc vm pa"><img
                            src="{{ $employee->avatar ? asset($employee->avatar) : asset('static/mobile/images/qy_tx.png') }}">
                </div>
                <div class="qy_name pa">{{ $employee->company->name }}</br>
                    {{ $employee->nickname }}{{ $employee->position ? '&nbsp;' . $employee->position->name : '' }}
                </div>
            </div>
            <a href="{{ url('cardcase/show/e') }}">
                <div class="choose_card pr">使用这张名片
                    {{--<div class="choose_box pa" name="error-info">已获取成功！</div>--}}
                </div>
            </a>
        @else
            <div class="card_c_we pr"><img src="{{ asset('static/mobile/images/bg22.png') }}">
                <div class="card_c_gth pa"><img src="{{ asset('static/mobile/images/gth.png') }}"></div>
            </div>
            <div class="card_c_cjbox">
                <p class="qy hide">* 当前尚无企业名片！</p>
                <span>
                <input name="code" id="code" type="text" class="inputt" placeholder="输入名片码">
               </span>
                <a href="javascript:;" class="card_c_cj">立即获取</a>
            </div>
        @endif
        <div class="sea_l pa">
            <div class="sea_hl1 pa"><img src="{{ asset('static/mobile/images/hl1.png') }}"></div>
            <div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl2.png') }}"></div>
            <div class="sea_hl2 pa"><img src="{{ asset('static/mobile/images/hl3.png') }}"></div>
        </div>
    </div>
@stop
@section('javascript')
    @parent
    <script src="{{ asset('static/mobile/js/function.js') }}"></script>
    <script>
        $(function () {
            /* 完善个人资料 */
            $(".edit-btn").click(function () {
                window.location.href = "/user/edit";
            });

            /* 获取名片 */
            $(".card_c_cj").click(function () {
                var code = $("[name='code']").val();
                $.ajaxSetup({ // 无form表单时
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.post("/user/binding", {code: code}, function (json) {
                    if (json.err % 100 == 0) { // 成功
                        $(".qy").text(json.msg);
                        $(".qy").removeClass("hide");
                        $(".qy").oneTime('1s', function () {
                            window.location.href = "/company/employee";
                        });
                    } else {
                        $(".qy").text(json.msg);
                        $(".qy").removeClass("hide");
                    }
                });
            });
        });
    </script>
@stop

