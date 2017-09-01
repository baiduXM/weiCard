@extends('mobile.common.amaze')
@section('title', '关注列表')
@section('content')
    <div class="gz-had">
        {{--<span class="gz-back lt"><i class="iconfont">&#xe600;</i>返回</span>--}}
        <div class="gz-num">
            <div class="gz-my current">
                <span><b id="count_num_followed">-</b>人</span>
                <i>关注我的</i>
            </div>
            <div class="my-gz">
                <span><b id="count_num_following">-</b>人</span>
                <i>我关注的</i>
            </div>
        </div>
    </div>
    <div class="my-btn gzTab">
        <div class="my-found {{ isset($params['type']) ? '' : 'current'}}"
             data-url="{{ url('cardcase/fans/followed') }}">
            <span>关注我的</span>
        </div>
        <div class="my-add rt {{ isset($params['type']) && $params['type'] == 'following' ? 'current' : ''}}"
             data-url="{{ url('cardcase/fans/following') }}">
            <span>我关注的</span>
        </div>
    </div>
    <div class="w-content">
        <div class="w-list current">
            <div class="list"><!--关注我的列表数据-->
                <div class="gz-peopleList i-followed">
                    {{--<p class="gz-time">2017-7-08</p>--}}
                    {{--<div class="group-list">--}}
                    {{--<div class="group-list-mes gz-group">--}}
                    {{--<div class="mes-img"><img src="" alt=""></div>--}}
                    {{--<div class="mes-data">--}}
                    {{--<h3>王大饼&nbsp;&nbsp;&nbsp;<span>研发人员</span></h3>--}}
                    {{--<p>厦门艾特传媒有限公司</p>--}}
                    {{--<i>企业</i>--}}
                    {{--</div>--}}
                    {{--<div class="mes-gz rt ygz">--}}
                    {{--<i class="iconfont">&#xe63c;</i>--}}
                    {{--<span>相互关注</span>--}}
                    {{--</div>--}}
                    {{--</div>--}}
                    {{--</div>--}}
                    {{--<div class="group-list">--}}
                    {{--<div class="group-list-mes gz-group">--}}
                    {{--<div class="mes-img"><img src="" alt=""></div>--}}
                    {{--<div class="mes-data">--}}
                    {{--<h3>开发人员（null）</h3>--}}
                    {{--<p>测试测试...</p>--}}
                    {{--<i class="on">企业</i> <b>已分组</b>--}}
                    {{--</div>--}}
                    {{--<div class="mes-gz rt jgz">--}}
                    {{--<i class="iconfont">&#xe610;</i>--}}
                    {{--<span>加关注</span>--}}
                    {{--</div>--}}
                    {{--</div>--}}
                    {{--</div>--}}
                </div>
            </div>
            <a href="javascript:;" class="gz-more more-ed">查看更多</a>
        </div>
        <div class="w-list">
            <div class="list"><!--我关注的列表数据-->
                <div class="gz-peopleList i-following">
                </div>
            </div>
            <a href="javascript:;" class="gz-more more-ing">查看更多</a>
        </div>
    </div>
@stop
@section('modal')
    <!------------弹出框------------->
    <!--确认不再关注此人？弹出框-->
    <div class="am-modal am-modal-confirm   mp-modal " tabindex="-1" id="mp-btn4">
        <div class="am-modal-dialog  ">
            <form action="" onsubmit="return false;">

                <div class="am-modal-bd">
                    <p>确认不再关注此人？</p>
                </div>
                <input type="hidden" name="user_id" value="">
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button class="confirm  conRemove">确定</button>
                </div>
            </form>
        </div>
    </div>
    <!--选择分组弹出框-->
    <div class="am-modal am-modal-confirm   mp-modal mp-modal5  " tabindex="-1" id="mp-btn5">
        <div class="am-modal-dialog  ">
            <form action="" onsubmit="return false;">
                <h1 class="modal-header"><span>选择分组</span></h1>
                <div class="am-modal-bd">
                    <ul>
                        <li>
                            <label for="num0">
                                <input type="radio" name="group_id" id="num0" value="0" checked>
                                <span>默认组</span>
                            </label>
                        </li>
                        @foreach($groups as $item)
                            <li>
                                <label for="num{{ $item->id }}">
                                    <input type="radio" name="group_id" id="num{{ $item->id }}" value="{{ $item->id }}">
                                    <span>{{ $item->name }}</span>
                                </label>
                            </li>

                        @endforeach

                        {{--<li class="modal5-xj" data-am-modal="{target: '#mp-btn2'}">--}}
                        {{--<span>+ 新建分组</span>--}}
                        {{--</li>--}}
                    </ul>
                </div>
                <input type="hidden" name="user_id" value="">
                <div class="modal-footer">
                    <button class="mp-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm conFollow" data-am-modal-confirm>确定</button>
                </div>
            </form>
        </div>
    </div>
    <!--新建分组弹出框-->
    <div class="am-modal am-modal-confirm mp-btn1 mp-modal mp-modal2" tabindex="-1" id="mp-btn2">
        <div class="am-modal-dialog  ">
            <form action="">
                <h1 class="modal-header"><span>新建分组</span></h1>
                <div class="am-modal-bd modal-group-name">
                    <span>名称</span>
                    <input type="text" placeholder="1-12个字符">
                </div>
                <div class="modal-footer">
                    <button class="mp-close modal5-close" data-am-modal-close>取消</button>
                    <button type="submit" class="confirm " data-am-modal-confirm>确定</button>
                </div>
            </form>
        </div>
    </div>
@stop
@section('javascript')
    @parent
    <script>
        $(function () {
            init();

            /* 加载更多 */
            $('.gz-more').on('touchstart', function () {
                var url   = $(this).attr('url');
                var type  = $(this).hasClass('more-ed') ? 'followed' : 'following';
                var _json = useAjax('get', url, {'type': type});
                var div   = '.i-' + type;
                var more  = type == 'followed' ? '.more-ed' : '.more-ing';
                showHtml(jointDiv(_json.data.data), div, 'more'); // 关注我的
                if (!isShowMore(_json.data)) {
                    $(more).addClass('hide');
                } else {
                    $(more).attr('url', _json.data.next_page_url);
                }
            });

            /* 取消关注 */
            $('.conRemove').on('touchstart', function () {
                var data = $(this).parents('form').serializeArray();
                var json = useAjax('post', '{{ route('user.unfollowAjax') }}', data);
                alert(json.msg);
                window.location.href = '{{ route('cardcase.index') }}';
            });

            /* 关注且分组 */
            $('.conFollow ').on('touchstart', function () {
                var data = $(this).parents('form').serializeArray();
                var json = useAjax('post', '{{ route('user.followAjax') }}', data);
                alert(json.msg);
                window.location.href = '{{ route('cardcase.index') }}';
            });

            /* 加关注 */
            $(".jgz").click('touchstart', function (e) {
                var uid = $(this).parents('.group-list').attr('data-id');
                $('#mp-btn5').find('[name="user_id"]').val(uid);
                $('#mp-btn5').modal('toggle');
                e.stopPropagation();
            });
            /* 取消关注 */
            $(".ygz").click('touchstart', function () {
                var uid = $(this).parents('.group-list').attr('data-id');
                $('#mp-btn4').find('[name="user_id"]').val(uid);
                $('#mp-btn4').modal('toggle');
            });
        });
        /* 初始化 */
        function init() {
            // 加载内容
            var _jsonFollowed  = useAjax('get', '{{ route('cardcase.indexAjax') }}');
            var _jsonFollowing = useAjax('get', '{{ route('cardcase.indexAjax') }}', {'type': 'following'});

            // 判断是否需要翻页
            if (!isShowMore(_jsonFollowed.data)) {
                $('.more-ed').addClass('hide');
            } else {
                $('.more-ed').attr('url', _jsonFollowed.data.next_page_url);
            }
            if (!isShowMore(_jsonFollowing.data)) {
                $('.more-ing').addClass('hide');
            } else {
                $('.more-ing').attr('url', _jsonFollowing.data.next_page_url);
            }

            $('#count_num_followed').text(_jsonFollowed.data.total);
            $('#count_num_following').text(_jsonFollowing.data.total);
            showHtml(jointDiv(_jsonFollowed.data.data), '.i-followed', 'init'); // 关注我的
            showHtml(jointDiv(_jsonFollowing.data.data), '.i-following', 'init'); // 我关注的

        }
        /* 判断是否需要显示更多 */
        function isShowMore(data) {
            if (data.last_page > data.current_page) {
                return 1;
            }
            return 0;
        }

        /* 拼接数据 */
        function jointDiv(data) {
            console.log(data);
            console.log('jointDiv');
            var _html = '';
            if (data.length) {
                $.each(data, function (k, v) {
                    _html += '<div class="group-list" data-id="' + v.id + '">';
                    if (v.isFollow) {
                        _html += '<div class="group-list-mes">';
                    } else if (v.isFollowMe) {
                        _html += '<div class="group-list-mes gz-group">';
                    }
                    _html += '<div class="mes-img"><img src="' + v.avatar + '" alt=""></div>';
                    _html += '<div class="mes-data">';
                    if (v.employee) {
                        _html += '<h3>' + v.employee.nickname + '（' + v.company.display_name + '）</h3>';
                        _html += '<p>' + v.employee.positions + '</p>';
                        _html += '<i>企业</i>';
                    } else {
                        _html += '<h3>' + v.nickname + '</h3>';
                        _html += '<p>' + v.mobile + '</p>';
                        if (v.isLeave) {
                            _html += '<i class="on">企业</i>';
                        } else {
                            _html += '<i>个人</i>';
                        }
                    }
                    if (v.isFollow) {
//                        if ((v.group.length)) {
//                            _html += '<b>已分组</b>';
//                        } else {
//                            _html += '<b>未分组</b>';
//                        }
                    }
                    _html += '</div>';
                    if (v.isFollow && v.isFollowMe) {
                        _html += '<div class="mes-gz rt ygz">';
                        _html += '<i class="iconfont">&#xe63c;</i>';
                        _html += '<span>相互关注</span>';
                        _html += '</div>';
                    } else if (v.isFollow) {
                        _html += '<div class="mes-gz rt ygz">';
                        _html += '<i class="iconfont">&#xe63c;</i>';
                        _html += '<span>已关注</span>';
                        _html += '</div>';
                    } else if (v.isFollowMe) {
                        _html += '<div class="mes-gz rt jgz">';
                        _html += '<i class="iconfont">&#xe610;</i>';
                        _html += '<span>加关注</span>';
                        _html += '</div>';
                    }
                    _html += '</div>';
                    _html += '</div>';
                });
            }
            return _html;
        }
    </script>
@stop

