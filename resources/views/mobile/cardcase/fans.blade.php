@extends('mobile.common.layout')
@section('title', '关注列表')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    {{--内容--}}
    <div class="gz_page">
        {{--<div class="gz_head">--}}
        {{--<h2>--}}
        {{--<em><b id="count_num">{{ $count }}</b></em>--}}
        {{--<div class="img">关注注我的</div>--}}
        {{--<span>人</span>--}}
        {{--</h2>--}}
        {{--</div>--}}
        <div id="tabBox1" class="tabBox">

            <div class="hd">
                <ul>
                    <li {{ isset($params['type']) ? '' : 'class=on' }}
                        data-url="{{ url('cardcase/fans') }}" id="show-content0">
                        <a>全部</a></li>
                    <li {{ isset($params['type']) && $params['type'] == 'following' ? 'class=on' : ''}}
                        data-url="{{ url('cardcase/fans/following') }}" id="show-content1">
                        <a>我关注的</a></li>
                    <li {{ isset($params['type']) && $params['type'] == 'followed' ? 'class=on' : ''}}
                        data-url="{{ url('cardcase/fans/followed') }}" id="show-content2">
                        <a>粉丝</a></li>
                    <li {{ isset($params['type']) && $params['type'] == 'together' ? 'class=on' : ''}}
                        data-url="{{ url('cardcase/fans/together') }}" id="show-content3">
                        <a>相互关注</a></li>
                </ul>
            </div>
            <div class="gz_head">
                <h2>
                    <em><b id="count_num">0</b></em>
                    <div class="img" id="count_title">关注我的</div>
                    <span>人</span>
                </h2>
            </div>
            <div class="bd" id="tabBox1-bd">
                <div class="con">
                    <ul class="show-content0" data-num="1">
                    </ul>
                    <div class="gz_more" data-url="">加载中...</div>
                </div>
                <div class="con">
                    <ul class="show-content1" data-num="2">
                    </ul>
                    <div class="gz_more" data-url="">加载中...</div>
                </div>
                <div class="con">
                    <ul class="show-content2" data-num="3">
                    </ul>
                    <div class="gz_more" data-url="">加载中...</div>
                </div>
                <div class="con">
                    <ul class="show-content3" data-num="4">
                    </ul>
                    <div class="gz_more" data-url="">加载中...</div>
                </div>

            </div>
        </div>
    </div>
@stop
@section('javascript')
    @parent
    <script>

        var _json;


        $(function () {

            /* 加载更多 */
            $('.gz_more').on('touchstart', function () {
                var _url = $(this).attr('data-url');
                var _div = '.' + $(this).siblings('ul').attr('class');
                useAjax(_url, 'get', _div);
                if (_json) {

                }
            });

            /* 点击关注 */
            $('.gzzt').on('touchstart', function () {
                var _html = '';
                var _id   = $(this).parents('li').attr('data-id');
                useAjax('{{ url('user/follow') }}/' + _id, 'post');
                if (_json.err) {
                    alert(_json.msg);
                } else {
                    alert(_json.msg);
                    _html += '<div class="gzzt1">';
                    _html += '<img src="' + '{{ asset('static/mobile/images/gz1.png') }}' + '"><br>相互关注';
                    _html += '</div>';
                    $(this).parents('.wrap_gzzt').html(_html);
                }

            });
        });

        /* 关注页面选项卡切换 start */
        TouchSlide({
            slideCell: "#tabBox1",
            delayTime: 200,
            startFun: function (i) {
                // 判断是否有内容
                var content = $.trim($('.show-content' + i).html());
                if (content == null || content == '') {
                    var _url = $('#show-content' + i).attr('data-url');
                    useAjax(_url, 'get');
                    showHtml(_json.data.fans, 'init', '.show-content' + i);
                }
                // 人数、标题 改变，一定要在showHtml()之后
                var count = $('.show-content' + i).data('num');
                var title = $('#show-content' + i).find('a').text();
                $('#count_num').text(count);
                $('#count_title').text(title);
            },
            endFun: function (i) { // 高度自适应
//                var bd                     = document.getElementById("tabBox1-bd");
//                bd.parentNode.style.height = bd.children[i].children[0].offsetHeight + 32 + "px";
//                if (i > 0) bd.parentNode.style.transition = "0ms";//添加动画效果
            }
        });
        /*关注页面选项卡切换 end*/

        /* 初始化 */
        //        function init() {
        //            // 给每个ul中添加DIV，加载中的提示状态
        //            $('[class^="show-content"]').html('<div class="gz_none">加载中...</div>');
        //            // 默认加载全部
        //            var _url = document.URL; // 当前url
        //            useAjax(_url, 'get');
        //            showHtml(_data, 'init', '.show-content0');
        //        }

        /* 使用ajax请求 */
        function useAjax(_url, _method, _div) {
            if (!_url) {
                _json = null;
                return false;
            }

            $.ajax({
                url: _url,
                type: _method,
                async: false,
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
                success: function (json) {
                    _json = json;
                    if (_div) {
                        showHtml(_json.data.fans, 'more', _div);
                    }
                }
            });
        }

        /**
         * 展示数据，更新人数banner
         * @param _data
         * @param _type 显示方式
         * @param _div  显示区域
         */
        function showHtml(_data, _type, _div) {
            $(_div).data('num', _data.total);
            var _html = '';
            $.each(_data.data, function (i, v) {
                _html += '<li data-id="' + v.id + '">';
                _html += '<a href="#" class="clearfix">';
                _html += '<div class="wrap_img fl">';
//                if (v['employee']) {
//                    _html += '<img src="' + v['employee']['avatar'] + '">';
//                } else {
                    _html += '<img src="' + v['avatar'] + '">';
//                }
                _html += '</div>';
                _html += '<div class="gzinfo fl">';
                if (v['employee']) {
                    _html += '<h2>' + v['employee']['nickname'] + '　( ' + v['employee']['positions'] + ' )　</h2>';
                    _html += '<p>' + v['company']['display_name'] + '</p>';
                } else {
                    _html += '<h2>' + v['nickname'] + '</h2>';
                }
//                _html += '<span>TA关注了你的名片</span>';
                _html += '</div>';
                _html += '<div class="wrap_gzzt fr">';
                if (v['isFollow'] && v['isFollowMe']) {
                    _html += '<div class="gzzt1">';
                    _html += '<img src="' + '{{ asset('static/mobile/images/gz1.png') }}' + '"><br>相互关注';
                    _html += '</div>';
                } else if (v['isFollow']) {
                    _html += '<div class="gzzt1">已关注</div>';
                } else if (v['isFollowMe']) {
                    _html += '<div class="gzzt" >关注TA</div>';
                }
                _html += '</div>';
                _html += '</a>';
                _html += '</li>';
            });
            if (_type == 'init' || _type == 'refresh') {
                $(_div).html(_html);
            } else if (_type == 'more') {
                $(_div).append(_html);
            } else if (_type == 'before') {
                $(_div).prepend(_html);
            }

            //_div:show-content0
            var aMore = $(_div).siblings('div');
            if ($(_div).children('li').length < _data.total && _type != 'before') { // 可能还有
                var url = _data.next_page_url;
                aMore.attr('data-url', url).text('加载更多...');
            }
            if ($(_div).children('li').length == _data.total && _type != 'before') { // 没有下一页
                aMore.removeClass();
                aMore.addClass('gz_none').text('已经到底了').removeAttr('data-url');
            }

        }
    </script>
@stop

