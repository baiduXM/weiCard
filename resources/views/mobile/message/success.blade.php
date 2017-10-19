<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title></title>

    <style>
        body{font-family:  Microsoft YaHei,"微软雅黑";font-size:0.6rem;  background-color: #fff;max-width:640px;
            min-width:320px;margin:0 auto;   }
        .main-p{position: absolute;width:100%;height:100%;background: url({{ asset('static/message/images/3_03.png') }}) repeat center top;max-width:640px;
            min-width:320px;}
        .success-p{text-align: center;position: absolute;top:0;bottom:0; left:0;right:0;margin:auto;height:150px;}
        .success-p img{width:82px;height:82px;}
        .success-p p{font-size:20px;}
    </style>
    <script language=javascript>
        setTimeout('window.location="{{ url('cardview/e-'.$id) }}"',300)
    </script>
</head>

<body>
<div class="main-p">
    <div class="success-p">
        <img src="{{ asset('static/message/images/3_03d_03.png') }}" alt="">
        <p>您的留言已提交成功！</p>
    </div>
</div>
</body>
</html>