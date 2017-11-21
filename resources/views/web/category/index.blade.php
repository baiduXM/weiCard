@extends('web.common.layout')
@section('title', '栏目管理')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.category') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">栏目管理</a>
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
                    <th class="b-phone-w2"><a href="">序号</a></th>
                    <th class=" "><a href="">名称</a></th>
                    <th class="b-phone-w2"><a href="">外链</a></th>
                    <th class=" b-td-hide"><a href="">图标</a></th>
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th><!--适应手机-->
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($categorys))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($categorys as $item)
                        <tr class="{{ $item->user_id == Auth::id() ? 'info' : '' }}">
                            <td class="b-phone-w"><input type="checkbox" id="{{ $item->id }}">
                                <label for="{{ $item->id }}" class="iconFont"><i>&#xe7de;</i></label>
                            </td>
                            <td class="b-phone-w2">{{ $item->sort }}</td>
                            <td class="">{{ $item->category_name }}</td>
                            @if($item->is_link=='0'&&$item->category_id!='0')
                                <td class="b-td-width b-td-hide"style="color: red;">系统栏目，外链已关闭，使用默认功能</td>
                            @else
                                @if($item->category_id=='1'||$item->category_id=='2'||$item->category_id=='3'||$item->category_id=='4'||$item->category_id=='5')
                                    <td class="b-td-width b-td-hide"style="color: red;">系统栏目，开启外链{{ $item->category_url }}</td>
                                @else
                                  <td class="b-td-width b-td-hide">{{ $item->category_url }}</td>
                                @endif
                            @endif
                            <td class="b-td-width b-td-hide"><i style="font-size: 30px;" class="iconfonts">{{ $item->category_img.';' }}</i> </td>
                            <td class="b-td-icon b-td-hide w-icon">
                                {{--<a href="" data-toggle="modal" data-target="#modal-employee-show"--}}
                                   {{--class="operate-show"--}}
                                   {{--data-url="{{ url('company/category/'.$item->id) }}"><i--}}
                                            {{--class="iconFont">&#xe613;</i></a>--}}
                                @if(Auth::user()->company)
                                    @if($item->category_id=='1'||$item->category_id=='2'||$item->category_id=='3'||$item->category_id=='4'||$item->category_id=='5')
                                        <a href="" data-toggle="modal" data-target="#modal-employee-edit4"
                                           data-url="{{ url('company/category/'.$item->id) }}" class="operate-edit4"><i
                                                    class="iconFont">&#xe632;</i></a>
                                    @else
                                    <a href="" data-toggle="modal" data-target="#modal-employee-edit3"
                                       data-url="{{ url('company/category/'.$item->id) }}" class="operate-edit3"><i
                                                class="iconFont">&#xe632;</i></a>
                                    @endif
                                    {{--<a href="javascript:void(0);" class="operate-share"--}}
                                    {{--data-url="{{ url('cardcase/follow/e-'.$item->id) }}"><i class="iconFont">&#xe921;</i></a>--}}
                                    @if($item->category_id=='1'||$item->category_id=='2'||$item->category_id=='3'||$item->category_id=='4'||$item->category_id=='5')
                                    @else
                                        <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                           class="operate-delete"
                                           data-url="{{ url('company/category/'.$item->id) }}">
                                            <i class="iconFont">&#xe6d3;</i></a>
                                    @endif
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
            {!! $categorys ? $categorys->render() : '' !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <!-- 栏目 - 添加modal -->
    <div class="modal fade" id="modal-product-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加栏目</h4>
                </div>
                <form action="{{ url('company/category') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Category[category_name]" placeholder=""
                                       value="{{ old('Category.category_name') ? old('Category.category_name') : '' }}">
                                <span class="error-category_name" style="color: red;"></span>
                            </p>
                            {{--<p>--}}
                                {{--<span>是否开启外链 : </span>--}}
                                {{--<select class="" id="" name="Category[is_link]">--}}
                                    {{--<option value="">是否开启外链</option>--}}
                                        {{--<option {{ old('Category.is_link') == '0' ? 'selected' : '' }}--}}
                                                {{--value="0">关闭</option>--}}
                                          {{--<option {{ old('Category.is_link') == '1' ? 'selected' : '' }}--}}
                                            {{--value="1">开启</option>--}}
                                {{--</select>--}}
                            {{--</p>--}}
                            <p>
                                <span>外链 : </span>
                                <input type="text" name="Category[category_url]" placeholder=""
                                       value="{{ old('Category.category_url') ? old('Category.category_url') : '' }}">
                                <span class="error-category_url" style="color: red;"></span>
                            </p>

                            <p>
                                <span>序号 : </span>
                                <input type="text" name="Category[sort]" placeholder=""
                                       value="{{ old('Category.sort') ? old('Category.sort') : '999' }}">
                                {{--<em style="color: red;">提示：1-5为默认序号，新增请从序号6开始填写！</em>--}}
                                <span class="error-sort" style="color: red;"></span>

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
                                <input id="inputIcons" type="hidden" value="{{ old('Category.category_img') ? old('Category.category_img') : '' }}" name="Category[category_img]">
                                <span class="error-category_img" style="color: red;"></span>
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

    <!-- 栏目 - 查看modal -->
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
                        <p><span>名称 : </span><input type="text" name="info-category_name" value="" readonly></p>
                        <p><span>外链 : </span><input type="text" name="info-category_url" value="" readonly></p>
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
    <!-- 栏目 - 编辑modal -->

    <div class="modal fade" id="modal-employee-edit3" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">编辑栏目</h4>
                </div>
                <form onsubmit="submitTest()" action="" method="post" class="form-update3"
                      enctype="multipart/form-data">
                    {{--{{ method_field('put') }}--}}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Category[category_name]" placeholder="" class="info-category_name"
                                       value="{{ old('Category.category_name') ? old('Category.category_name') : '' }}">
                                <span class="error-category_name" style="color: red;"></span>
                            </p>
                            {{--<p>--}}
                                {{--<span>是否开启外链 : </span>--}}
                                {{--<select class="info-is_link" id="" name="Category[is_link]">--}}
                                    {{--<option value="">是否开启外链</option>--}}
                                    {{--<option {{ old('Category.is_link') == '0' ? 'selected' : '' }}--}}
                                            {{--value="0">关闭</option>--}}
                                    {{--<option {{ old('Category.is_link') == '1' ? 'selected' : '' }}--}}
                                            {{--value="1">开启</option>--}}
                                {{--</select>--}}
                            {{--</p>--}}
                            <p>
                                <span>外链 : </span>
                                <input type="text" name="Category[category_url]" placeholder="" class="info-category_url"
                                       value="{{ old('Category.category_url') ? old('Category.category_url') : '' }}">
                                <span class="error-category_url" style="color: red;"></span>
                            </p>
                            <p>
                                <span>序号 : </span>
                                <input type="text" name="Category[sort]" placeholder="" class="info-sort"
                                       value="{{ old('Category.sort') ? old('Category.sort') : '' }}">
                                <span class="error-sort" style="color: red;"></span>
                            </p>
                            {{--<p>--}}
                                {{--<span>系统栏目 : </span>--}}
                                {{--<input type="text" name="Link[default_link]" placeholder="" class="info-default_link"--}}
                                       {{--value="{{ old('Link.default_link') ? old('Link.default_link') : '' }}">--}}
                                {{--<span class="error-default_link" style="color: red;"></span>--}}
                            {{--</p>--}}
                            {{--<p>--}}
                                {{--<span>图标 : </span>--}}
                                {{--<input type="file" name="Link[link_img]" placeholder="">--}}
                                {{--<span class="error-link_img" style="color: red;"></span>--}}
                            {{--</p>--}}

                            <p style="text-align: left; line-height: 40px; position: relative">
                                <span style="line-height: 40px; float: left;">图标 : </span>
                                <i id="iconStart1" style="font-size:28px; padding-left: 10px;" class="iconfonts"> </i>
                                <em><i id="iconId1" style="font-size: 28px;" class="iconfonts">&#xe6ab;</i></em><span>请选择图标</span>
                                <input id="inputIcons1" type="hidden" value="{{ old('Category.category_img') ? old('Category.category_img') : '' }}" name="Category[category_img]">
                                <span class="error-category_img" style="color: red;"></span>
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
                        <button type="button" class="btn btn-primary operate-update3">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 栏目 - 编辑modal4 -->
    <div class="modal fade" id="modal-employee-edit4" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">编辑栏目</h4>
                </div>
                <form action="" method="post" class="form-update4"
                      enctype="multipart/form-data">
                    {{--{{ method_field('put') }}--}}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Category[category_name]" placeholder="" class="info-category_name"
                                       value="{{ old('Category.category_name') ? old('Category.category_name') : '' }}">
                                <span class="error-category_name" style="color: red;"></span>
                            </p>
                            <p>
                            <span>是否开启外链 : </span>
                            <select class="info-is_link" id="" name="Category[is_link]">
                            {{--<option value="">是否开启外链</option>--}}
                            <option {{ old('Category.is_link') == '0' ? 'selected' : '' }}
                            value="0">关闭</option>
                            <option {{ old('Category.is_link') == '1' ? 'selected' : '' }}
                            value="1">开启</option>
                            </select>
                            </p>
                            <p>
                                <span>外链 : </span>
                                <input type="text" name="Category[category_url]" placeholder="" class="info-category_url"
                                       value="{{ old('Category.category_url') ? old('Category.category_url') : '' }}">
                                <span class="error-category_url" style="color: red;"></span>
                            </p>
                            <p>
                                <span>序号 : </span>
                                <input type="text" name="Category[sort]" placeholder="" class="info-sort"
                                       value="{{ old('Category.sort') ? old('Category.sort') : '' }}">
                                <span class="error-sort" style="color: red;"></span>
                            </p>
                            {{--<p>--}}
                            {{--<span>系统栏目 : </span>--}}
                            {{--<input type="text" name="Link[default_link]" placeholder="" class="info-default_link"--}}
                            {{--value="{{ old('Link.default_link') ? old('Link.default_link') : '' }}">--}}
                            {{--<span class="error-default_link" style="color: red;"></span>--}}
                            {{--</p>--}}
                            {{--<p>--}}
                            {{--<span>图标 : </span>--}}
                            {{--<input type="file" name="Link[link_img]" placeholder="">--}}
                            {{--<span class="error-link_img" style="color: red;"></span>--}}
                            {{--</p>--}}

                            <p style="text-align: left; line-height: 40px; position: relative">
                                <span style="line-height: 40px; float: left;">图标 : </span>
                                <i id="iconStart4" style="font-size:28px; padding-left: 10px;" class="iconfonts"> </i>
                                <em><i id="iconId4" style="font-size: 28px;" class="iconfonts">&#xe6ab;</i></em><span>请选择图标</span>
                                <input id="inputIcons4" type="hidden" value="{{ old('Category.category_img') ? old('Category.category_img') : '' }}" name="Category[category_img]">
                                <span class="error-category_img" style="color: red;"></span>
                            <div id="selIcon4" style="display:none; position: absolute; width:400px;top:174px; height: 180px; background: #999;">


                                @if(!count($icons))
                                    无图标
                                @else
                                    @foreach($icons as $item)
                                        <span class="selSpan"name="{{ $item->icon_name}}"><i class="iconfonts">{{ $item->icon_name.';' }}</i></span>
                                    @endforeach
                                @endif
                            </div>
                            <style>
                                #selIcon4{ padding:10px;}
                                #selIcon4 span{ display: inline-block; line-height: 24px; padding:0 6px;}
                                #selIcon4 span i{ font-size: 24px;}
                            </style>

                            </p>

                        </div>
                        {{--<div class="modal-address-img" style="display: inline-table;">--}}
                        {{--<i style="font-size: 50px; display: table-cell;vertical-align: middle; text-align: center;" class="iconfonts">&#xe683;</i>--}}
                        {{--<img src="{{ asset('static/home/images/avatar.jpg') }}" alt="" class="info-link_img">--}}
                        {{--</div>--}}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-update4">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop