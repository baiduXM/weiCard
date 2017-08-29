@extends('web.common.layout')
@section('title', '员工')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.circle') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">名片圈</a>
            </li>
        </ul>
        {{--<ul class="nav nav-tabs" id="myTab">--}}
        {{--<li class="{{ Request::path() == 'company/employee' ? 'active' : '' }}">--}}
        {{--<a href="{{ url('company/employee') }}">我的同事</a>--}}
        {{--</li>--}}
        {{--<li class="{{ Request::path() == 'company/employee/trash' ? 'active' : '' }}">--}}
        {{--<a href="{{ url('company/employee/trash') }}">离职员工</a>--}}
        {{--</li>--}}
        {{--</ul>--}}

        <div class="myCard-content rt-main">
            {{--@if(Auth::user()->company)--}}
            <ul class="b-button">
                {{--<li class="b-btn-bg"><a href="{{ url('company/employee/batch') }}" class="delete"><i class="iconFont">&#xe6d3;</i>批量删除</a></li>--}}
                <li class="b-btn-bg">
                    <a href="" data-toggle="modal" data-target="#modal-circle-add" class="circle-add">
                        <i class="iconFont">&#xe67d;</i>添加</a>
                </li>

                {{--<li class="b-btn-bor b-word-btn ">--}}
                {{--<a href="javascript:" class="word-select" name="noword">查询字段<i class="iconFont">&#xe618;</i></a>--}}
                {{--<ul class="b-word none">--}}
                {{--<li><a class="dropdown-word" id="noword">查询字段</a></li>--}}
                {{--<li><a class="dropdown-word" id="number">工号</a></li>--}}
                {{--<li><a class="dropdown-word" id="nickname">姓名</a></li>--}}
                {{--<li><a class="dropdown-word" id="positions">职位</a></li>--}}
                {{--<li><a class="dropdown-word" id="mobile">手机</a></li>--}}
                {{--<li><a class="dropdown-word" id="telephone">电话</a></li>--}}
                {{--<li><a class="dropdown-word" id="department">部门</a></li>--}}
                {{--</ul>--}}
                {{--</li>--}}
                {{--<li class="b-search  " name='search-form'>--}}
                {{--<form action="{{ url('/company/employee') }}">--}}
                {{--<input type="hidden" class="word" name="word" value='nickname'>--}}
                {{--<input class="b-input b-form-bor" type="text" name="keyword" placeholder="请输入关键字">--}}
                {{--<input class="b-ser-btn b-form-bg" type="submit" value="查找">--}}
                {{--</form>--}}
                {{--</li>--}}
            </ul>
            {{--@endif--}}

            <table class="table b-table table-hover" id="tableList">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="boxAll"><label for="boxAll" class="iconFont"><i>&#xe7de;</i></label>
                    </th>
                    <th class="b-phone-w2"><a href="">圈子名称</a></th>
                    <th class="b-phone-w2"><a href="">创建者</a></th>
                    <th class="b-phone-w2"><a href="">人数</a></th>
                    <th class="b-phone-w2"><a href="">有效期</a></th>
                    <th class="b-phone-w2"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if(!isset($circles))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($circles as $item)
                        <tr class="">
                            {{--<tr class="{{ $item->user_id == Auth::id() ? 'info' : '' }}">--}}
                            <td class="b-phone-w"><input type="checkbox" id="{{ $item->id }}">
                                <label for="{{ $item->id }}" class="iconFont"><i>&#xe7de;</i></label>
                            </td>
                            <td class="b-phone-w2">{{ $item->name }}</td>
                            <td class="">{{ $item->user->nickname }}</td>
                            <td class="">{{ count($item->users) }} / {{ ($item->limit) ? $item->limit : '∞' }}</td>
                            <td class="">{{ $item->expired_time or '∞' }}</td>
                            <td class="b-td-icon b-td-hide w-icon">
                                <a href="{{ url('circle/'.$item->id) }}" title="查看">
                                    <i class="iconFont">&#xe613;</i></a>
                                <a href="" data-toggle="modal" data-target="#modal-circle-edit"
                                   data-url="{{ url('circle/'.$item->id) }}" class="operate-edit"><i
                                            title="编辑" class="iconFont">&#xe632;</i></a>
                                <a href="" data-toggle="modal" data-target="#modal-qrcode-show"
                                   data-url="{{ $item->qrcode_path }}" class="operate-show"><i
                                            title="二维码" class="iconFont">&#xe921;</i></a>
                                {{--<a href="javascript:void(0);" class="operate-share" title="二维码"--}}
                                {{--data-url="{{ url('cardcase/follow/e-'.$item->id) }}">--}}
                                {{--<i class="iconFont">&#xe921;</i></a>--}}
                                @if($item->user_id == Auth::id())
                                    <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                       class="operate-delete" title="删除" data-url="{{ url('circle/'.$item->id) }}">
                                        <i class="iconFont">&#xe6d3;</i></a>
                                @endif
                            </td>
                            <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                            </td>
                        </tr>
                    @endforeach
                @endif
                </tbody>
            </table>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p><!--适应手机-->
            {{--            {!! $circles ? $circles->appends($params)->render() : '' !!}--}}
        </div>
    </div>
@stop

@section('modal-extend')

    <!-- 名片圈 - 添加modal start-->
    <div class="modal fade" id="modal-circle-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">圈子</h4>
                </div>
                <form action="{{ url('circle') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Circle[name]" placeholder="" class="info-name"
                                       value="{{ old('Circle.name') ? old('Circle.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>人数 : </span>
                                <input id="limit_not" style="display: inline;width: auto; height: auto" type="radio"
                                       class="info-limit"
                                       name="Circle[limit]" value="0" checked>
                                <label for="limit_not" style="width: auto; height: auto;">无限制</label>
                                <input id="limit_30" style="display: inline;width: auto; height: auto" type="radio"
                                       class="info-limit"
                                       name="Circle[limit]" value="30">
                                <label for="limit_30" style="width: auto; height: auto;">30人</label>
                                <input id="limit_100" style="display: inline;width: auto; height: auto" type="radio"
                                       class="info-limit"
                                       name="Circle[limit]" value="100">
                                <label for="limit_100" style="width: auto; height: auto;">100人</label>
                            </p>
                            <p>
                                <span>有效期 : </span>
                                <input id="expired_not" style="display: inline;width: auto; height: auto" type="radio"
                                       name="Circle[expired_time]" value="0" checked>
                                <label for="expired_not" style="width: auto; height: auto;">永久</label>
                                <input id="expired_3" style="display: inline;width: auto; height: auto" type="radio"
                                       name="Circle[expired_time]" value="3">
                                <label for="expired_3" style="width: auto; height: auto;">3天</label>
                                <input id="expired_7" style="display: inline;width: auto; height: auto" type="radio"
                                       name="Circle[expired_time]" value="7">
                                <label for="expired_7" style="width: auto; height: auto;">7天</label>
                            </p>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-create">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                        <input type="reset" class="hide" id="resetBtn">
                    </div>
                </form>
            </div>
        </div>
    </div><!-- 名片圈 - 添加modal end-->
    <!-- 名片圈 - 编辑modal start-->
    <div class="modal fade" id="modal-circle-edit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">编辑部门员工</h4>
                </div>
                <form action="" method="put" class="form-update" data-after="{{ url('circle') }}"
                      enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Circle[name]" placeholder="" class="info-name"
                                       value="{{ old('Circle.name') ? old('Circle.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>人数 : </span>
                                <input id="limit_not" style="display: inline;width: auto; height: auto" type="radio"
                                       class="info-limit"
                                       name="Circle[limit]" value="0" checked>
                                <label for="limit_not" style="width: auto; height: auto;">无限制</label>
                                <input id="limit_30" style="display: inline;width: auto; height: auto" type="radio"
                                       class="info-limit"
                                       name="Circle[limit]" value="30">
                                <label for="limit_30" style="width: auto; height: auto;">30人</label>
                                <input id="limit_100" style="display: inline;width: auto; height: auto" type="radio"
                                       class="info-limit"
                                       name="Circle[limit]" value="100">
                                <label for="limit_100" style="width: auto; height: auto;">100人</label>
                            </p>
                            <p>
                                <span>有效期 : </span>
                                <input id="expired_not" style="display: inline;width: auto; height: auto" type="radio"
                                       name="Circle[expired_time]" value="-1" checked="true">
                                <label for="expired_not" style="width: auto; height: auto;">不变</label>

                                <input id="expired_3" style="display: inline;width: auto; height: auto" type="radio"
                                       name="Circle[expired_time]" value="3">
                                <label for="expired_3" style="width: auto; height: auto;">延长3天</label>

                                <input id="expired_7" style="display: inline;width: auto; height: auto" type="radio"
                                       name="Circle[expired_time]" value="7">
                                <label for="expired_7" style="width: auto; height: auto;">延长7天</label>

                                <input id="expired_0" style="display: inline;width: auto; height: auto" type="radio"
                                       name="Circle[expired_time]" value="0">
                                <label for="expired_0" style="width: auto; height: auto;">永久</label>
                            </p>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-update">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                        <input type="reset" class="hide" id="resetBtn">
                    </div>
                </form>
            </div>
        </div>
    </div><!-- 名片圈 - 添加modal end-->
    <!-- 名片圈 - 显示二维码modal start-->
    <div class="modal fade" id="modal-qrcode-show" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img class="qrcode-img" src="" alt="" title="圈子二维码">
                </div>
                <div class="modal-footer">
                    <a href="" target="_blank" class="btn btn-primary qrcode-download"> 下载二维码</a>
                </div>

            </div>
        </div>
    </div><!-- 名片圈 - 显示二维码modal end-->


@stop
@section('javascript')
    <script>
        $(function () {
            $('.circle-add').on('click', function () {
                $('.form-create')[0].reset();
            });

            /* 添加 */
            $('.operate-create').unbind('click').on('click', function () {
                var _url      = $(this).parents('form').attr('action');
                var _method   = $(this).parents('form').attr('method') ? $(this).parents('form').attr('method') : 'post';
                var _formData = $(this).parents('form').serializeArray();
                $("[class^='error-']").addClass('hidden');
                $.ajax({
                    url: _url,
                    type: _method,
                    data: _formData,
                    dataType: 'json',
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    success: function (json) {
                        console.log('success');
                        console.log(json);
                        $('.hintModal').modal('show');
                        $('.hintModal .modal-body').text(json);
                        $('.hintModal .after-operate').text(_url);
                        return false;
                    },
                    error: function (json) {
                        console.log('failed');
                        console.log(json);
                        var errors = json.responseJSON;
                        showError(errors);
                        return false;
                    }
                });
            });
            /* 编辑 */
            $('.operate-update').unbind('click').on('click', function () {
                var _url       = $(this).parents('form').attr('action');
                var _url_after = $(this).parents('form').data('after');
                var _method    = $(this).parents('form').attr('method') ? $(this).parents('form').attr('method') : 'post';
                var _formData  = $(this).parents('form').serializeArray();
                $("[class^='error-']").addClass('hidden');
                $.ajax({
                    url: _url,
                    type: _method,
                    data: _formData,
                    dataType: 'json',
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    success: function (json) {
                        console.log('success');
                        console.log(json);
                        $('.hintModal').modal('show');
                        $('.hintModal .modal-body').text(json.msg);
                        $('.hintModal .after-operate').text(_url_after);
                        return false;
                    },
                    error: function (json) {
                        console.log('failed');
                        console.log(json);
                        var errors = json.responseJSON;
                        showError(errors);
                        return false;
                    }
                });
            });

            $('.operate-show').unbind('click').on('click', function () {
                var _url = $(this).data('url');
                console.log(_url)
                $('.qrcode-img').attr('src', _url);
                $('.qrcode-download').attr('href', "{{ url('download?path=') }}" + _url);
            });

        });
    </script>
@stop