@extends('admin.common.layout')
@section('title', '审核资料')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.company.verified', $company->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">审核资料</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/company/' . $company->id . '/verified') }}"
                          method="post"
                          enctype="multipart/form-data">
                        {{ method_field('put') }}
                        {{ csrf_field() }}
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="status">审核状态</label>
                            <div class="col-md-6">
                                @foreach($company->getStatus() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="Company[status]" value="{{ $item }}"
                                            @if(old('Company.status') === null)
                                                {{ $company->status == $item ? 'checked' : '' }}
                                                    @else
                                                {{ old('Company.status') == $item ? 'checked' : '' }}
                                                    @endif
                                            >{{ $value }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                        </div><!-- status审核状态 -->
                        <div class="form-group {{ $errors->has('Company.reason') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="reason">失败原因</label>
                            <div class="col-md-6">
                                <textarea id="reason" name="Company[reason]" class="form-control"
                                          rows="3" placeholder="审核失败原因">{{ old('Company.reason') }}</textarea>
                            </div>
                            @if ($errors->has('Company.reason'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.reason') }}</strong>
                                </span>
                            @endif
                        </div><!-- reason失败原因 -->
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <button type="reset" class="btn btn-warning btn-md">重置</button>
                                <a href="{{ url('admin/company') }}" type="button" role="button"
                                   class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th class="text-right col-md-3">ID</th>
                                <td class="col-md-9">{{ $company->id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right col-md-3">公司名称</th>
                                <td class="col-md-9">{{ $company->name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司显示名称</th>
                                <td>{{ $company->display }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">LOGO</th>
                                <td>
                                    <img src="{{ $company->logo ? asset($company->logo) : ''}}" class="img-responsive"
                                         style="max-height: 200px;max-width: 200px;">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">公司地址</th>
                                <td>{{ $company->address }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司电话</th>
                                <td>{{ $company->telephone }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司简介</th>
                                <td>{{ $company->description }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">注册人ID</th>
                                <td>{{ $company->user_id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">激活状态</th>
                                <td>
                                    @if($company->is_active == 1)
                                        <span class="label label-success">{{ $common->isActive($company->is_active) }}</span>
                                    @else
                                        <span class="label label-default">{{ $common->isActive($company->is_active) }}</span>
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">审核状态</th>
                                <td>
                                    @if($company->status == 0)
                                        <span class="label label-primary">{{ $company->getStatus($company->status) }}</span>
                                    @elseif($company->status == 1)
                                        <span class="label label-success">{{ $company->getStatus($company->status) }}</span>
                                    @elseif($company->status == 2)
                                        <span class="label label-default">{{ $company->getStatus($company->status) }}</span>
                                    @elseif($company->status == 3)
                                        <span class="label label-warning">{{ $company->getStatus($company->status) }}</span>
                                    @endif
                                    {{--                                    {{ $company->getStatus($company->status) }}--}}
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $company->created_at }}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop
@section('javascript')
    <script>
    </script>
@stop