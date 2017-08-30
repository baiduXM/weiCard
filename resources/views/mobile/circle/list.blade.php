@extends('mobile.common.amaze')
@section('title', '人脉圈 列表')
@section('content')
    <div class="add-btn">
        <div class="add1">
            {{--<i> <img src="images/1_04.png" alt=""></i>--}}
            <i> <img src="{{ asset('static/mobile/images/circle/1_04.png') }}" alt=""></i>

            <span>新建人脉圈</span>
        </div>
        <div class="add2 rt">
            <i><img src="{{ asset('static/mobile/images/circle/1_06.png') }}" alt=""></i>
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
                <img src="{{ asset('static/mobile/images/circle/4_03.png') }}" alt="">
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
            <form action="{{ route('circle.ajaxStore') }}" method="post">
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
                    <span class="confirm rt" data-am-modal-confirm>确定</span>
                </div>
            </form>
        </div>
    </div>

    <!--快速加入弹出框-->
    <div class="am-modal-actions" id="add2">
        <div class="modal-content">
            <form action="{{ route('circle.ajaxJoin') }}">
                <h1 class="modal-header"><span>快速加入</span></h1>
                <div class="modal-body">
                    <div class="name tele">
                        <span>请输入圈号</span>
                        <input type="text" name="Circle[code]">
                    </div>
                    <p class="txtRed"></p><!--添加 class='on' 该字段显示-->
                </div>
                <div class="modal-footer">
                    <span class="" data-am-modal-close>取消</span>
                    <span class="confirm rt" data-am-modal-confirm>确定</span>
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
                <img src="{{ asset('static/mobile/images/circle/3_03d_03.png') }}" alt="">
                <p>加入成功</p>
            </div>
        </div>
    </div>
@stop
<!----------引导页----------->

<!--新建人脉圈引导-->
{{--<div class="new  lead ">--}}
{{--<div class="new-title">--}}
{{--<i> <img src="{{ asset('static/mobile/images/circle/1_04.png') }}" alt=""></i>--}}
{{--<span>新建人脉圈</span>--}}
{{--</div>--}}
{{--<img class="new-txt" src="{{ asset('static/mobile/images/circle/5_03.png') }}" alt="">--}}
{{--<div class="new-btn">--}}
{{--<a class="next on" href="javascript:">下一步</a>--}}
{{--<a class="onShow" href="javascript:">不在提醒</a>--}}
{{--</div>--}}
{{--</div>--}}

<!--快速加入圈子引导-->
{{--<div class="quick  lead  hide">--}}
{{--<div class="new-title rt">--}}
{{--<i> <img src="{{ asset('static/mobile/images/circle/1_06.png') }}" alt=""></i>--}}
{{--<span>快速加入圈子</span>--}}
{{--</div>--}}
{{--<img class="quick-txt" src="{{ asset('static/mobile/images/circle/6_03.png') }}" alt="">--}}
{{--<div class="new-btn">--}}
{{--<a class="onShow on" href="javascript:">完成引导</a>--}}
{{--</div>--}}
{{--</div>--}}
@section('javascript')
    @parent
    <script>
        var once = true, _json, _error; // 防止多次触发
        $(function () {
            init();

            $('.confirm').on('touchstart', function () { // 表单确认按钮
                // 提交表单内容
                var _form     = $(this).parents('form');
                var _formData = _form.serializeArray();
                var _url      = _form.attr('action');
                // 回调函数
                useAjax('post', _url, _formData);
                // 改变DOM
                console.log(_json);
                if (_error) {
                    showError(_form, _error);
                }
                if (_json) { // 回调成功
                    if (_json.err) { // 错误
                        showError(_form, _json.msg);
                    } else {
                        // 跳转页面
                        location.href = '{{ url('circle') }}' + '/' + _json.data.id;
                        // 清空表单字段
                        clearAll();
                    }
                    // 关闭模态框
//                    $('.am-modal-actions').modal('close');
                    // 添加新数据
//                    showHtml(jointDiv(_json.data), '.i-create-content', 'before');
                }


            });

            /* Modal 窗口完全关闭以后触发（CSS 动画执行完成） */
            $('.am-modal-actions').on('closed.modal.amui', function () {
                $('.txtRed').removeClass('on'); // 隐藏错误提示
            });
        });
        /* 初始化数据 */
        function init() {
            // 加载数据
            useAjax('get', '{{ route('circle.ajaxIndex') }}');
            // 显示数据
            $('.i-create').text('(' + _json.data.create.total + ')');
            $('.i-join').text('(' + _json.data.join.total + ')');
            var createData = jointDiv(_json.data.create.data);
            if (createData) { // 有数据的时候隐藏，没有数据的时候显示
                $('.indexImg').addClass('hide');
            }
            showHtml(createData, '.i-create-content', 'init');
            var joinData = jointDiv(_json.data.join.data);
            showHtml(joinData, '.i-join-content', 'init');
        }

        /* 显示数据 */
        function showHtml(_html, _div, _type) {
            if (_type == 'init' || _type == 'refresh') {
                $(_div).html(_html);
            } else if (_type == 'more') {
                $(_div).append(_html);
            } else if (_type == 'before') {
                $(_div).prepend(_html);
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

        /* 清空表单字段 */
        function clearAll() {
            var ipts = document.getElementsByTagName("INPUT");
            for (var i = 0; i < ipts.length; i++) {
                if (ipts[i].type == "text" || ipts[i].type == "hidden" || ipts[i].type == "password") {
                    ipts[i].value = "";
                }
                if (ipts[i].type == "checkbox" || ipts[i].type == "radio") {
                    ipts[i].checked = false;
                }
                if (ipts[i].type == "file") {
                    ipts[i].outerHTML = ipts[i].outerHTML;
                }
            }
            var tas = document.getElementsByTagName("TEXTAREA");
            for (var i = 0; i < tas.length; i++) {
                tas[i].value = "";
            }
            var sts = document.getElementsByTagName("SELECT");
            for (var i = 0; i < sts.length; i++) {
                sts[i].selectedIndex = -1;
            }
        }

        /**
         * 调用ajax
         */
        function useAjax(type, url, data) {
            $.ajax({
                type: type,
                url: url,
                data: data,
                async: false, // 非异步(同步)加载
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                }, // CSRF验证必填
                success: function (data) {
                    _json  = data;
                    _error = '';
                },
                error: function (data) {
                    _json  = '';
                    _error = data.responseJSON;
                }
            });
        }

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