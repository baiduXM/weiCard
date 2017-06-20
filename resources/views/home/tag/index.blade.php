@extends('home.common.layout')
@section('title', '名片分组')
@section('content')
    <div id="myCard">
        @section('breadcrumb')
            {!! Breadcrumbs::render('tag') !!}
        @show
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="">名片分组</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <ul class="b-button">
                <li class="b-btn-bg">
                    <a href="javascript:;" data-toggle="modal" data-target="#modal-tag-add">
                        <i class="iconFont">&#xe67d;</i>新建
                    </a>
                </li>
            </ul>
            <table class="table b-table">
                <thead>
                <tr class="active">
                    <th class="b-phone-w"><input type="checkbox" id="box6"><label for="box6"><i class="iconFont">&#xe7de;</i></label>
                    </th>
                    <th class="b-phone-w2"><a href="">组名</a></th>
                    <th class=" b-td-hide"><a href="">人数</a></th>
                    <th class=" b-td-hide"><a href="">操作</a></th>
                    <th class=" b-td-show"><a href=""><i class="iconFont">&#xe652;</i></a></th>
                </tr>
                </thead>
                <tbody>
                @if(!count($tags))
                    <tr class="b-no-bor">
                        <td colspan="10">无数据</td>
                    </tr>
                @else
                    @foreach($tags as $item)
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
            {!! count($tags) ? $tags->render() : '' !!}
        </div>
    </div>
@stop
@section('modal-extend')
    <div class="modal fade" id="modal-tag-add" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal1">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加分组</h4>
                </div>
                <form action="{{ url('cardcase/tag') }}" method="post" class="form-create"
                      enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <div class="modal-address">
                            <p>
                                <span>组名 : </span>
                                <input type="text" name="Tag[name]" placeholder="组名"
                                       value="{{ old('Tag.name') ? old('Tag.name') : '' }}">
                                <span class="error-name hidden" style="color: red;"></span>
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