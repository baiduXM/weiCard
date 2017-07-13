@extends('web.common.layout')
@section('title', '微链接')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.link') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">微链接</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            @if(Auth::user()->company)
                <ul class="b-button">
                    {{--<li class="b-btn-bg"><a href=""><i class="iconFont">&#xe6d3;</i>批量删除</a></li>--}}
                    {{--<li class="b-btn-bg"><a href=""><i class="iconFont">&#xe67d;</i>批量添加</a></li>--}}
                    {{--<li class="b-btn-bg"><a href="javascript:">导入excel</a></li>--}}
                    <li class="b-btn-bg"><a href="" data-toggle="modal" data-target="#modal-product-add"><i
                                    class="iconFont">&#xe67d;</i>添加</a>
                    </li>
                    {{--<li class="b-btn-bor b-sort-btn ">--}}
                    {{--<a href="javascript:">选择排序<i class="iconFont">&#xe618;</i></a>--}}
                    {{--<ul class="b-sort none">--}}
                    {{--<li><a href="">按名称排序</a></li>--}}
                    {{--<li><a href="">按时间排序</a></li>--}}
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
            @endif
            <table class="table b-table table-hover" id="tableList">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="boxAll"><label for="boxAll" class="iconFont"><i>&#xe7de;</i></label>
                    </th>
                    <!-- <th class="b-phone-w2"><a href="">#</a></th> -->
                    <th class=" "><a href="">名称</a></th>
                    <th class="b-phone-w2"><a href="">网址</a></th>
                    <th class=" b-td-hide"><a href="">图标</a></th>
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th><!--适应手机-->
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($links))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($links as $item)
                        <tr class="{{ $item->user_id == Auth::id() ? 'info' : '' }}">
                            <td class="b-phone-w"><input type="checkbox" id="{{ $item->id }}">
                                <label for="{{ $item->id }}" class="iconFont"><i>&#xe7de;</i></label>
                            </td>
                            <!-- <td class="b-phone-w2">{{ $item->id }}</td> -->
                            <td class="">{{ $item->link_name }}</td>
                            <td class="b-td-width b-td-hide">{{ $item->link_url }}</td>
                            <td class="b-td-width b-td-hide"><i style="font-size: 30px;" class="iconfonts">{{ $item->link_img.';' }}</i> </td>
                            <td class="b-td-icon b-td-hide w-icon">
                                {{--<a href="" data-toggle="modal" data-target="#modal-employee-show"--}}
                                   {{--class="operate-show"--}}
                                   {{--data-url="{{ url('company/link/'.$item->id) }}"><i--}}
                                            {{--class="iconFont">&#xe613;</i></a>--}}
                                @if(Auth::user()->company)
                                    <a href="" data-toggle="modal" data-target="#modal-employee-edit"
                                       data-url="{{ url('company/link/'.$item->id) }}" class="operate-edit"><i
                                                class="iconFont">&#xe632;</i></a>
                                    {{--<a href="javascript:void(0);" class="operate-share"--}}
                                    {{--data-url="{{ url('cardcase/follow/e-'.$item->id) }}"><i class="iconFont">&#xe921;</i></a>--}}
                                    <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                       class="operate-delete"
                                       data-url="{{ url('company/link/'.$item->id) }}">
                                        <i class="iconFont">&#xe6d3;</i></a>
                                @endif
                            </td>
                            <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                            </td>
                        </tr>
                        <tr class="td-icon-hide none">
                            <td id="look">
                                <a href="javascript:" data-toggle="modal" data-target=".bs2"><i
                                            class="iconFont">&#xe613;</i></a>
                            </td>
                            <td><a href=""><i class="iconFont">&#xe634;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe632;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe921;</i></a></td>
                            <td><a href="" data-toggle="modal" data-target=".bs3"><i
                                            class="iconFont">&#xe6d3;</i></a></td>
                        </tr><!--适应手机操作-->
                    @endforeach
                @endif
                </tbody>
            </table>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p><!--适应手机-->
            {!! $links ? $links->render() : '' !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <!-- 产品 - 添加modal -->
    <div class="modal fade" id="modal-product-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加微链接</h4>
                </div>
                <form action="{{ url('company/link') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Link[link_name]" placeholder=""
                                       value="{{ old('Link.link_name') ? old('Link.link_name') : '' }}">
                                <span class="error-link_name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>网址 : </span>
                                <input type="text" name="Link[link_url]" placeholder=""
                                       value="{{ old('Link.link_url') ? old('Link.link_url') : '' }}">
                                <span class="error-link_url" style="color: red;"></span>
                            </p>
                            {{--<p>--}}
                                {{--<span>图标 : </span>--}}
                                {{--<input type="file" name="Link[link_img]" placeholder="">--}}
                                {{--<span class="error-link_img" style="color: red;"></span>--}}
                            {{--</p>--}}
                            <p style="text-align: left; line-height: 40px; position: relative">
                                <span style="line-height: 40px; float: left;">图标 : </span>
                                <i id="iconStart" style="font-size:28px; padding-left: 10px;" class="iconfonts">&#xe645;</i>
                                <em><i id="iconId" style="font-size: 28px;" class="iconfonts">&#xe6ab;</i></em><span>请选择图标</span>
                                <input id="inputIcons" type="hidden" value="{{ old('Link.link_img') ? old('Link.link_img') : '' }}" name="Link[link_img]">
                                <span class="error-link_img" style="color: red;"></span>
                            <div id="selIcon" style="display:none; position: absolute; width:400px;top:174px; height: 180px; background: #999;">


                                @if(!count($icons))
                                    无图标
                                @else
                                    @foreach($icons as $item)
                                        <span class="selSpan"name="{{ $item->icon_name}}"><i class="iconfonts">{{ $item->icon_name.';' }}</i></span>
                                    @endforeach
                                @endif
                            </div>
                            <style>
                                #selIcon{ padding:10px;}
                                #selIcon span{ display: inline-block; line-height: 24px; padding:0 6px;}
                                #selIcon span i{ font-size: 24px;}
                            </style>

                            </p>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-create">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 产品 - 查看modal -->
    <div class="modal fade" id="modal-employee-show" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">查看</h4>
                </div>
                <div class="modal-body">
                    <div class="modal-address">
                        <p><span>名称 : </span><input type="text" name="info-link_name" value="" readonly></p>
                        <p><span>网址 : </span><input type="text" name="info-link_url" value="" readonly></p>
                        <p><span>创建时间 : </span><input type="text" name="info-created_at" value="" readonly></p>
                    </div>
                    <div class="modal-address-img" style="display: inline-table;">
                        <i style="font-size: 50px; display: table-cell;vertical-align: middle; text-align: center;" class="iconfonts">&#xe683;</i>
                        {{--<img name="info-link_img" src="{{ asset('static/home/images/avatar.jpg') }}" alt="">--}}
                        {{--<img name="info-avatar" src="../uploads/company/STQ564/img1493984327.jpg" alt="">--}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 产品 - 编辑modal -->
    <div class="modal fade" id="modal-employee-edit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">编辑微链接</h4>
                </div>
                <form action="" method="post" class="form-update"
                      enctype="multipart/form-data">
                    {{--{{ method_field('put') }}--}}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Link[link_name]" placeholder="" class="info-link_name"
                                       value="{{ old('Link.link_name') ? old('Link.link_name') : '' }}">
                                <span class="error-link_name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>网址 : </span>
                                <input type="text" name="Link[link_url]" placeholder="" class="info-link_url"
                                       value="{{ old('Link.link_url') ? old('Link.link_url') : '' }}">
                                <span class="error-link_url" style="color: red;"></span>
                            </p>

                            {{--<p>--}}
                                {{--<span>图标 : </span>--}}
                                {{--<input type="file" name="Link[link_img]" placeholder="">--}}
                                {{--<span class="error-link_img" style="color: red;"></span>--}}
                            {{--</p>--}}

                            <p style="text-align: left; line-height: 40px; position: relative">
                                <span style="line-height: 40px; float: left;">图标 : </span>
                                <i id="iconStart1" style="font-size:28px; padding-left: 10px;" class="iconfonts"></i>
                                <em><i id="iconId1" style="font-size: 28px;" class="iconfonts">&#xe6ab;</i></em><span>请选择图标</span>
                                <input id="inputIcons1" type="hidden" value="{{ old('Link.link_img') ? old('Link.link_img') : '' }}" name="Link[link_img]">
                                <span class="error-link_img" style="color: red;"></span>
                            <div id="selIcon1" style="display:none; position: absolute; width:400px;top:174px; height: 180px; background: #999;">


                                @if(!count($icons))
                                    无图标
                                @else
                                    @foreach($icons as $item)
                                        <span class="selSpan"name="{{ $item->icon_name}}"><i class="iconfonts">{{ $item->icon_name.';' }}</i></span>
                                    @endforeach
                                @endif
                            </div>
                            <style>
                                #selIcon1{ padding:10px;}
                                #selIcon1 span{ display: inline-block; line-height: 24px; padding:0 6px;}
                                #selIcon1 span i{ font-size: 24px;}
                            </style>

                            </p>

                        </div>
                        {{--<div class="modal-address-img" style="display: inline-table;">--}}
                            {{--<i style="font-size: 50px; display: table-cell;vertical-align: middle; text-align: center;" class="iconfonts">&#xe683;</i>--}}
                            {{--<img src="{{ asset('static/home/images/avatar.jpg') }}" alt="" class="info-link_img">--}}
                        {{--</div>--}}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-update">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop