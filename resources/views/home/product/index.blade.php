@extends('home.common.layout')
@section('title', '产品')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.product') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">公司产品</a>
            </li>
        </ul>

        <div class="myCard-content rt-main">
            @if(Auth::user()->company)
                <ul class="b-button">
                    {{--<li class="b-btn-bg"><a href=""><i class="iconFont">&#xe6d3;</i>批量删除</a></li>--}}
                    {{--<li class="b-btn-bg"><a href=""><i class="iconFont">&#xe67d;</i>批量添加</a></li>--}}
                    {{--<li class="b-btn-bg"><a href="javascript:">导入excel</a></li>--}}
                    <li class="b-btn-bg"><a href="" data-toggle="modal" data-target="#modal-employee-add"><i
                                    class="iconFont">&#xe67d;</i>添加</a>
                    </li>
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
            @endif
            <table class="table b-table table-hover">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="box9"><label for="box9" class="iconFont"><i>&#xe7de;</i></label>
                    </th>
                    <th class="b-phone-w2"><a href="">#</a></th>
                    <th class=" "><a href="">产品</a></th>
                    <th class="b-phone-w2"><a href="">链接</a></th>
                    <th class=" b-td-hide"><a href="">图片</a></th>
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th><!--适应手机-->
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($product))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($product as $item)
                        <tr class="{{ $item->user_id == Auth::id() ? 'info' : '' }}">
                            <td class="b-phone-w"><input type="checkbox" id="box10">
                                <label for="box10" class="iconFont"><i>&#xe7de;</i></label>
                            </td>
                            <td class="b-phone-w2">{{ $item->id }}</td>
                            <td class="">{{ $item->product_name }}</td>
                            <td class="b-td-width b-td-hide">{{ $item->product_url }}</td>
                            <td class="b-td-width b-td-hide">{{ $item->product_img }}</td>
                            <td class="b-td-icon b-td-hide w-icon">
                                <a href="" data-toggle="modal" data-target="#modal-employee-show"
                                   class="operate-show"
                                   data-url="{{ url('company/product/'.$item->id) }}"><i
                                            class="iconFont">&#xe613;</i></a>
                                @if(Auth::user()->company)
                                    <a href="" data-toggle="modal" data-target="#modal-employee-edit"
                                       data-url="{{ url('company/product/'.$item->id) }}" class="operate-edit"><i
                                                class="iconFont">&#xe632;</i></a>
                                    {{--<a href="javascript:void(0);" class="operate-share"--}}
                                    {{--data-url="{{ url('cardcase/follow/e-'.$item->id) }}"><i class="iconFont">&#xe921;</i></a>--}}
                                    <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                       class="operate-delete"
                                       data-url="{{ url('company/product/'.$item->id) }}">
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
                {!! $product ? $product->render() : '' !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <!-- 员工 - 添加modal -->
    <div class="modal fade" id="modal-employee-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加公司产品</h4>
                </div>
                <form action="{{ url('company/product') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>产品名称 : </span>
                                <input type="text" name="Product[product_name]" placeholder=""
                                       value="{{ old('Product.product_name') ? old('Product.product_name') : '' }}">
                                <span class="error-product_name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>产品链接 : </span>
                                <input type="text" name="Product[product_url]" placeholder=""
                                       value="{{ old('Product.product_url') ? old('Product.product_url') : '' }}">
                                <span class="error-product_url" style="color: red;"></span>
                            </p>
                            <p>
                                <span>产品图片 : </span>
                                <input type="file" name="Product[avatar]" placeholder="公司名称">
                                <span class="error-avatar" style="color: red;"></span>
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
                        <p><span>产品名称 : </span><input type="text" name="info-product_name" value="" readonly></p>
                        <p><span>产品链接 : </span><input type="text" name="info-product_url" value="" readonly></p>
                    </div>
                    <div class="modal-address-img">
                        <img name="info-avatar" src="{{ asset('static/home/images/avatar.jpg') }}" alt="">
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
                    <h4 class="modal-title">编辑公司产品</h4>
                </div>
                <form action="" method="post" class="form-update"
                      enctype="multipart/form-data">
                    {{--{{ method_field('put') }}--}}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>产品名称 : </span>
                                <input type="text" name="Product[product_name]" placeholder="" class="info-product_name"
                                       value="{{ old('Product.product_name') ? old('Product.product_name') : '' }}">
                                <span class="error-product_name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>产品链接 : </span>
                                <input type="text" name="Product[product_url]" placeholder="" class="info-product_url"
                                       value="{{ old('Product.product_url') ? old('Product.product_url') : '' }}">
                                <span class="error-product_url" style="color: red;"></span>
                            </p>
                            <p>
                                <span>产品图片 : </span>
                                <input type="file" name="Product[avatar]" placeholder="公司名称">
                                <span class="error-avatar" style="color: red;"></span>
                            </p>
                            
                        </div>
                        <div class="modal-address-img">
                            <img src="{{ asset('static/home/images/avatar.jpg') }}" alt="" class="info-avatar">
                        </div>
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