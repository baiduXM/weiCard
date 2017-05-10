<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=320,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>@yield('title') - 微名片</title>
    <link href="{{ asset('static/home/css/style.css') }}" rel="stylesheet">
    <style>
        html,body{width: 100%; height: 100%;}
    </style>
</head>
<body>
<div id="login">
    @section('content')

    @show
    <p class="copy">copyright© 厦门易尔通网络科技有限公司 版权所有</p>
</div>
</body>
</html>