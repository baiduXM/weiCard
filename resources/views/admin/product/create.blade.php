@extends('admin.common.layout')
@section('title', '添加产品')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.product') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/company_product') }}" method="post"
                          enctype="multipart/form-data">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('Product.company_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="company_id"><span class="text-danger">*</span>
                                公司</label>
                            <div class="col-md-6">
                                <select class="form-control" id="company_id" name="Product[company_id]">
                                    <option value="">选择公司</option>
                                    @foreach($companies as $company)
                                        <option {{ old('Product.company_id') == $company->id ? 'selected' : '' }}
                                                value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
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
                                       class="form-control" value="{{ old('Product.product_name') }}">
                            </div>
                            @if ($errors->has('Product.product_name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Product.product_name') }}</strong>
                                </span>
                            @endif
                        </div><!-- product_name产品名称 -->

                        <div class="form-group {{ $errors->has('Product.product_url') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="product_url"><span class="text-danger">*</span>
                                产品链接</label>
                            <div class="col-md-6">
                                <input id="product_url" name="Product[product_url]" type="text" placeholder=""
                                       class="form-control" value="{{ old('Product.product_url') }}">
                            </div>
                            @if ($errors->has('Product.product_url'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Product.product_url') }}</strong>
                                </span>
                            @endif
                        </div><!-- product_url产品链接 -->

                        <div class="form-group {{ $errors->has('Product.product_img') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="product_img">产品图片</label>
                            <div class="col-md-6">
                                <input id="product_img" name="Product[product_img]" type="file">
                            </div>
                            @if ($errors->has('Product.product_img'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Product.product_img') }}</strong>
                                </span>
                            @endif
                        </div><!-- avatar产品图片 -->

                        


                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
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