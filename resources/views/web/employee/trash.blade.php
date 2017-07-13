@extends('web.common.layout')
@section('title', '员工')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('company.employee') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="{{ Request::path() == 'company/employee' ? 'active' : '' }}">
                <a href="{{ url('company/employee') }}">我的同事</a>
            </li>
            <li class="{{ Request::path() == 'company/employee/trash' ? 'active' : '' }}">
                <a href="{{ url('company/employee/trash') }}">离职员工</a>
            </li>
        </ul>

        <div class="myCard-content rt-main">
            @if(Auth::user()->company)
                <ul class="b-button">
                    <li class="b-btn-bor b-word-btn ">
                        <a href="javascript:" class="word-select" name="noword">查询字段<i class="iconFont">&#xe618;</i></a>
                        <ul class="b-word none">
                            <li><a class="dropdown-word" id="noword">查询字段</a></li>
                            <li><a class="dropdown-word" id="number">工号</a></li>
                            <li><a class="dropdown-word" id="nickname">姓名</a></li>
                            <li><a class="dropdown-word" id="positions">职位</a></li>
                            <li><a class="dropdown-word" id="telephone">电话</a></li>
                            <li><a class="dropdown-word" id="department">部门</a></li>
                        </ul>
                    </li>
                    <li class="b-search  " name='search-form'>
                        <form action="{{ url('/company/employee/trash') }}">
                            <input type="hidden" class="word" name="word" value='nickname'>
                            <input class="b-input b-form-bor" type="text" name="keyword" placeholder="请输入关键字">
                            <input class="b-ser-btn b-form-bg" type="submit" value="查找">
                        </form>
                    </li>
                </ul>
            @endif

            <table class="table b-table table-hover" id="tableList">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="boxAll"><label for="boxAll" class="iconFont"><i>&#xe7de;</i></label>
                    </th>
                    <th class="b-phone-w2"><a href="">工号</a></th>
                    <th class=" "><a href="">姓名</a></th>
                    <th class="b-phone-w2"><a href="">部门</a></th>
                    <th class="b-phone-w2"><a href="">职位</a></th>
                    <th class=" b-td-show"><a href="javascript:"><i class="iconFont">&#xe652;</i></a></th><!--适应手机-->
                    <th class=" b-td-hide"><a href="">操作</a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($employees))
                    <tr class="b-no-bor">
                        <td colspan="10" class="">无记录</td>
                    </tr>
                @else
                    @foreach($employees as $item)
                        <tr class="{{ $item->user_id == Auth::id() ? 'info' : '' }}">
                            <td class="b-phone-w"><input type="checkbox" id="{{ $item->id }}">
                                <label for="{{ $item->id }}" class="iconFont"><i>&#xe7de;</i></label>
                            </td>
                            <td class="b-phone-w2">{{ $item->number }}</td>
                            <td class="">{{ $item->nickname }}</td>
                            <td class="">{{ $item->department ?$item->department->name:'' }}</td>
                            <td class="">{{ $item->positions or (isset($item->position->name)?$item->position->name:'') }}</td>
                            <td class="b-td-icon b-td-hide w-icon">
                                {{--<a href="" data-toggle="modal" data-target="#modal-employee-show"--}}
                                {{--class="operate-show"--}}
                                {{--data-url="{{ url('company/employee/'.$item->id) }}"><i--}}
                                {{--class="iconFont">&#xe613;</i></a>--}}
                                <a href="javascript:void(0);" data-toggle="modal" data-target=".bs33"
                                   class="operate-recover"
                                   data-url="{{ url('company/employee/'.$item->id.'/recover') }}">
                                    <i class="iconFont">&#xe632;</i></a>
                                <a href="javascript:void(0);" data-toggle="modal" data-target=".bs3"
                                   class="operate-delete"
                                   data-url="{{ url('company/employee/'.$item->id.'/forceDelete') }}">
                                    <i class="iconFont">&#xe6d3;</i></a>
                            </td>
                            <td class=" b-td-show" id="b-td-show"><a href="javascript:"><i class="iconFont">&#xe621;</i></a>
                            </td>
                        </tr>
                        <tr class="td-icon-hide none">
                            <td id="look">
                                <a href="javascript:" data-toggle="modal" data-target=".bs2"><i
                                            class="iconFont">&#xe613;</i></a>
                            </td>
                            <td><a href=""><i class="iconFont">&#xe634;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe632;</i></a></td>
                            <td><a href=""><i class="iconFont">&#xe921;</i></a></td>
                            <td><a href="" data-toggle="modal" data-target=".bs3"><i
                                            class="iconFont">&#xe6d3;</i></a></td>
                        </tr><!--适应手机操作-->
                    @endforeach
                @endif
                </tbody>
            </table>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p><!--适应手机-->
            {!! $employees ? $employees->appends($params)->render() : '' !!}
        </div>
    </div>
@stop

@section('modal-extend')

    <div class="modal fade" id="modal-employee-show" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal2">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">查看</h4>
                </div>
                <div class="modal-body">
                    <div class="modal-address">
                        <p><span>公司 : </span><input type="text" name="info-company" value="" readonly></p>
                        <p><span>部门 : </span><input type="text" name="info-department" value="" readonly></p>
                        <p><span>职位 : </span><input type="text" name="info-positions" value="" readonly></p>
                        <p><span>工号 : </span><input type="text" name="info-number" value="" readonly></p>
                        <p><span>姓名 : </span><input type="text" name="info-nickname" value="" readonly></p>
                        <p><span>绑定用户 : </span><input type="text" name="info-user" value="" readonly></p>
                        <p><span>座机 : </span><input type="text" name="info-telephone" value="" readonly></p>
                        <p><span>手机 : </span><input type="text" name="info-mobile" value="" readonly></p>
                    </div>
                    <div class="modal-address-img">
                        <img name="info-avatar" src="{{ asset('static/home/images/avatar.jpg') }}" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div><!-- 员工 - 查看modal -->

    <div class="modal fade bs33" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1 modal3">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="" method="post">
                    {{ csrf_field() }}
                    {{ method_field('post') }}
                    <div class="modal-body">
                        <p><i class="iconFont">&#xe604;</i>确认恢复该员工？</p>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" value="确认">
                        <input type="reset" data-dismiss="modal" value="取消">
                    </div>
                </form>
            </div>
        </div>
    </div>

@stop

@section('javascript')
    <script>
        $(function () {
            /*  */
            $('.operate-recover').click(function () {
                $('.bs33').on('show.bs.modal', function (event) {
                    var relatedTarget = $(event.relatedTarget);
                    var _url          = relatedTarget.data('url');
                    var _modal        = $(this);
                    _modal.find('form').attr('action', _url);
                });
            });
        });
    </script>
@stop
