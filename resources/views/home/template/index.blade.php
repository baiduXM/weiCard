@extends('home.common.layout')
@section('title', '模板')
@section('content')
    <div id="myCard" >
        <ul class="cont-nav rt" >
            <li><a href="">模板中心 > </a></li>
            <li class="cont-nav-act"><a href="">收费模板</a></li>
        </ul>
        <ul class="nav nav-tabs" id="myTab">
            <li class="active" >
                <a href=""   >收费模板</a>
            </li>
        </ul>
        <div class="myCard-content rt-main">
            <p class="phone-show add-yg">收费模板</p>
            <ul class="b-button add-y moban-btn">
                <li class="b-btn-bg"><a href="" ><i class="iconFont">&#xe6d3;</i>批量删除</a></li>
                <li class="b-btn-bg" ><a href="javascript:" ><i class="iconFont">&#xe67d;</i>添加模板</a></li>
                <li class="b-btn-bor b-sort-btn ">
                    <a href="javascript:" >选择<i class="iconFont">&#xe618;</i></a>
                    <ul class="b-sort none">
                        <li><a href="">已选</a></li>
                        <li><a href="">可选</a></li>
                        <li><a href="">不可选</a></li>
                    </ul>
                </li>
            </ul>
            <div class="mb-main">
                <dl class="col-lg-3 col-sm-4 col-md-6 col-xs-6">
                    <dt><img src="{{ asset('static/home/images/mb1.png') }}" alt=""><a href=""><i class="iconFont">&#xe62e;</i></a></dt>
                    <dd >
                        <a href="javascript:" data-toggle="modal" data-target=".bs10"><i class="iconFont">&#xe613;</i></a>
                        <a href=""><i class="iconFont">&#xe632;</i></a>
                        <a href="javascript:" data-toggle="modal" data-target=".bs3"><i class="iconFont">&#xe6d3;</i></a>
                    </dd>
                </dl>

            </div>
            <p class="clickMore none"><a href="">点击查看更多 <i class="iconFont">&#xe652;</i></a></p>
            <ul class="b-page lt">
                <li><a href="" class="iconFont">&#xe61f;</a></li>
                <li><a href=""  class="iconFont">&#xe600;</a></li>
                <li class="page-active"><a href="">1</a></li>
                <li><a href="">2</a></li>
                <li><a href="">3</a></li>
                <li><a href="">..</a></li>
                <li><a href="">8</a></li>
                <li><a href="" class="iconFont">&#xe609;</a></li>
                <li><a href="" class="iconFont">&#xe60f;</a></li>
            </ul>
            <ul class="b-rt-page rt">
                <li class="rt-page-active"><a href="">10</a></li>
                <li><a href="">15</a></li>
                <li><a href="">20</a></li>
            </ul>
        </div>

    </div>
@stop