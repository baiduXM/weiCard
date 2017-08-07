@extends('admin.common.layout')
@section('title', '用户管理')
@section('breadcrumb')
    {!! Breadcrumbs::render('mpmanager.user') !!}
@stop
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    用户管理
                </div>
                <div class="panel-body">
                    <div class="bootstrap-table">
                        {{--表单功能栏--}}
                        <div class="fixed-table-toolbar">
                            <div class="columns btn-group pull-left">
                                <button class="btn btn-default operate-batch-delete" type="button"
                                        name="operate-batch-delete" data-url="user/batch"
                                        data-toggle="modal" data-target=".confirmModal" title="删除">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </button>
                                <button class="btn btn-default operate-add" type="button" name="operate-add"
                                        data-url="user/create" title="添加">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                                {{--
                                <button class="btn btn-default operate-add-batch" type="button" name="operate-add-batch"
                                        title="批量添加">
                                    <i class="glyphicon glyphicon-plus-sign"></i>
                                </button>
                                <button class="btn btn-default operate-add-file" type="button" name="operate-add-file"
                                        title="导入文件">
                                    <i class="glyphicon glyphicon-file"></i>
                                </button>
                                --}}
                            </div><!--添加/删除-->
                            <div class="columns btn-group pull-right">
                                <button class="btn btn-default operate-refresh" type="button" name="refresh"
                                        data-url="user" title="重置刷新">
                                    <i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
                            </div><!--显示-->
                            <form name="form_search" action="{{ url('/admin/user') }}" method="get">
                                <div class="input-group pull-right col-md-6">
                                    {{--{{ csrf_field() }}--}}
                                    <div class="input-group-btn btn-group keep-open">
                                        <button name="search_column" type="button"
                                                class="btn btn-default dropdown-toggle"
                                                data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false">用户名
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" id="columnDropdown">
                                            <li><a class="dropdown-item" data-column="nickname" name="column_nickname"
                                                   style="cursor: pointer;">用户名</a></li>
                                            {{--<li><a class="dropdown-item" data-column="name" name="column_name"--}}
                                                   {{--style="cursor: pointer;">用户名</a></li>--}}
                                            <li><a class="dropdown-item" data-column="mobile" name="column_mobile"
                                                   style="cursor: pointer;">手机</a></li>
                                            <li><a class="dropdown-item" data-column="email" name="column_email"
                                                   style="cursor: pointer;">邮箱</a></li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                    <input type="hidden" name="column" value="name"/>
                                    <input class="form-control search" type="text" name="keyword"
                                           placeholder="Search"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default operate-search" type="submit" title="查找">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </form><!--查找-->
                        </div>
                        {{--表单容器--}}
                        <div class="fixed-table-container">
                            <div class="fixed-table-header">
                                <table></table>
                            </div><!--表单头部-->
                            <div class="fixed-table-body">
                                <div class="fixed-table-loading" style="top: 37px; display: none;">
                                    Loading, please wait…
                                </div><!--无内容显示-->
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th class="bs-checkbox " style="width: 36px; ">
                                            <div class="th-inner ">
                                                <input id="btSelectAll" name="btSelectAll" type="checkbox">
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--checkbox-->
                                        <th style="">
                                            <div class="th-inner" data-name="name">用户名</div>
                                            <div class="fht-cell"></div>
                                        </th><!--用户名-->
                                        <th style="">
                                            <div class="th-inner">公司</div>
                                            <div class="fht-cell"></div>
                                        </th><!--公司-->
                                        <th style="">
                                            <div class="th-inner">员工</div>
                                            <div class="fht-cell"></div>
                                        </th><!--员工-->
                                        <th style="">
                                            <div class="th-inner sortable" data-name="is_active">状态
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span>
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--状态-->
                                        <th style="">
                                            <div class="th-inner sortable" data-name="created_at">创建时间
                                                <span class="order">
                                                    <span class="caret" style="margin: 10px 5px;"></span>
                                                </span><!--dropup-->
                                            </div>
                                            <div class="fht-cell"></div>
                                        </th><!--创建时间-->
                                        <th style="">
                                            <div class="th-inner">操作</div>
                                            <div class="fht-cell"></div>
                                        </th><!--操作-->
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($users as $item)
                                        <tr>
                                            <td>
                                                <div class="ckbox ckbox-default">
                                                    <input type="checkbox" name="id" id="id-{{ $item->id }} "
                                                           value="{{ $item->id }}" class="selectall-item">
                                                    <label for="id-{{ $item->id }}"></label>
                                                </div>
                                            </td><!--checkbox-->
                                            <td>{{ $item->nickname }}</td><!--用户名-->
                                            <td>
                                                @if($item->company)
                                                    <a href="{{ url('mpmanager/company/'.$item->company->id) }}">{{ $item->company->display_name }}</a>(管理员)
                                                @elseif($item->employee)
                                                    <a href="{{ url('mpmanager/company/'.$item->employee->company_id) }}">{{ $item->employee->company->display_name }}</a>
                                                @endif
                                            </td>
                                            <!--公司-->
                                            <td>{!! ($item->employee) ? '<a href="'.url('mpmanager/company_employee/'.$item->employee->id).'">'.$item->employee->nickname.'</a>' : '' !!}</td>
                                            <!--员工-->
                                            <td>
                                                <a href="{{ url('mpmanager/user/'. $item->id .'/refresh') }}"
                                                   class="btn btn-xs label {{ $item->is_active == $item::IS_ACTIVE ? 'label-success' : 'label-default' }}"
                                                   title="切换状态">
                                                    <i class="glyphicon glyphicon-repeat"></i>{{ $item->isActive($item->is_active) }}
                                                </a>
                                            </td><!--状态-->
                                            <td>{{ $item->created_at->format('Y-m-d') }}</td><!--创建时间-->
                                            <td>
                                                <a href="{{ url('mpmanager/user/'.$item->id) }}"
                                                   class="btn btn-white btn-xs" title="详情"><i
                                                            class="glyphicon glyphicon-list-alt"></i>详情</a>
                                                <a href="{{ url('mpmanager/user_cardcase/?user_id='.$item->id) }}"
                                                   class="btn btn-white btn-xs" title="名片夹"><i
                                                            class="glyphicon glyphicon-list-alt"></i>名片夹</a>
                                                <a href="{{ url('mpmanager/user/'. $item->id .'/edit') }}"
                                                   class="btn btn-primary btn-xs" title="编辑"><i
                                                            class="glyphicon glyphicon-pencil"></i>编辑</a>
                                                @if(!$item->employee || !$item->employee->company->user_id )
                                                    <a href="" class="btn btn-success btn-xs operate-binding"
                                                       data-toggle="modal" data-target="#bindingModal"
                                                       data-url="user/{{ $item->id }}/binding" title="绑定公司/员工"
                                                       data-type="{{ $item->flag }}">
                                                        <i class=" glyphicon glyphicon-link"></i>绑定</a>
                                                @endif
                                                <a href="" class="btn btn-danger btn-xs operate-delete"
                                                   data-toggle="modal" data-target=".confirmModal"
                                                   data-url="user/{{ $item->id }}" data-info="{{ $item->nickname }} 用户"
                                                   title="删除">
                                                    <i class="glyphicon glyphicon-trash"></i>删除
                                                </a>
                                            </td><!--操作-->
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div><!--表单内容-->
                            <div class="fixed-table-pagination">
                                <div class="pull-right pagination">
                                    {!! $users->render() !!}
                                </div><!--跳转页码-->
                            </div><!--页码-->
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
@stop
@section('modal-extend')
    <div class="modal fade formModal" id="bindingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-describedby="myModalContent">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">绑定公司/员工</h4>
                </div>
                <form action="" method="post">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="" class="control-label">类型:</label>
                            <div class="radio">
                                <label>
                                    <input class="radio-1" type="radio" name="type" value="company">绑定公司
                                </label>
                                <label>
                                    <input class="radio-2" type="radio" name="type" value="employee"> 绑定员工
                                </label>
                            </div>
                        </div>
                        <div class="form-group {{ $errors->has('code') ? ' has-error' : '' }}">
                            <label for="code" class="control-label">绑定码:</label>
                            <input type="text" class="form-control" id="code" name="code"
                                   placeholder="公司账号/员工手机" value="{{ old('code') }}">
                            @if ($errors->has('code'))
                                <span class="help-block col-md-3">
                                <strong>{{ $errors->first('code') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary ">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- 绑定模态框bindingModal -->
@stop
@section('javascript')
    <script>
        $(function () {
            /* 用户绑定公司 */
            $(".operate-binding").unbind('click').on('click', function () {
                $('#bindingModal').unbind('show.bs.modal').on('show.bs.modal', function (event) {
                    var relatedTarget = $(event.relatedTarget);
                    var _url          = relatedTarget.data('url');
                    var _type         = relatedTarget.data('type');
                    var modal         = $(this);
                    modal.find('form').attr('action', _url);
                    if (_type == 0) {
                        modal.find('.radio-1').attr('checked', true);
                        modal.find('.radio-1').removeAttr('disabled');
                        modal.find('.radio-2').removeAttr('disabled');

                    }
                    if (_type == 1) {
                        modal.find('.radio-1').attr('disabled', true);
                        modal.find('.radio-2').removeAttr('disabled');
                        modal.find('.radio-2').attr('checked', true);

                    }
                    if (_type == 2) {
                        modal.find('.radio-2').attr('disabled', true);
                        modal.find('.radio-1').removeAttr('disabled');
                        modal.find('.radio-1').attr('checked', true);
                    }
                });
            });
        });
    </script>
@stop




