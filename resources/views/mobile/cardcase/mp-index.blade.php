@extends('mobile.common.amaze')
@section('title', '名片夹')
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
            {{--</a>--}}
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
        <a class="footBtn1 " href="javascript:;" tabindex="-1">编辑</a>
        <a class="rt" href="javascript:;" tabindex="-1" data-am-modal="{target: '#mp-btn2'}">+ 新建分组</a>
    </div>
@stop
@section('modal')
    <!------------弹出框------------->
    <!--编辑弹出框-->
    <div class="am-modal am-modal-confirm mp-btn1 mp-modal mp-modal1" tabindex="-1" id="mp-btn1">
        <div class="am-modal-dialog  ">
            <form action="{{ route('group.update') }}" method="post" id="form-btn1">
                {{ method_field('put') }}
                {{ csrf_field() }}
                <h1 class="modal-header"><span>编辑分组</span></h1>
                <div class="am-modal-bd modal-group-name">
                    <span>名称</span>
                    <input type="text" placeholder="1-12个字符" name="Group[name]" value="">
                    <span class="error-name hidden" style="color: red; font-size: 14px;">错误提示</span>
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm " data-am-modal-confirm>确定</button>
                </div>
                <input type="hidden" name="group_id" value="">
            </form>
        </div>
    </div>
    <!--新建分组弹出框-->
    <div class="am-modal am-modal-confirm mp-btn1 mp-modal mp-modal2" tabindex="-1" id="mp-btn2">
        <div class="am-modal-dialog  ">
            <form action="{{ route('group.store') }}" method="post" id="form-btn2">
                {{ method_field('post') }}
                {{ csrf_field() }}
                <h1 class="modal-header"><span>新建分组</span></h1>
                <div class="am-modal-bd modal-group-name">
                    <span>名称</span>
                    <input type="text" placeholder="1-12个字符" name="Group[name]">
                    <span class="error-name hidden" style="color: red; font-size: 14px;">错误提示</span>
                </div>
                <div class="modal-footer">
                    <button class="mp-close modal5-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm" data-am-modal-confirm>确定</button>
                </div>
            </form>
        </div>
    </div>
    <!--确认删除该分组？弹出框-->
    <div class="am-modal am-modal-confirm mp-modal " tabindex="-1" id="mp-btn3">
        <div class="am-modal-dialog  ">
            <form action="{{ route('group.destroy') }}" method="post" id="form-btn3">
                {{ method_field('delete') }}
                {{ csrf_field() }}
                <div class="am-modal-bd">
                    <p>确认删除该分组？</p>
                </div>
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm" data-am-modal-confirm>确定</button>
                </div>
                <input type="hidden" name="group_id" value="">
            </form>
        </div>
    </div>
    <!--确认不再关注此人？弹出框-->
    <div class="am-modal am-modal-confirm mp-modal " tabindex="-1" id="mp-btn4">
        <div class="am-modal-dialog  ">
            <form action="{{ route('user.unfollow') }}" method="post">
                {{ method_field('post') }}
                {{ csrf_field() }}
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
            <form action="{{ route('cardcase.move') }}" method="post">
                {{ method_field('post') }}
                {{ csrf_field() }}
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
                {{--<input type="hidden" name="group_id" value="">--}}

            </form>
        </div>
    </div>
@stop
@section('javascript')
    @parent
    <script src="{{ asset('static/mobile/js/common.js??v=20170907') }}"></script>
    <script src="{{ asset('static/mobile/js/cardcase/mp-index.js?v=20170907') }}"></script>
    <script>
        $(function () {
            init();

            /*编辑分组*/
            $('#form-btn1').submit(function (e) {
                var data = $(this).serializeArray();
                var rule = checkField('{{ route('group.rules') }}', data);
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

            /* 删除 */
            $(".mp-btn3").click('touchstart', function () {
                var _modal   = $('#mp-btn3');
                var group_id = $(this).parents('.accordion-item').attr('data-group-id');
                _modal.find('[name="group_id"]').val(group_id);
                _modal.modal('toggle');
            });

            /* 取消关注 */
            $(".mp-btn4").click('touchstart', function () {
                var _modal  = $('#mp-btn4');
                var user_id = $(this).parents('.group-list-btn').attr('data-user-id');
                _modal.find('[name="user_id"]').val(user_id);
                _modal.modal('toggle');
            });
            /* 分组 */
            $(".mp-btn5").click('touchstart', function () {
                var _modal   = $('#mp-btn5');
                var user_id  = $(this).parents('.group-list-btn').attr('data-user-id');
                var group_id = $(this).parents('.group-list-btn').attr('data-group-id');
                _modal.find('#num' + group_id).attr('checked', true);
                _modal.find('[name="user_id"]').val(user_id);
                _modal.modal('toggle');
            });

            /* 访问名片 */
            $('.mp-show').on('touchstart', function () {
                var user_id          = $(this).parents('.group-list-btn').attr('data-user-id');
                window.location.href = '{{ url('cardcase/showuser') }}' + '/' + user_id;
            });

            /* 展开分组 */
            $('.accordion-title').on('touchstart', function () {
                var _this    = $(this);
                var count    = _this.children('i').text(); // 成员数
                var group_id = $(this).parent('dl').attr('data-group-id');
                // 判断是否需要加载
                if (count && $('#group' + group_id).children().length != count) {
                    var _user = useAjax('get', '{{ route('cardcase.getFollowerAjax') }}', {'group_id': group_id});
                    showHtml(jointFollower(_user.data), '#group' + group_id, 'refresh');
                    _this.children('i').text(_user.data.length);// 更新成员数
                    console.log('in')
                }
            });
        });

        function init() {
            // 加载分组
            var _json = useAjax('get', '{{ route('cardcase.mpAjax') }}');
            showHtml(jointGroup(_json.data), '.accordion-gapped', 'init'); //
            showHtml(jointGroupModal(_json.data), '#group-modal', 'init'); //
            // 加载成员
            var _user = useAjax('get', '{{ route('cardcase.getFollowerAjax') }}', {'group_id': 0});
            showHtml(jointFollower(_user.data), '#group'+_json.data[0].id, 'init');
        }


    </script>
@stop

