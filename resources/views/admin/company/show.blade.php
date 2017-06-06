@extends('admin.common.layout')
@section('title', '公司详情')
@section('breadcrumb')
    {!! Breadcrumbs::render('admin.company.show', $company->id) !!}
@stop
@section('content')
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">详细信息</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered">
                            <tr>
                                <th class="text-right col-sm-3">ID</th>
                                <td class="col-md-9">{{ $company->id }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司名称</th>
                                <td class="">{{ $company->name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">公司显示名称</th>
                                <td>{{ $company->display_name }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">员工人数上限</th>
                                <td>{{ $company->limit }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">LOGO</th>
                                <td>
                                    <img src="{{ $company->logo ? asset($company->logo) : ''}}" class="img-responsive"
                                         style="max-height: 200px;max-width: 200px;">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-right">公司主页</th>
                                <td><a href="{{ $company->homepage }}" target="_blank">{{ $company->homepage }}</a></td>
                            </tr>
                            <tr>
                                <th class="text-right">公司邮箱</th>
                                <td>{{ $company->email }}</td>
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
                                <th class="text-right">注册人</th>
                                <td>{!! isset($company->user_id) ? '<a href="'.url('admin/user/'.$company->user->id).'">'.$company->user->name .'</a>' : '' !!}</td>
                            </tr>
                            <tr>
                                <th class="text-right">审核人</th>
                                <td>{!! isset($company->manager_id) ? '<a href="'.url('admin/manager/'.$company->manager->id).'">'.$company->manager->name .'</a>' : '' !!}</td>
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
                                <th class="text-right">审核失败原因</th>
                                <td>{{ $company->reason }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">审核时间</th>
                                <td>{{ $company->verified_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">创建时间</th>
                                <td>{{ $company->created_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">更新时间</th>
                                <td>{{ $company->updated_at }}</td>
                            </tr>
                            <tr>
                                <th class="text-right">删除时间</th>
                                <td>{{ $company->deleted_at }}</td>
                            </tr>
                        </table>
                        <div class="form-group">
                            <div class="col-md-12 widget-left">
                                @if($company->status != $company::VERIFIED_SUCCEED)
                                    <a href="{{ url('admin/company/' . $company->id . '/verified') }}" type="button"
                                       class="btn btn-success btn-md">审核</a>
                                @endif
                                <a href="{{ url('admin/company/' . $company->id . '/edit') }}" type="button"
                                   class="btn btn-primary btn-md">编辑</a>
                                <a href="{{ url()->previous() == url()->current() ? url('admin/company') : url()->previous() }}"
                                   role="button" class="btn btn-danger btn-md">返回</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/.col-->
    </div><!--/.row-->
@stop
@section('javascript')
    <script>
        $(".verify-failed").click(function () {
            alert({{ $company->id }});
        });
    </script>
@stop