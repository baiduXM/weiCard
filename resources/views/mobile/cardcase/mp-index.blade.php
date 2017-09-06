@extends('mobile.common.amaze')
@section('title', '关注列表')
@section('css')
    @parent
    <style type="text/css">
        error-text {
            color: red;
        }
    </style>
@stop
@section('content')
    <div class="mp-content">
        <div class="mp-bjBox hide">
            <a class="bjBtn" href="javascript:">名片组</a>
            {{--<a class="mp-back rt" href="JavaScript:history.go(-1)">--}}
            {{--<span>--}}
            {{--<i class="iconfont">&#xe600;</i><b>返回</b>--}}
            {{--</span>--}}
            </a>
        </div>
        <div class="mp-group">
            <section class="accordion-gapped">
            </section>
            {{--<div class="mp-groupBg">--}}
            {{--<a href="javascript:"><img src="{{ asset('static/mobile/images/amaze/4_03.png') }}"--}}
            {{--alt=""><span>尚未编建分组</span></a>--}}
            {{--</div>--}}
        </div>
    </div>
    <div class="mp-footBtn">
        <a class="footBtn1 " href="javascript:" tabindex="-1">编辑</a>
        <a class="rt" href="javascript:" tabindex="-1" data-am-modal="{target: '#mp-btn2'}">+ 新建分组</a>
    </div>
@stop
@section('modal')
    <!------------弹出框------------->
    <!--编辑弹出框-->
    <div class="am-modal am-modal-confirm mp-btn1 mp-modal mp-modal1" tabindex="-1" id="mp-btn1">
        <div class="am-modal-dialog  ">
            {{--            <form action="{{ route('group.updateAjax') }}" method="put" id="form-btn1">--}}
            <form action="{{ route('group.update') }}" method="put" id="form-btn1">
                {{--{{ method_field('put') }}--}}
                {{ csrf_field() }}
                <h1 class="modal-header"><span>编辑分组</span></h1>
                <div class="am-modal-bd modal-group-name">
                    <span>名称</span>
                    <input type="text" placeholder="1-12个字符" name="Group[name]" value="">
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm confirm-btn1" data-am-modal-confirm>确定</button>
                </div>
                <input type="hidden" name="group_id" value="">
            </form>
        </div>
    </div>
    <!--新建分组弹出框-->
    <div class="am-modal am-modal-confirm mp-btn1 mp-modal mp-modal2" tabindex="-1" id="mp-btn2">
        <div class="am-modal-dialog  ">
            {{--            <form action="{{ route('group.storeAjax') }}" method="post" onsubmit="return false;">--}}
            <form action="{{ route('group.store') }}" method="post" id="form-btn2">
                {{--                {{ method_field('put') }}--}}
                {{ csrf_field() }}
                <h1 class="modal-header"><span>新建分组</span></h1>
                <div class="am-modal-bd modal-group-name">
                    <span>名称</span>
                    <input type="text" placeholder="1-12个字符" name="Group[name]">
                    <span class="error-name hidden" style="color: red; font-size: 14px;">错误提示</span>
                </div>
                <div class="modal-footer">
                    <button class="mp-close modal5-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm confirm-btn2" data-am-modal-confirm>确定</button>
                </div>
            </form>
        </div>
    </div>
    <!--确认删除该分组？弹出框-->
    <div class="am-modal am-modal-confirm mp-modal " tabindex="-1" id="mp-btn3">
        <div class="am-modal-dialog  ">
            <form action="{{ route('group.destroyAjax') }}" onsubmit="return false;" method="delete">
                <div class="am-modal-bd">
                    <p>确认删除该分组？</p>
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <span class="confirm conRemove confirm-btn3">确定</span>
                </div>
                <input type="hidden" name="group_id" value="">
            </form>
        </div>
    </div>
    <!--确认不再关注此人？弹出框-->
    <div class="am-modal am-modal-confirm mp-modal " tabindex="-1" id="mp-btn4">
        <div class="am-modal-dialog  ">
            <form action="{{ route('cardcase.unfollowAjax') }}" method="post" onsubmit="return false;">
                <div class="am-modal-bd">
                    <p>确认不再关注此人？</p>
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button class="confirm  conRemove">确定</button>
                </div>
                <input type="hidden" name="user_id" value="">
            </form>
        </div>
    </div>
    <!--选择分组弹出框-->
    <div class="am-modal am-modal-confirm mp-modal mp-modal5" tabindex="-1" id="mp-btn5">
        <div class="am-modal-dialog  ">
            <form action="{{ route('cardcase.moveAjax') }}" method="put" onsubmit="return false;">
                <h1 class="modal-header"><span>选择分组</span></h1>
                <div class="am-modal-bd">
                    <ul id="group-modal">
                    </ul>
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm " data-am-modal-confirm>确定</button>
                </div>
                <input type="hidden" name="user_id" value="">
                <input type="hidden" name="group_id" value="">

            </form>
        </div>
    </div>
@stop
@section('javascript')
    @parent
    <script src="{{ asset('static/mobile/js/common.js') }}"></script>
    <script src="{{ asset('static/mobile/js/cardcase/mp-index.js') }}"></script>

    <script>
        $(function () {
            init();

            /*编辑分组*/
            $('#form-btn1').submit(function (e) {
                var data = $(this).serializeArray();
                var rule = checkField('{{ route('group.rules') }}', data);
                console.log(rule);
                if (rule.status == 'error') { // 验证错误
                    e.preventDefault();
                    showError($(this), rule.responseJSON);
                }
            });

            /* 新建分组提交 */
            $('#form-btn2').submit(function (e) {
                var data = $(this).serializeArray();
                var rule = checkField('{{ route('group.rules') }}', data);
                if (rule.status == 'error') { // 验证错误
                    e.preventDefault();
                    showError($(this), rule.responseJSON);
                }
            });


            $('.confirm-btn1').click('touchstart', function () {
            });

            $('.confirm-btn1').click('touchstart', function () {
            });

            $('.confirm-btn1').click('touchstart', function () {
            });

            /* 访问名片 */
            $('.mp-show').on('touchstart', function () {
                var id               = $(this).parents('.group-list-btn').attr('data-id');
                window.location.href = '{{ url('cardcase/showuser') }}' + '/' + id;
            });

            /* 分组 */
            $('.mp-group-edit').click('touchstart', function () {
                var id       = $(this).parents('.group-list-btn').attr('data-id');
                var group_id = $(this).parents('.group-list-btn').attr('data-group-id');
                var _modal   = $('#mp-btn5');
//                var _modal = $('#mp-btn5').find('[name="group_id"]').val(group_id);
                _modal.children('#num' + group_id).attr('checked', true);
//                console.log(id)
//                console.log(group_id)
                _modal.modal('toggle');
            });
            /* 取消关注 */
            $('.mp-unfollow').on('touchstart', function () {
                var id = $(this).parents('.group-list-btn').attr('data-id');
                alert(id)
            });

            /* 展开分组 */
            $('.accordion-item').on('touchstart', function () {
                var group_id = $(this).attr('data-id');
                // 判断是否需要加载
                var count    = $(this).find('.accordion-title').children('i').text(); // 成员数
                if (count && $('#group' + group_id).children().length != count) {
                    var _user = useAjax('get', '{{ route('cardcase.getFollowerAjax') }}', {'group_id': group_id});
                    showHtml(jointFollower(_user.data), '#group' + group_id, 'refresh');
                    $(this).find('.accordion-title').children('i').text(_user.data.length);// 更新成员数
                    console.log('in')
                }
            });

            /* 模态确认提交 */
//            $('.confirm').click('touchstart', function () {
//                var url    = $(this).parents('form').attr('action');
//                var method = $(this).parents('form').attr('method');
//                var data   = $(this).parents('form').serializeArray();
//                var _json  = useAjax(method, url, data);
////                console.log(typeof _json);
////                console.log(_json);
////                console.log(typeof _json.err);
////                console.log(_json.err);
//                if (typeof _json.err == 'undefined') { // 验证错误
//                    showError(_json);
//                } else {
//                    console.log(2)
//                }
////                if(typeof _json)
//                $(".am-modal ").hide();
//                $(".am-dimmer.am-active").hide();
//            });


            /* 删除 */
            $(".mp-btn3").click('touchstart', function () {
                var _modal   = $('#mp-btn3');
                var url      = '{{ route('group.destroyAjax') }}';
                var group_id = $(this).parents('.accordion-item').attr('data-id');
                _modal.find('form').attr('action', url);
                _modal.find('[name="group_id"]').val(group_id);

//                var _json    = useAjax('delete', url, {'id': group_id});
                _modal.modal('toggle');
//                console.log(_json)
            });

            $('.onAfter').on('touchstart', function () {
                alert(1)
            })

            /* 确认删除 */
            $(".conRemove").click('touchstart', function () {
                var url   = $(this).parents('form').attr('action');
                var data  = $(this).parents('form').serializeArray();
                var _json = useAjax('delete', url, data);
                alert(_json.msg);
                $(".am-modal ").hide();
                $(".am-dimmer.am-active").hide();
                // TODO:刷新分组
                var _group = useAjax('get', '{{ route('cardcase.mpAjax') }}');
                console.log(_group)
                showHtml(jointGroup(_group.data), '.accordion-gapped', 'refresh'); //
            });
        });

        function init() {
            // 加载分组
            var _json = useAjax('get', '{{ route('cardcase.mpAjax') }}');
            showHtml(jointGroup(_json.data), '.accordion-gapped', 'init'); //
            showHtml(jointGroupModal(_json.data), '#group-modal', 'init'); //

            // 加载成员
            var _user = useAjax('get', '{{ route('cardcase.getFollowerAjax') }}', {'group_id': 0});
            showHtml(jointFollower(_user.data), '#group0', 'init');
        }


    </script>
@stop

