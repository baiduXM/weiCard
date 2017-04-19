@extends('admin.common.layout')
@section('title', '首页')
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">首页</h1>
        </div>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">系统信息</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th class="text-right col-sm-3">服务器软件</th>
                                <td class="col-md-9">{{ $_SERVER["SERVER_SOFTWARE"] }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">主页</th>
                                <td class="col-md-9">{{ $_SERVER["HTTP_HOST"] }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">IP</th>
                                <td class="col-md-9">{{ $_SERVER["SERVER_ADDR"] }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">端口</th>
                                <td class="col-md-9">{{ $_SERVER["SERVER_PORT"] }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">访问目录</th>
                                <td class="col-md-9">{{ $_SERVER["DOCUMENT_ROOT"] }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">参数</th>
                                <td class="col-md-9">{{ $_SERVER["REDIRECT_URL"] }}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->




@stop

@section('javascript')
    <script>
    </script>
@stop