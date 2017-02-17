@extends('admin.common.admin')
@section('title', '用户管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('user') !!}
@stop
@section('content')
    @parent
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    客服列表
                </div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>用户名</th>
                            <th>邮箱</th>
                            {{--<th>权限</th>--}}
                            <th>创建时间</th>
                            <th>最后登录时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($managers as $manager)
                            <tr>
                                <td>{{ $manager->id }}</td>
                                <td>{{ $manager->name }}</td>
                                <td>{{ $manager->email }}</td>
{{--                                <td>{{ $manager->role($user->role) }}</td>--}}
                                <td>{{ $manager->created_at }}</td>
                                <td>{{ $manager->updated_at }}</td>
                                <td>
                                    <span><a href="{{ url('admin/manager/detail', ['id' => $manager->id]) }}">详情</a></span>
                                    - <span><a href="{{ url('admin/manager/update', ['id' => $manager->id]) }}">修改</a></span>
                                    - <span><a href="{{ url('admin/manager/delete', ['id' => $manager->id]) }}"
                                               onclick="if (confirm('确认删除？') == false) return false;">删除</a></span>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div class="pull-right">
                        {!! $managers->render() !!}
                    </div>

                </div>
            </div>
        </div>
    </div><!--/.row-->
@stop
@section('javascript')
    {{--<script>--}}
        {{--!function ($) {--}}
            {{--$(document).on("click", "ul.nav li.parent > a > span.icon", function () {--}}
                {{--$(this).find('em:first').toggleClass("glyphicon-minus");--}}
            {{--});--}}
            {{--$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");--}}
        {{--}(window.jQuery);--}}

        {{--$(window).on('resize', function () {--}}
            {{--if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')--}}
        {{--})--}}
        {{--$(window).on('resize', function () {--}}
            {{--if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')--}}
        {{--})--}}
    {{--</script>--}}
@stop




