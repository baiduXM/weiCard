@extends('mobile.common.circle')
@section('title', '人脉圈 列表')
@section('content')

    <div class="had">
        <a href="{{ route('circle.index') }}">
            <i class="close"><img src="{{ asset('static/mobile/images/circle/1_03.png') }}" alt=""></i>
        </a>
        <span class="had-name">{{ $circle->name }}</span>
        <b class="share rt"><img src="{{ asset('static/mobile/images/circle/1_05.png') }}" alt=""></b>
    </div>
    <div class="X-box">
        <div class="x-title">
            <h2>{{ $circle->name }}</h2>
            <span>圈号 : 3231F</span>
            <a href="{{ route('circle.destroy',$circle->id) }}">解散该圈子</a>
            <p><i>人数{{ count($circle->users) }}
                    / {{ $circle->limit ? $circle->limit : '∞' }}</i>
                <span>有限期至 : {{ $circle->expired_time ? $circle->expired_time : '永久' }}</span>
            </p>
        </div>
        <div class="x-share rt" data-am-modal="{target: '#T-share'}">
            <span><img src="{{ asset($circle->qrcode_path) }}" alt=""></span>
            <p><img src="{{ asset('static/mobile/images/circle/11_033_03.png') }}" alt=""><i>分享圈子</i></p>
        </div>
    </div>
    <div class="x-description">
        <b>介绍 : </b><span>{{ $circle->description or '暂无介绍' }}</span>
    </div>

    <div class="X-content">
        <form action="" method="">
            <div class="x-cont-had">{{--标题--}}
                <a href=""><input type="checkbox"></a>
                <span>未关注的</span>
                <div class="bianji rt">
                    <a href="javascript:">
                        <img src="{{ asset('static/mobile/images/circle/11_03.png') }}" alt="">
                        <span>编辑</span>
                    </a>
                </div>
            </div>
            <div class="myCont">{{--创建人信息--}}
                <dl>
                    <dt><img src=" " alt=""></dt>
                    <dd>
                        <span><b>{{ $circle->user->nickname }}</b><i>发起人</i></span>
                        <p>{{ $circle->user->employee ? $circle->user->employee->company->display_name : '暂无未加入公司' }}</p>
                        <p>{{ $circle->user->employee ? $circle->user->employee->positions : '无职务信息' }}</p>
                    </dd>
                </dl>
                <span class="myBtn rt">
            <i>自己</i>
            <a href="{{ route('cardcase.show') }}">查看</a>
                </span>
            </div>
            <div class="x-cont-list">{{--成员信息--}}

                <div class="G-list myCont">
                    <input type="checkbox">
                    <dl>
                        <dt><img src=" " alt=""></dt>
                        <dd>
                            <span><b>陈杰</b> </span>
                            <p>13066239918</p>
                        </dd>
                    </dl>
                    <a class="G-close rt" href="javascript:" data-am-modal=""> × </a>
                    <span class="myBtn rt">
                        <i class="on">已关注</i>
                        <a href="">查看</a>
                    </span>
                </div>
                <div class="G-list myCont">
                    <input type="checkbox">
                    <dl>
                        <dt><img src=" " alt=""></dt>
                        <dd>
                            <span><b>陈杰</b> </span>
                            <p>厦门易尔通网络科技有限公司</p>
                            <p>技术运营中心-产品</p>
                        </dd>
                    </dl>
                    <a class="G-close rt" href="javascript:" data-am-modal=""> × </a>
                    <span class="myBtn rt">
                        <i>未关注</i>
                        <a href="">查看</a>
                    </span>
                </div>
                <div class="G-list myCont">
                    <input type="checkbox">
                    <dl>
                        <dt><img src=" " alt=""></dt>
                        <dd>
                            <span><b>陈杰</b> </span>
                            <p>13066239918</p>
                        </dd>
                    </dl>
                    <a class="G-close rt" href="javascript:" data-am-modal=""> × </a>
                    <span class="myBtn rt">
                        <i class="on">已关注</i>
                        <a href="">查看</a>
                    </span>
                </div>
            </div>
            {{--<p class="G-total">合计 : 12人</p>--}}
            <button type="submit" class="G-btn">
                <img src="{{ asset('static/mobile/images/circle/11xx_03.png') }}" alt="">
                <span>加关注</span>
            </button>
        </form>
    </div>
@stop
@section('modal')
    <!--是否删除弹出框-->
    <div class="am-modal am-modal-confirm  close-modal" tabindex="-1" id="G-close">
        <div class="am-modal-dialog">
            <div class="am-modal-bd">
                <p>是否删除！</p>
            </div>
            <div class="modal-footer">
                <span class=" " data-am-modal-close>取消</span>
                <span class="confirm am-modal-btn" data-am-modal-confirm>确定</span>
            </div>
        </div>
    </div>

    <!--分享弹出框-->
    <div class="am-modal T-share" tabindex="-1" id="T-share">
        <div class="am-modal-dialog">
            <div class="share-txt"><img src="{{ asset('static/mobile/images/circle/8_03.png') }}" alt=""></div>
            <div class="share-ma">
                <i class="onShow"><img src="{{ asset($circle->qrcode_path)  }}" alt=""></i>
                <p>面对面扫二维码加入人脉圈子</p>
                {{--<p>圈号 : <b>3231F</b></p>--}}
            </div>
        </div>
    </div>

@stop

<!----------引导页--------->
<!--分享引导-->
{{--<div class="L-share  lead ">--}}
{{--<img class="s-txt" src="{{ asset('static/mobile/images/circle/9_03d_03.png') }}" alt="">--}}
{{--<div class="new-btn">--}}
{{--<a class="next on" href="javascript:">下一步</a>--}}
{{--<a class="onShow" href="javascript:">不在提醒</a>--}}
{{--</div>--}}
{{--</div>--}}

<!--关注引导-->
{{--<div class="L-focus  lead hide">--}}
{{--<div class="focus-txt onShow"><img src="{{ asset('static/mobile/images/circle/10-_03.png') }}" alt=""></div>--}}
{{--</div>--}}
@section('javascript')
    @parent
    <script>
        var once = true, _json; // 防止多次触发
        $(function () {
            init();
        });
        function init() {
            // 加载数据
            useAjax('get', '{{ route('circle.ajaxShow',$circle->id) }}');
            console.log(_json);
            showHtml(jointDiv(_json.data.users), '.x-cont-list', 'init');

        }


        function jointDiv(data) {
            console.log(data);
            var _html = '';
            $.each(data, function (k, v) {
                _html += '<div class="G-list myCont">';
                _html += '<input type="checkbox">';
                _html += '<dl>';
                _html += '<dt><img src=" " alt=""></dt>';
                _html += '<dd>';
                if (v.employee) { // 企业员工
                    _html += '<span><b>' + v.employee.nickname + '</b> </span>';
                    _html += '<p>' + v.company.display_name + '</p>';
                    _html += '<p>' + v.employee.positions + '</p>';
                } else {
                    _html += '<span><b>' + v.nickname + '</b> </span>';
                    _html += '<p>' + v.mobile + '</p>';
                    _html += '<p>技术运营中心-产品</p>';
                }
                _html += '</dd></dl>';
                _html += '<a class="G-close rt" href="javascript:" data-am-modal=""> × </a>';
                _html += '<span class="myBtn rt">';
                if (v.isFollow) {
                    _html += '<i class="on">已关注</i>';
                } else {
                    _html += '<i>未关注</i>';
                }
                _html += '<a href="">查看</a>';
                _html += '</span>';
                _html += '</div>';
            });
            return _html;
        }

        function showHtml(_html, _div, _type) {
            if (_type == 'init' || _type == 'refresh') {
                $(_div).html(_html);
            } else if (_type == 'more') {
                $(_div).append(_html);
            } else if (_type == 'before') {
                $(_div).prepend(_html);
            }
        }


        /**
         * 调用ajax
         */
        function useAjax(type, url) {
            $.ajax({
                type: type,
                url: url,
                async: false,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }, // CSRF验证必填
                success: function (data) {
                    _json = data;
                    once  = true;
                },
            });
        }
    </script>
@stop
