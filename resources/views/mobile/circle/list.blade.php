@extends('mobile.common.amaze')
@section('title', '人脉圈 列表')
@section('content')
    <div class="add-btn">
        <div class="add1">
            {{--<i> <img src="images/1_04.png" alt=""></i>--}}
            <i> <img src="{{ asset('static/mobile/images/amaze/1_04.png') }}" alt=""></i>

            <span>新建人脉圈</span>
        </div>
        <div class="add2 rt">
            <i><img src="{{ asset('static/mobile/images/amaze/1_06.png') }}" alt=""></i>
            <span>快速加入圈子</span>
        </div>
    </div>
    <div class="my-btn myTab">
        <div class="my-found current">
            <span>我创建的 </span><i class="i-create">(0)</i>
        </div>
        <div class="my-add rt">
            <span>我加入的 </span><i class="i-join">(0)</i>
        </div>
    </div>
    <div class="w-content">
        <div class="w-list current">
            <div class="indexImg"><!--有数据的时候隐藏，没有数据的时候显示-->
                <img src="{{ asset('static/mobile/images/amaze/4_03.png') }}" alt="">
                <a class="add1"><span>来创建第一个名片人脉圈 </span> <i>+</i></a>
            </div>
            <div class="list i-create-content"><!--我创建的数据-->

            </div>
            {{--<div class="gz_more" data-url="">加载中...</div>--}}
        </div>
        <div class="w-list">
            <div class="list i-join-content"><!--我加入的数据-->
            </div>
        </div>
        {{--<a href="" class="gz-more">查看更多</a>--}}
    </div>
@stop
@section('modal')
    <!------------弹出框------------->

    <!--新建人脉圈弹出框-->
    <div class="am-modal-actions" id="add1">
        <div class="modal-content">
            <form action="{{ route('circle.store') }}" method="post" id="form-add1">
                {{ method_field('post') }}
                {{ csrf_field() }}
                <h1 class="modal-header"><span>新建人脉圈</span></h1>
                <div class="modal-body">
                    <div class="name">
                        <span>名称</span>
                        <input type="text" name="Circle[name]" placeholder="请输入名片圈名称（必填，20字以内）">
                        <p class="txtRed error-name">错误提示</p><!--添加 class='on' 该字段显示-->
                    </div>
                    <div class="description">
                        <span>圈子介绍</span>
                        <textarea name="Circle[description]" id="" placeholder="请输入简介（100字以内）"></textarea>
                    </div>
                    <div class="num">
                        <span>人数</span>
                        <ul>
                            <li>
                                <label for="num">
                                    <input type="radio" name="Circle[limit]" id="num" value="30" checked>
                                    <i>30人</i>
                                </label>
                            </li>
                            <li>
                                <label for="num2">
                                    <input type="radio" name="Circle[limit]" value="100" id="num2">
                                    <i>100人</i>
                                </label>
                            </li>
                            <li class="li-three">
                                <label for="num3">
                                    <input type="radio" name="Circle[limit]" value="0"
                                           id="num3" {{ Auth::user()->employee ? '' : 'disabled' }}>
                                    <i>无限制（<em>企业会员</em>）</i>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="limited">
                        <span>有限期</span>
                        <ul>
                            <li>
                                <label for="limited">
                                    <input type="radio" name="Circle[expired_time]" value="3" id="limited" checked>
                                    <i>3天</i>
                                </label>
                            </li>
                            <li>
                                <label for="limited2">
                                    <input type="radio" name="Circle[expired_time]" value="7" id="limited2">
                                    <i>7天</i>
                                </label>
                            </li>
                            <li class="li-three">
                                <label for="limited3">
                                    <input type="radio" name="Circle[expired_time]" value="0"
                                           id="limited3" {{ Auth::user()->employee ? '' : 'disabled' }}>
                                    <i>永久（<em>企业会员</em>）</i>
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <span class=" " data-am-modal-close>取消</span>
                    <span class="confirm rt confirm-add1" data-am-modal-confirm>确定</span>
                </div>
            </form>
        </div>
    </div>

    <!--快速加入弹出框-->
    <div class="am-modal-actions" id="add2">
        <div class="modal-content">
            <form action="{{ route('circle.join') }}" method="post" id="form-add2">
                {{ method_field('post') }}
                {{ csrf_field() }}
                <h1 class="modal-header"><span>快速加入</span></h1>
                <div class="modal-body">
                    <div class="name tele">
                        <span>请输入圈号</span>
                        <input type="text" name="Circle[code]" value="">
                    </div>
                    <p class="txtRed"></p><!--添加 class='on' 该字段显示-->
                </div>
                <div class="modal-footer">
                    {{--<button class="mp-close" data-am-modal-close>取消</button>--}}
                    {{--<button type="submit" class="confirm" data-am-modal-confirm>确定</button>--}}
                    <span class="" data-am-modal-close>取消</span>
                    <span class="confirm rt confirm-add2" data-am-modal-confirm>确定</span>
                </div>
            </form>
        </div>
    </div>

    <!--加入成功弹出框-->
    <div class="am-modal am-modal-no-btn add_suc" tabindex="-1" id="add_suc">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">
                <a class="am-close am-close-spin" data-am-modal-close>&times;</a>
            </div>
            <div class="am-modal-bd">
                <img src="{{ asset('static/mobile/images/amaze/3_03d_03.png') }}" alt="">
                <p>加入成功</p>
            </div>
        </div>
    </div>
@stop
<!----------引导页----------->

<!--新建人脉圈引导-->
{{--<div class="new  lead ">--}}
{{--<div class="new-title">--}}
{{--<i> <img src="{{ asset('static/mobile/images/amaze/1_04.png') }}" alt=""></i>--}}
{{--<span>新建人脉圈</span>--}}
{{--</div>--}}
{{--<img class="new-txt" src="{{ asset('static/mobile/images/amaze/5_03.png') }}" alt="">--}}
{{--<div class="new-btn">--}}
{{--<a class="next on" href="javascript:">下一步</a>--}}
{{--<a class="onShow" href="javascript:">不在提醒</a>--}}
{{--</div>--}}
{{--</div>--}}

<!--快速加入圈子引导-->
{{--<div class="quick  lead  hide">--}}
{{--<div class="new-title rt">--}}
{{--<i> <img src="{{ asset('static/mobile/images/amaze/1_06.png') }}" alt=""></i>--}}
{{--<span>快速加入圈子</span>--}}
{{--</div>--}}
{{--<img class="quick-txt" src="{{ asset('static/mobile/images/amaze/6_03.png') }}" alt="">--}}
{{--<div class="new-btn">--}}
{{--<a class="onShow on" href="javascript:">完成引导</a>--}}
{{--</div>--}}
{{--</div>--}}
@section('javascript')
    @parent
    <script>
        var once = true; // 防止多次触发
        $(function () {
            init();

            /* 新建圈子提交 */
            $('.confirm-add1').click('touchstart', function () {
                $(this).parents('form').submit();
            });
            /* 新建圈子 */
            $('#form-add1').submit(function (e) {
                // 验证字段
                var data = $(this).serializeArray();
                var rule = useAjax('post', '{{ route('circle.storeAjax') }}', data)
                if (rule.status == 'error' || rule.err) {
                    e.preventDefault();
                    if (rule.err) {
                        showError($(this), rule.msg);
                    } else {
                        showError($(this), rule.responseJSON);
                    }
                }
            });


            /* 快速加入提交 */
            $('.confirm-add2').click('touchstart', function () {
                $(this).parents('form').submit();
            });
            /* 快速加入圈子 */
            $('#form-add2').submit(function (e) {
                var data = $(this).serializeArray();
                var rule = useAjax('post', '{{ route('circle.joinAjax') }}', data)
                console.log(rule)
                if (rule.status == 'error' || rule.err) {
                    e.preventDefault();
                    if (rule.err) {
                        showError($(this), rule.msg);
                    } else {
                        showError($(this), rule.responseJSON);
                    }
                }
            });

//
//            /* 表单验证 */
//            $('.confirm').click('touchstart', function (e) { // 表单确认按钮
//                // 提交表单内容
//                e.preventDefault();
//                var _form     = $(this).parents('form');
//                var _formData = _form.serializeArray();
//                var _url      = _form.attr('action');
//                // 回调函数
//                var _json     = useAjax('post', _url, _formData);
//                // 改变DOM
//                if (_json.status == 'error' || _json.err) {
//                    if (_json.err) {
//                        showError(_form, _json.msg);
//                    } else {
//                        showError(_form, _json.responseJSON);
//                    }
//                }
//
//            });

            /* Modal 窗口完全关闭以后触发（CSS 动画执行完成） */
            $('.am-modal-actions').on('closed.modal.amui', function () {
                $('.txtRed').removeClass('on'); // 隐藏错误提示
                clearAll();
            });
        });
        /* 初始化数据 */
        function init() {
            // 加载数据
            var _json = useAjax('get', '{{ route('circle.ajaxIndex') }}');
            // 显示数据
            $('.i-create').text('(' + _json.data.create.total + ')');
            $('.i-join').text('(' + _json.data.join.total + ')');
            if (_json.data.create.data) {
                var createData = jointDiv(_json.data.create.data);
                if (createData) { // 有数据的时候隐藏，没有数据的时候显示
                    $('.indexImg').addClass('hide');
                }
                showHtml(createData, '.i-create-content', 'init');
            }
            if (_json.data.create.data) {
                var joinData = jointDiv(_json.data.join.data);
                showHtml(joinData, '.i-join-content', 'init');
            }
        }


        /* 拼接数据 */
        function jointDiv(data) {
            var _html = '';
            if (data.length) {
                $.each(data, function (k, v) {
                    _html += '<div class="list1" data-id="' + v.id + '">';
                    _html += '<a href="' + '{{ url('circle') }}' + '/' + v.id + '">';
                    _html += '<div class="title">';
                    _html += '<h4>' + v.name + '</h4>';
                    _html += '<time>创建于 : ' + v.created_at + '</time>';
                    _html += '</div>';
                    _html += '<div class="list1-rt rt">';
                    if (v.expired_time == null) {
                        _html += '<span>永久</span>';
                    } else {
                        _html += '<span>临时</span>';
                    }
                    if (v.limit == 0) {
                        _html += '<i>' + v.users_num + ' / ∞</i>';
                    } else {
                        _html += '<i>' + v.users_num + ' / ' + v.limit + '</i>';
                    }
                    _html += '</div>';
                    _html += '</a>';
                    _html += '</div>';
                });
            }
            return _html;
        }


        /**
         * 调用ajax
         */
        //        function useAjax(type, url, data) {
        //            $.ajax({
        //                type: type,
        //                url: url,
        //                data: data,
        //                async: false, // 非异步(同步)加载
        //                headers: {
        //                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
        //                }, // CSRF验证必填
        //                success: function (data) {
        //                    _json  = data;
        //                    _error = '';
        //                },
        //                error: function (data) {
        //                    _json  = '';
        //                    _error = data.responseJSON;
        //                }
        //            });
        //        }

        /**
         * 显示错误信息
         *
         * @param scope     当前范围
         * @param data      错误信息
         */
        function showError(scope, data) {
            if (typeof data == 'string') {
                var obj = scope.find('.txtRed');
                obj.addClass('on');
                obj.text(data);
            } else {
                $.each(data, function (i, n) {
                    var obj = scope.find('.error-' + i.split('.')[1]);
                    obj.addClass('on');
                    obj.text(n);
                });
            }
        }
    </script>
@stop
