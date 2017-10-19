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
    <i class="close">
        <img src="{{ asset('static/message/images/1_04.png') }}" alt="">
    </i>
    <span class="had-name">我要留言</span>
    {{--<b class="share rt"><img src="{{ asset('static/message/images/1_05.png') }}" alt="">--}}
    </b>
</div>
<div class="want_message">
    <form action="{{ url('message-post') }}" method="post" enctype="multipart/form-data">

        {{ csrf_field() }}


        <input type="hidden" name="Message[user_id]" id="user_id" value="{{$uid}}" hidden>

        <div class="mes_cont">
            <b>*</b>
            <div class="mes_input">
                <span>主题  </span>
                <input type="text" name="Message[title]" id="title"placeholder="输入您的留言主题">
            </div>
            @if ($errors->has('Message.title'))
                <p class="show">{{ $errors->first('Message.title') }}</p>
            @endif
        </div>
        <div class="mes_cont">
            <b>*</b>
            <div class="mes_input">
                <span>姓名  </span>
                <input type="text" name="Message[name]" id="name" placeholder="您的姓名或昵称">
            </div>
            @if ($errors->has('Message.name'))
                <p class="show">{{ $errors->first('Message.name') }}</p>
            @endif
        </div>
        <div class="mes_cont">
            <b>*</b>
            <div class="mes_input">
                <span>手机  </span>
                <input type="text" name="Message[phone]" id="phone"placeholder="请输入您的手机号码">
            </div>
            @if ($errors->has('Message.phone'))
                <p class="show">{{ $errors->first('Message.phone') }}</p>
            @endif
        </div>
        <div class="mes_cont">
            <b></b>
            <div class="mes_input">
                <span>邮箱  </span>
                <input type="text" name="Message[email]" id="email"placeholder="请输入您的邮箱">
            </div>
            @if ($errors->has('Message.email'))
                <p class="show">{{ $errors->first('Message.email') }}</p>
            @endif
        </div>
        <div class="mes_cont">
            <b>*</b>
            <div class="mes_input textarea">
                <span>内容  </span>
                <textarea name="Message[content]" id="content"   rows="10" placeholder="请输入您的留言内容"></textarea>
            </div>
            @if ($errors->has('Message.content'))
                <p class="show">{{ $errors->first('Message.content') }}</p>
            @endif
        </div>

        <div class="mes_btn" align="center">
            {{--<button class="mes_reset">取消</button>--}}
            {{--<a href="javascript:location.reload();" class="mes_reset">点击刷新页面</a>--}}
            <button class="mes_sub" id="mes_sub">提交</button>
        </div>
    </form>



</div>

<!-- 留言板弹框 -->

    <div id="want-mess" class="want-mess qy-mess" >
        <div class="mask"></div>
        <div class="companypage popMiddle animated bounceInDown go" style="top: 80px;">
            <div class="tab-com">
                <div class="companyinfo1">
                    <div class="close"><em>&times;</em></div>
                    <div class="person_picc">
                        <img src="{{ asset('static/message/images/3_03d_03.png') }}" alt="">
                        <h2>您的留言已提交成功！</h2>
                    </div>
                </div>
            </div>
        </div>
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