@extends('layouts.admin')
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
                    <fieldset>
                    <!-- Name input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="name">用户名</label>
                            <div class="col-md-9">
                                <input id="name" name="user[name]" type="text" placeholder="Your name"
                                       class="form-control" value="{{ $user->name }}">
                            </div>
                        </div>

                        <!-- Email input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="email">邮箱</label>
                            <div class="col-md-9">
                                <input id="email" name="user[email]" type="text" placeholder="Your email"
                                       class="form-control" value="{{ $user->email }}">
                            </div>
                        </div>

                        <!-- Email input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="email">密码</label>
                            <div class="col-md-9">
                                <a href="" type="button" class="btn btn-default btn-md pull-left">修改密码</a>
                            </div>
                        </div>

                        <!-- Message body -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="message">权限</label>
                            <div class="col-md-9">
                                @foreach($user->privilege() as $ind => $val)
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="user[privilege]"
                                                   value="{{ $ind }}">{{ $val }}
                                        </label>
                                    </div>
                                @endforeach
                            </div>
                        </div>

                        <!-- Form actions -->
                        <div class="form-group">
                            <div class="col-md-6 widget-left">
                                <button type="submit" class="btn btn-default btn-md pull-right">Submit</button>
                            </div>
                        </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop