@extends('mobile.common.layout')
@section('title', '粉丝列表')
@section('css')
    @parent
    <link href="{{ asset('static/mobile/css/public.css') }}" rel="stylesheet">
@stop
@section('content')
    {{--内容--}}
    <div class="gz_page">
        <div class="gz_head">
            <h2>
                <em><b id="count_num">{{ $count }}</b><img src="{{ asset('static/mobile/images/gzpic.png') }}"></em>
                <span>人</span>
            </h2>
        </div>
        <div id="tabBox1" class="tabBox">
            <div class="hd">
                <ul>
                    <li {{ isset($params['type']) ? '' : 'class=on' }}>
                        <a href="{{ url('cardcase/fans') }}">全部</a></li>
                    <li {{ isset($params['type']) && $params['type'] == 'unfollow' ? 'class=on' : ''}}>
                        <a href="{{ url('cardcase/fans?type=unfollow') }}">未关注</a></li>
                    <li {{ isset($params['type']) && $params['type'] == 'together' ? 'class=on' : ''}}>
                        <a href="{{ url('cardcase/fans?type=together') }}">已互关注</a></li>
                </ul>
            </div>
            <div class="bd" id="tabBox1-bd">
                <div class="con">
                    <ul class="zone-content">
                        {{--<h2 class="gzdate"><em>2017-07-28</em></h2>--}}
                        {{--@foreach($fans as $item)--}}
                        {{--@endforeach--}}
                        <div class="gz_none">加载中...</div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
@stop
@section('modal-extend')
    <div class="modal fade hintModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-describedby="myModalContent" style="z-index:2000">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-body text-center">
                    提示内容
                </div>
                <div class="hidden after-operate"></div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- 提示模态框.hintModal -->
@stop
@section('javascript')
    @parent
    <script>
        var _data, _json;
        $(function () {
            init();
            /* 加载更多 */
            $('.a-more').on('touchstart', function () {
                var _url = $(this).data('url');
                console.log(_url);
                useAjax(_url, 'get');
                $(this).remove();
                showHtml(_data, 'more');
            });
            $('.gzzt').on('touchstart', function () {
                _json     = '';
                var _html = '';
                var _id   = $(this).data('id');
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
        /* 初始化 */
        function init() {
            var _url = document.URL; // 当前url
            useAjax(_url, 'get');
            showHtml(_data, 'init');
        }

        /* 提示 */
        function hint(str) {
            /* 提示 - 自动隐藏 */
            $('.hintModal').on('show.bs.modal', function () {
                var _modal = $(this);
                _modal.find('.modal-body').text(str);
                _modal.oneTime('2s', function () {
                    _modal.modal('hide');
                });
            });
        }

        /* 使用ajax请求 */
        function useAjax(_url, _method) {
            console.log(_url)
            $.ajax({
                url: _url,
                type: _method,
                async: false,
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
                success: function (json) {
                    _json = json;
                    _data = json.data;
                }
            });
        }

        /**
         * 展示html
         * @param _data
         * @param _type 显示方式
         */
        function showHtml(_data, _type) {
            var _html = '';
            $.each(_data.data, function (i, v) {
                _html += '<li>';
                _html += '<a href="#" class="clearfix">';
                _html += '<div class="wrap_img fl">';
                if (v['employee']) {
                    _html += '<img src="' + v['employee']['avatar'] + '">';
                } else {
                    _html += '<img src="' + v['avatar'] + '">';
                }
                _html += '</div>';
                _html += '<div class="gzinfo fl">';
                if (v['employee']) {
                    _html += '<h2>' + v['employee']['nickname'] + '　( ' + v['employee']['positions'] + ' )　</h2>';
                    _html += '<p>' + v['company']['display_name'] + '</p>';
                } else {
                    _html += '<h2>' + v['nickname'] + '</h2>';
                }
                _html += '<span>TA关注了你的名片</span>';
                _html += '</div>';
                _html += '<div class="wrap_gzzt fr">';
                if (v['isFollow']) {
                    _html += '<div class="gzzt1">';
                    _html += '<img src="' + '{{ asset('static/mobile/images/gz1.png') }}' + '"><br>相互关注';
                    _html += '</div>';
                } else {
                    _html += '<div class="gzzt" data-id="' + v.id + '">关注TA</div>';
                }
                _html += '</div>';
                _html += '</a>';
                _html += '</li>';
            });
            if (_data.data.length == _data.per_page && _type != 'before') { // 可能还有
                _html += '<a class="a-more" data-url="' + _data.next_page_url + '">';
                _html += '<div class="gz_more">加载更多...</div>';
                _html += '</a>';
            }
            if (_data.data.length < _data.per_page && _type != 'before') { // 没有下一页
                _html += '<div class="gz_none">已经到底了</div>';
            }
            if (_type == 'init' || _type == 'refresh') {
                $('.zone-content').html(_html);
            } else if (_type == 'more') {
                $('.zone-content').append(_html);
            } else if (_type == 'before') {
                $('.zone-content').prepend(_html);
            }
        }


    </script>
@stop

