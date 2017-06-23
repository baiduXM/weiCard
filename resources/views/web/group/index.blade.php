@extends('web.common.layout')
@section('title', '名片群')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('group') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">名片群</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <ul class="b-button">
                <li class="b-btn-bg"><a href="javascript:"><i class="iconFont">&#xe67d;</i>新建</a></li>
            </ul>
            <table class="table b-table">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="box6"><label for="box6"><i class="iconFont">&#xe7de;</i></label>
                    </th>
                    <th class="b-phone-w2"><a href="">群名</a></th>
                    <th class=" b-td-hide"><a href="">群人数</a></th>
                    <th class=" b-td-hide"><a href="">操作</a></th>
                    <th class=" b-td-show"><a href=""><i class="iconFont">&#xe652;</i></a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($groups))
                    <tr class="b-no-bor">
                        <td>无数据</td>
                    </tr>
                @else
                    @foreach($groups as $item)
                        <tr>
                            <td class="b-phone-w"><input type="checkbox" id="box5"><label for="box5"><i
                                            class="iconFont">&#xe7de;</i></label>
                            </td>
                            <td class="b-phone-w2">{{ $item->name }}</td>
                            <td class="b-td-hide">{{ count($item->users) }}</td>
                            <td class="b-td-icon b-td-hide">
                                <a href="javascript:" data-toggle="modal" data-target=".bs4"><i
                                            class="iconFont">&#xe67d;</i></a>
                                <a href="javascript:" data-toggle="modal" data-target=".bs5"><i
                                            class="iconFont">&#xe921;</i></a>
                                <a href="javascript:" data-toggle="modal" data-target=".bs3"><i
                                            class="iconFont">&#xe6d3;</i></a>
                            </td>
                            <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                            </td>
                        </tr>
                        <tr class="td-icon-hide none">
                            <td><a href=""><i class="iconFont">&#xe613;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe632;</i></a></td>
                            <td><a href="javascript:" data-toggle="modal" data-target=".bs5"><i
                                            class="iconFont">&#xe921;</i></a></td>
                            <td><a href="javascript:" data-toggle="modal" data-target=".bs3"><i
                                            class="iconFont">&#xe6d3;</i></a></td>
                        </tr>
                    @endforeach

                @endif

                </tbody>
            </table>
            {!! count($groups) ? $groups->render() : '' !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <div class="modal fade" id="modal-group-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2 modal8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加部门员工</h4>
                </div>
                <form action="{{ url('company/employee') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>工号 : </span>
                                <input type="text" name="Employee[number]" placeholder=""
                                       value="{{ old('Employee.number') ? old('Employee.number') : '' }}">
                                <span class="error-number hidden" style="color: red;">123</span>
                            </p>
                            <p>
                                <span>姓名 : </span>
                                <input type="text" name="Employee[nickname]" placeholder=""
                                       value="{{ old('Employee.nickname') ? old('Employee.nickname') : '' }}">
                                <span class="error-nickname" style="color: red;"></span>
                            </p>
                            {{--<p>--}}
                            {{--<span>部门 : </span>--}}
                            {{--<input type="text" name="Employee[department]" placeholder=""--}}
                            {{--value="{{ old('Employee.department') ? old('Employee.department') : '' }}">--}}
                            {{--</p>--}}
                            <p>
                                <span>照片 : </span>
                                <input type="file" name="Employee[avatar]">
                                <span class="error-avatar" style="color: red;"></span>
                            </p>
                            <p>
                                <span>座机 : </span>
                                <input type="text" name="Employee[telephone]" placeholder=""
                                       value="{{ old('Employee.telephone') ? old('Employee.telephone') : '' }}">
                                <span class="error-telephone" style="color: red;"></span>
                            </p>
                            <p>
                                <span>邮箱 : </span>
                                <input type="text" name="Employee[email]" placeholder=""
                                       value="{{ old('Employee.email') ? old('Employee.email') : '' }}">
                                <span class="error-email" style="color: red;"></span>
                            </p>
                            <p>
                                <span>手机 : </span>
                                <input type="text" name="Employee[mobile]" placeholder=""
                                       value="{{ old('Employee.mobile') ? old('Employee.mobile') : '' }}">
                                <span class="error-mobile" style="color: red;"></span>
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
    </div><!-- 员工 - 添加modal -->
@show