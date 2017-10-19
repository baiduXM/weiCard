<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title></title>
    <link rel="stylesheet" href="{{ asset('static/message/css/mes-style.css') }}">

</head>
<body>
<div class="had">
    <i class="close"><img src="{{ asset('static/message/images/1_04.png') }}" alt=""></i>
    <span class="had-name">我收到的留言</span>
    <b class="share rt">
        {{--<img src="{{ asset('static/message/images/1_05.png') }}" alt="">--}}
    </b>
</div>
<div class="message">
    <ul class="message_list">

        @if(!count($messages))
            无信息
        @else
            @foreach($messages as $item)
                {{--<span class="selSpan"name="{{ $item->icon_name}}"><i class="iconfonts">{{ $item->icon_name.';' }}</i></span>--}}
                <li class="{{ ($item->is_read)!="1" ? 'current' : '' }}">
                    <a href="{{ url('message-detail/'.$item->id) }}">
                        <i class="iconfont">&#xe75f;</i>
                        <p>{{ $item->title}}</p>
                        <span class="rt">{{ $item->created_at->format('Y-m-d')}}</span>
                    </a>
                </li>
            @endforeach
        @endif

        {{--<li>--}}
            {{--<a href="">--}}
                {{--<i class="iconfont">&#xe75f;</i>--}}
                {{--<p>请问G名片的后台的怎么查看呢？</p>--}}
                {{--<span class="rt">2017-08-10</span>--}}
            {{--</a>--}}
        {{--</li>--}}
        {{--<li class="current">--}}
            {{--<a href="">--}}
                {{--<i class="iconfont">&#xe75f;</i>--}}
                {{--<p>请问G名片的后台的怎么查看呢？</p>--}}
                {{--<span class="rt">2017-08-10</span>--}}
            {{--</a>--}}
        {{--</li>--}}
    </ul>
</div>

<script type="text/javascript" src="{{ asset('static/message/js/jquery.min.js') }}"></script>
<!-- function 通用js 如有其它js可只行创建js文件-->
<script type="text/javascript" src="{{ asset('static/message/js/common.js') }}"></script>
<script type="text/javascript">
    window.addEventListener('load', function () {
        setTimeout(function () {
            window.scrollTo(0, 1);
        }, 100);
    });//safari浏览器可以通过此代码来隐藏地址栏
</script>
</body>
</html>