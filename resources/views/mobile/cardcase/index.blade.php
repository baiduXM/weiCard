@extends('mobile.common.layout')
@section('title', '名片夹')
@section('content')
    <div id="search">
        <form action="">
            <input name="word" type="text" placeholder="姓名" value="{{ $word }}">
            <button class="iconfont" type="submit">&#xe615;</button>
        </form>
    </div>
    <div id="main">
        <ul class="content">
            {{--TODO:滑动分页，后期优化--}}
            @foreach($cardcases as $item)
                <li>
                    <div class="list">
                        {{--@if($item->follower->avatar)--}}
                            <img src="{{ $item->follower->avatar ? asset($item->follower->avatar) : asset($item->follower->user->avatar)  }}" alt="">
                        {{--@else--}}
                            {{--<img src="{{ asset('static/mobile/images/touxiang.png') }}" alt="">--}}
                        {{--@endif--}}
                        <div class="name">
                            <span>{{ $item->follower->nickname ? $item->follower->nickname : $item->follower->name }}</span>
                            <b>{{ $item->getFollowerType($item->follower_type) == 'u' ? '个人' : ($item->follower->company->display_name ? $item->follower->company->display_name : $item->follower->company->name) }}</b>
                        </div>
                        <i class="iconfont  rt">&#xe60f;</i>
                    </div>
                    <div class="icon-list ">
                        <dl>
                            <a href="{{ url('cardview/'.$item->getFollowerType($item->follower_type).'-'.$item->follower_id) }}">
                                <dt><i class="iconfont">&#xe62c;</i></dt>
                                <dd>详情</dd>
                            </a>
                        </dl>
                        <dl class="phone">
                            <a href="tel:{{ $item->follower->mobile }}">
                                <dt><i class="iconfont">&#xe62d;</i></dt>
                                <dd>拨号</dd>
                            </a>
                        </dl>
                        {{--<dl>--}}
                        {{--<dt><i class="iconfont">&#xe67f;</i></dt>--}}
                        {{--<dd>短信</dd>--}}
                        {{--</dl>--}}
                        <dl>
                            <a href="{{ url('cardcase/unfollow/'.$item->getFollowerType($item->follower_type).'-'.$item->follower_id) }}">
                                <dt><i class="iconfont">&#xe67f;</i></dt>
                                <dd>删除</dd>
                            </a>
                        </dl>
                    </div>
                </li>
            @endforeach
        </ul>
    </div>
@stop

