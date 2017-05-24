@extends('admin.common.layout')
@section('title', '修改资料')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.product', $product->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">编辑信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/company_product/' . $product->id) }}" method="post"
                          enctype="multipart/form-data">
                        {{ method_field('put') }}
                        {{ csrf_field() }}
                        <div class="form-group {{ $errors->has('Product.company_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="company_id"><span class="text-danger">*</span>
                                公司</label>
                            <div class="col-md-6">
                                <select class="form-control" id="company_id" name="Product[company_id]" readonly>
                                    <option value="{{ $product->company->id }}">{{ $product->company->name }}</option>
                                </select>
                            </div>
                            @if ($errors->has('Product.company_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Product.company_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- company_id公司ID -->

                        <div class="form-group {{ $errors->has('Product.product_name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="product_name"><span class="text-danger">*</span>
                                产品名称</label>
                            <div class="col-md-6">
                                <input id="product_name" name="Product[product_name]" type="text" placeholder=""
                                       class="form-control"
                                       value="{{ old('Product.product_name') ? old('Product.product_name') : $product->product_name }}">
                            </div>
                            @if ($errors->has('Product.product_name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Product.product_name') }}</strong>
                                </span>
                            @endif
                        </div><!-- product_name产品名称 -->

                        <div class="form-group {{ $errors->has('Product.product_url') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="product_url">
                                产品链接</label>
                            <div class="col-md-6">
                                <input id="product_url" name="Product[product_url]" type="text" placeholder=""
                                       class="form-control"
                                       value="{{ old('Product.product_url') ? old('Product.product_url') : $product->product_url }}">
                            </div>
                            @if ($errors->has('Product.product_url'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Product.product_url') }}</strong>
                                </span>
                            @endif
                        </div><!-- product_url产品链接 -->

                        <div class="form-group {{ $errors->has('Product.avatar') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="avatar">头像</label>
                            <div class="col-md-6">
                                <input id="avatar" name="Product[avatar]" type="file">
                            </div>
                            @if ($errors->has('Product.avatar'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Product.avatar') }}</strong>
                                </span>
                            @endif
                        </div><!-- avatar头像 -->
                        @if ($product->avatar)
                            <div class="form-group">
                                <div class="col-md-2 col-md-offset-3">
                                    <img src="{{ asset($product->avatar) }}" class="img-responsive">
                                </div>
                            </div><!-- avatar头像 img显示 -->
                        @endif

                        

                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <button type="reset" class="btn btn-warning btn-md">重置</button>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/company_product') : url()->previous() }}"
                                   role="button" class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop
@section('javascript')
    <script>
    </script>
@stop