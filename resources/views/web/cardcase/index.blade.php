@extends('web.common.layout')
@section('title', '通讯录')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('cardcase') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">我的通讯录</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <ul class="b-button">
                <li class="b-btn-bg"><a href=""><i class="iconFont">&#xe6d3;</i>批量删除</a></li>
                {{--<li class="b-btn-bor b-sort-btn ">--}}
                    {{--<a href="javascript:">选择排序<i class="iconFont">&#xe618;</i></a>--}}
                    {{--<ul class="b-sort none">--}}
                        {{--<li><a href="">按名字排序</a></li>--}}
                        {{--<li><a href="">按职位排序</a></li>--}}
                        {{--<li><a href="">按部门排序</a></li>--}}
                        {{--<li><a href="">按入职时间排序</a></li>--}}
                    {{--</ul>--}}
                {{--</li>--}}
                {{--<li class="b-btn-bor"><a href="">查询字段<i class="iconFont">&#xe618;</i></a></li>--}}
                {{--<li class="b-search  ">--}}
                    {{--<form action="">--}}
                        {{--<input class="b-input b-form-bor" type="text" placeholder="请输入关键字">--}}
                        {{--<input class="b-ser-btn b-form-bg" type="submit" value="查找">--}}
                    {{--</form>--}}
                {{--</li>--}}
            </ul>
            <table class="table b-table">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="boxAll"><label for="boxAll"><i class="iconFont">&#xe7de;</i></label>
                    </th>
                    <th class="b-phone-w2"><a href="">姓名</a></th>
                    <th class="b-phone-w2"><a href="">公司</a></th>
                    <th class="b-phone-w2"><a href="">手机</a></th>
                    <th class=" b-td-hide"><a href="">操作</a></th>
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($cardcases))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($cardcases as $item)
                        <tr>
                            <td class="b-phone-w"><input type="checkbox" id="box{{ $item->follower->id }}"><label for="box{{ $item->follower->id }}"><i
                                            class="iconFont">&#xe7de;</i></label>
                            </td>
                            <td class="b-phone-w2">{{ $item->follower->nickname }}</td>
                            <td class="b-phone-w2">{{ $item->getFollowerType($item->follower_type) == 'u' ? '个人用户' : $item->follower->company->display_name }}</td>
                            <td class="b-phone-w2">{{ $item->follower->mobile }}</td>
                            {{--<td class="b-td-width">{{ $item->getFollowerType($item->follower_type) == 'user' ? : '' }}</td>--}}
                            <td class="b-td-icon b-td-hide">
                                <a href="" data-toggle="modal" data-target="#modal-cardshow-show"
                                   class="operate-cardshow"
                                   {{--cardview/' . $param[0] . '-' . $person->id--}}
                                   data-url="{{ url('cardview/'.$item->getFollowerType($item->follower_type).'-'.$item->follower_id) }}"><i
                                            class="iconFont">&#xe613;</i></a>
                                {{--<a href=""><i class="iconFont">&#xe632;</i></a>--}}
                                {{--<a href=""--}}
                                {{--data-url="{{  url('cardcase/follow/'.$item->getFollowerType($item->follower_type).'-'.$item->follower_id) }}"><i--}}
                                {{--class="iconFont">&#xe921;</i></a>--}}
                                {{--<a href="javascript:" data-toggle="modal" data-target=".bs3"><i--}}
                                {{--class="iconFont">&#xe6d3;</i></a>--}}
                            </td>
                            <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                            </td>
                        </tr>
                        <tr class="td-icon-hide none">
                            <td id="look"><a href="address-phone-look.html"><i class="iconFont">&#xe613;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe632;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe921;</i></a></td>
                            <td><a href="javascript:" data-toggle="modal" data-target=".bs3"><i
                                            class="iconFont">&#xe6d3;</i></a></td>
                        </tr>

                    @endforeach
                @endif

                </tbody>
            </table>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p>
            {!! $cardcases->render() !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <!--查看名片 -->
    <div class="modal fade" id="modal-cardshow-show" tabindex="-1" role="dialog"
         aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal11">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">名片查看</h4>
                </div>

                <iframe src="" width="320" height="568" frameborder="0" scrolling="auto"></iframe>
            </div>
        </div>
    </div>
@show