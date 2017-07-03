@extends('web.common.layout')
@section('title', '公司')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.department') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">公司部门</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <p class="phone-show add-yg">公司部门</p>
            <ul class="b-button">
                <li class="b-btn-bg"><a href="javascript:" data-toggle="modal" data-target="#modal-department-add"><i
                                class="iconFont">&#xe67d;</i>添加</a>
                </li>
            </ul>
            <table class="table b-table">
                <thead>
                <tr class="active">
                    <th class=""><input type="checkbox" id="box4"><label for="box4"><i
                                    class="iconFont">&#xe7de;</i></label></th>
                    <th class="b-phone-w2"><a href="">部门</a></th>
                    <th><a href="">主管</a></th>
                    <th class="b-phone-w2"><a href="">人数</a></th>
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th>
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if($departments)
                    @foreach($departments as $item)
                        <tr>
                            <td class="b-phone-w">
                                <input type="checkbox" id="box3"><label for="box3"><i
                                            class="iconFont">&#xe7de;</i></label>
                            </td>
                            <td class="b-phone-w2">{{ $item->name }}</td>
                            <td>{{ $item->owner->nickname or '' }}</td>
                            <td class="b-td-width">{{ count($item->employees) }}</td>
                            <td class="b-td-icon b-td-hide">
                                <a href="" data-toggle="modal" data-target="#modal-department-edit"
                                   data-url="{{ url('company/department/'.$item->id) }}" class="operate-edit"><i
                                            class="iconFont">&#xe632;</i></a>
                                <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                   class="operate-delete"
                                   data-url="{{ url('company/department/'.$item->id) }}">
                                    <i class="iconFont">&#xe6d3;</i></a>
                            </td>
                            <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                            </td>
                        </tr>
                        {{--<tr class="td-icon-hide none" id="firmIcon">--}}
                        {{--<td id="look"><a href="wdgs-gsbm-phone-look.html"><i class="iconFont">&#xe613;</i></a></td>--}}
                        {{--<td><a href="javascript:" data-toggle="modal" data-target=".bs8"><i--}}
                        {{--class="iconFont">&#xe67d;</i></a></td>--}}
                        {{--<td><a href=""><i class="iconFont">&#xe921;</i></a></td>--}}
                        {{--<td><a href="javascript:" data-toggle="modal" data-target=".bs3"><i--}}
                        {{--class="iconFont">&#xe6d3;</i></a></td>--}}
                        {{--<td><a href=""></a></td>--}}
                        {{--</tr>--}}
                    @endforeach
                @else
                    <tr class="b-no-bor">
                        <td colspan="12">还未创建部门</td>
                    </tr>
                @endif


                </tbody>
            </table>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p>
            {!! $departments->render() !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <!-- 职位 - 添加modal -->
    <div class="modal fade" id="modal-department-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加部门</h4>
                </div>
                <form action="{{ url('company/position') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>名称 : </span>
                                <input type="text" name="Department[name]" placeholder=""
                                       value="{{ old('Department.name') ? old('Department.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            {{--<p>--}}
                            {{--<span>上级部门 : </span>--}}
                            {{--<select name="Department[pid]" id="">--}}
                            {{--<option value="0">顶级部门</option>--}}
                            {{--<option value=""></option>--}}
                            {{--</select>--}}
                            {{--<span class="error-pid" style="color: red;"></span>--}}
                            {{--</p>--}}
                            <p>
                                <span>部门主管 : </span>
                                <select name="Department[employee_id]" id="">
                                    <option value=""></option>
                                </select>
                                <span class="error-employee_id" style="color: red;"></span>
                            </p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-create">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 职位 - 编辑modal -->
    <div class="modal fade" id="modal-department-edit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">编辑职位</h4>
                </div>
                <form action="" method="post" class="form-update"
                      enctype="multipart/form-data">
                    {{--{{ method_field('put') }}--}}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>职位名称 : </span>
                                <input type="text" name="Position[name]" placeholder="" class="info-name"
                                       value="{{ old('Position.name') ? old('Position.name') : '' }}">
                                <span class="error-name" style="color: red;"></span>
                            </p>
                            <p>
                                <span>职位级别 : </span>
                                <input type="text" name="Position[level]" placeholder="" class="info-level"
                                       value="{{ old('Position.level') ? old('Position.level') : '' }}">
                                <span class="error-level" style="color: red;"></span>
                            </p>
                            <p>
                                <span>是否唯一 : </span>
                                <input type="checkbox" name="Position[is_only]" value="1" class="info-is_only"
                                       style="display:block;height:13px;"/>是
                                <span class="error-is_only" style="color: red;"></span>
                            </p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary operate-update">确认</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop