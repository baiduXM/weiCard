@extends('layouts.admin')
@section('title', '添加用户')
@section('breadcrumb')
    {!! Breadcrumbs::render('create') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">添加信息</div>
                <div class="panel-body">
                    <form class="form-horizontal" action="" method="post">
                        <!-- Name input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="name">用户名</label>
                            <div class="col-md-9">
                                <input id="name" name="User[name]" type="text" placeholder="Your name"
                                       class="form-control">
                            </div>
                        </div>

                        <!-- Email input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="email">邮箱</label>
                            <div class="col-md-9">
                                <input id="email" name="User[email]" type="text" placeholder="Your email"
                                       class="form-control">
                            </div>
                        </div>

                        <!-- Email input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="password">密码</label>
                            <div class="col-md-9">
                                <input id="password" name="User[password]" type="text" placeholder="Your email"
                                       class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label" for="password">确认密码</label>
                            <div class="col-md-9">
                                <input id="password" name="User[email]" type="text" placeholder="Your email"
                                       class="form-control">
                            </div>
                        </div>

                        <!-- Message body -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="message">权限</label>
                            <div class="col-md-9">
                                @foreach($user->privilege() as $ind => $val)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="User[privilege]"
                                                   value="{{ $ind }}">{{ $val }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        {{ csrf_field() }}
                        <!-- Form actions -->
                        <div class="col-md-12 widget-left">
                            <button type="submit" class="btn btn-primary btn-md">确认</button>
                            <button type="reset" class="btn btn-default btn-md">重置</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop