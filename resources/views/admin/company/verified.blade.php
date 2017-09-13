@extends('admin.common.layout')
@section('title', '审核资料')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.company.verified', $company->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">审核资料</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('mpmanager/company/' . $company->id . '/verified') }}"
                          method="post" enctype="multipart/form-data">
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
                                <a href="{{ url()->previous() == url()->current() ? url('mpmanager/company') : url()->previous() }}"
                                   role="button"
                                   class="btn btn-danger btn-md">返回</a>
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