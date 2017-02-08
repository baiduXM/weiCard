@extends('layouts.admin')
@section('title', '用户管理')
@section('content')
    @parent
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">

                <div class="panel-heading"><h2 class="sub-header">用户列表</h2></div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#编号</th>
                            <th>用户名</th>
                            <th>邮箱</th>
                            <th>权限</th>
                            <th>创建时间</th>
                            <th>最后登录时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($users as $user)
                            <tr>
                                <td>{{ $user->id }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>{{ $user->privilege($user->privilege) }}</td>
                                <td>{{ $user->created_at }}</td>
                                <td>{{ $user->updated_at }}</td>
                                <td><span><a href="">详情</a></span> - <span><a href="">修改</a></span> - <span><a href="">删除</a></span>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div class="pull-left">
                        {{--{{ $users->render() }}--}}
                        {{ $users->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
@stop
@section('javascript')
    <script>
        !function ($) {
            $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
                $(this).find('em:first').toggleClass("glyphicon-minus");
            });
            $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
        }(window.jQuery);

        $(window).on('resize', function () {
            if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
        })
        $(window).on('resize', function () {
            if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
        })
    </script>
@stop




