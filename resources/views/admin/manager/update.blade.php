@extends('admin.common.admin')
@section('title', '修改用户')
@section('breadcrumb')
    {!! Breadcrumbs::render('update', $user->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">修改信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="" method="post">
                        {{ csrf_field() }}

                        <div class="form-group {{ $errors->has('User.name') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="name">用户名</label>
                            <div class="col-md-6">
                                <input id="name" name="User[name]" type="text" placeholder="输入用户名(6~20个字符)"
                                       class="form-control" value="{{ old('User.name') ? old('User.name') : $user->name }}">
                            </div>
                            @if ($errors->has('User.name'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('User.name') }}</strong>
                                    </span>
                            @endif
                        </div>

                        <div class="form-group {{ $errors->has('User.email') ? ' has-error' : '' }}">
                            <label class="col-md-3 control-label" for="email">邮箱</label>
                            <div class="col-md-6">
                                <input id="email" name="User[email]" type="text" placeholder="输入邮箱"
                                       class="form-control" value="{{ old('User.email') ? old('User.email') : $user->email }}">
                            </div>
                            @if ($errors->has('User.email'))
                                <span class="help-block col-md-3">
                                        <strong>{{ $errors->first('User.email') }}</strong>
                                    </span>
                            @endif
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label" for="email">密码</label>
                            <div class="col-md-9">
                                <button id="modifyPassword" type="button" class="btn btn-default" data-container="body"
                                        data-toggle="popover" data-placement="right"
                                        data-content="暂时无法修改密码">修改密码
                                </button>

                                {{--<a href="" type="button" class="btn btn-default btn-md pull-left">修改密码</a>--}}
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label" for="message">权限</label>
                            <div class="col-md-6">
                                @foreach($user->role() as $ind => $val)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="User[role]" value="{{ $ind }}"
                                                    {{ $user->role == $ind ? 'checked' : '' }}>{{ $val }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                        </div>

                        <!-- Form actions -->
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                <button type="submit" class="btn btn-primary btn-md">确认</button>
                                <a href="{{ url('admin/user') }}" type="button"
                                   class="btn btn-default btn-md">返回</a>
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