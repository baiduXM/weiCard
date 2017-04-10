@extends('admin.common.layout')
@section('title', '修改资料')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.company.edit', $company->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="{{ url('admin/company/' . $company->id) }}" method="post"
                          enctype="multipart/form-data">
                        {{ method_field('put') }}
                        {{ csrf_field() }}
                        <div class="form-group {{ $errors->has('Company.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name"><span class="text-danger">*</span>
                                公司名</label>
                            <div class="col-md-6">
                                <input id="name" name="Company[name]" type="text" placeholder="输入公司名" readonly
                                       class="form-control"
                                       value="{{ old('Company.name') ? old('Company.name') : $company->name }}">
                            </div>
                            @if ($errors->has('Company.name'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.name') }}</strong>
                                </span>
                            @endif
                        </div><!-- name公司名 -->
                        <div class="form-group {{ $errors->has('Company.code') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="code"><span class="text-danger">*</span>
                                公司代码</label>
                            <div class="col-md-6">
                                <input id="code" name="Company[code]" type="text" placeholder="公司代码" readonly
                                       class="form-control"
                                       value="{{ old('Company.code') ? old('Company.code') : $company->code }}">
                            </div>
                            @if ($errors->has('Company.code'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.code') }}</strong>
                                </span>
                            @endif
                        </div><!-- code公司代码 -->
                        <div class="form-group {{ $errors->has('Company.user_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="user_id"><span class="text-danger">*</span>
                                公司注册人id</label>
                            <div class="col-md-6">
                                <input id="user_id" name="Company[user_id]" type="number" placeholder="公司注册人" readonly
                                       class="form-control"
                                       value="{{ old('Company.user_id') ? old('Company.user_id') : $company->user_id }}">
                            </div>
                            @if ($errors->has('Company.user_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.user_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- user_id公司注册人id -->
                        <div class="form-group {{ $errors->has('Company.logo') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="logo">Logo</label>
                            <div class="col-md-6">
                                <input id="logo" name="Company[logo]" type="file">
                            </div>
                            @if ($errors->has('Company.logo'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.logo') }}</strong>
                                </span>
                            @endif
                        </div><!-- logo公司Logo -->
                        @if ($company->logo)
                            <div class="form-group">
                                <div class="col-md-2 col-md-offset-3">
                                    <img src="{{ asset($company->logo) }}" class="img-responsive">
                                </div>
                            </div><!-- logo公司LOGO img显示 -->
                        @endif
                        <div class="form-group {{ $errors->has('Company.email') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="email">公司邮箱</label>
                            <div class="col-md-6">
                                <input id="email" name="Company[email]" type="text" placeholder="输入公司邮箱"
                                       class="form-control"
                                       value="{{ old('Company.email') ? old('Company.email') : $company->email }}">
                            </div>
                            @if ($errors->has('Company.email'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.email') }}</strong>
                                </span>
                            @endif
                        </div><!-- email公司邮箱 -->
                        <div class="form-group {{ $errors->has('Company.telephone') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="telephone">公司电话</label>
                            <div class="col-md-6">
                                <input id="telephone" name="Company[telephone]" type="text" placeholder="输入公司电话"
                                       class="form-control" value="{{ old('Company.telephone') }}">
                            </div>
                            @if ($errors->has('Company.telephone'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.telephone') }}</strong>
                                </span>
                            @endif
                        </div><!-- telephone公司电话 -->
                        <div class="form-group {{ $errors->has('Company.address') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="address">公司地址</label>
                            <div class="col-md-6">
                                <input id="address" name="Company[address]" type="text" placeholder="输入公司地址"
                                       class="form-control" value="{{ old('Company.address') }}">
                            </div>
                            @if ($errors->has('Company.address'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.address') }}</strong>
                                </span>
                            @endif
                        </div><!-- address公司地址 -->
                        <div class="form-group {{ $errors->has('Company.description') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="description">公司简介</label>
                            <div class="col-md-6">
                                <textarea id="description" name="Company[description]" class="form-control"
                                          rows="3" placeholder="个性签名">{{ old('Company.description') }}</textarea>
                            </div>
                            @if ($errors->has('Company.password_confirmation'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.password_confirmation') }}</strong>
                                </span>
                            @endif
                        </div><!-- description公司简介 -->
                        <div class="form-group {{ $errors->has('Company.manager_id') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="manager_id">公司审核人id</label>
                            <div class="col-md-6">
                                <input id="manager_id" name="Company[manager_id]" type="number" placeholder="公司审核人"
                                       class="form-control" value="{{ old('Company.manager_id') }}">
                            </div>
                            @if ($errors->has('Company.manager_id'))
                                <span class="help-block col-md-3">
                                    <strong>{{ $errors->first('Company.manager_id') }}</strong>
                                </span>
                            @endif
                        </div><!-- manager_id公司审核人id -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="status">审核状态</label>
                            <div class="col-md-6">
                                @foreach($user->isActive() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="User[is_active]" value="{{ $item }}"
                                            @if(old('User.is_active') === null)
                                                {{ $user->is_active == $item ? 'checked' : '' }}
                                                    @else
                                                {{ old('User.is_active') == $item ? 'checked' : '' }}
                                                    @endif
                                            >{{ $value }}
                                        </label>
                                    </div>
                                @endforeach

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


                        <div class="form-group">
                            <label class="col-md-3 control-label" for="is_admin">管理员</label>
                            <div class="col-md-6">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="User[is_admin]" value="1"
                                        @if(old('User.is_admin') === null)
                                            {{ $user->is_admin == 1 ? 'checked' : '' }}
                                                @else
                                            {{ old('User.is_admin') == 1 ? 'checked' : '' }}
                                                @endif
                                        >是
                                    </label>
                                </div>
                            </div>
                        </div><!-- is_admin是否是管理员 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="is_active">账号状态</label>
                            <div class="col-md-6">
                                @foreach($user->isActive() as $item => $value)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="User[is_active]" value="{{ $item }}"
                                            @if(old('User.is_active') === null)
                                                {{ $user->is_active == $item ? 'checked' : '' }}
                                                    @else
                                                {{ old('User.is_active') == $item ? 'checked' : '' }}
                                                    @endif
                                            >{{ $value }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                        </div><!-- is_active是否可用 -->
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <button type="reset" class="btn btn-warning btn-md">重置</button>
                                <a href="{{ url('admin/user') }}" type="button" role="button"
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
        //        $('#modifyPassword').click(function () {

        $('#modifyPassword').popover({
            'trigger': 'click',
        });
        //        });
    </script>
@stop