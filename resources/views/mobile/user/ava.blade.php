<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>更换头像-{{ config('global.website.product_name') }}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no, email=no" />
    <link href="{{ asset('static/mobile/css/avastyle.css') }}" rel="stylesheet" type="text/css">
</head>
<body style="background:#000">

<div class="htmleaf-container">
    <div id="clipArea"></div>
    <div id="view"></div>
</div>
<form action="{{ url('user/avatar') }}" method="post" enctype="multipart/form-data">
    {{ method_field('put') }}
    {{ csrf_field() }}
    <a href="javascript:void(0);" class="logoBox" id="logoBox">
        <img id="bgl" src="{{ asset($user->avatar) }}" width="100%" type="file">
    </a>
    <div class="btn-1">
        <a id="s_dpage" href="javascript:void(0);">更换头像</a>
        <input type="submit"  value="确认提交" id="s_dpage1">

        {{--<button>确认更换</button>--}}
        @if ($errors->has('avatar'))
            <button>{{ $errors->first('avatar') }}</button>
            <p class="show">{{ $errors->first('avatar') }}</p>
        @endif

    </div>

</form>

<div id="dpage">
    <!-- <a href="javascript:void(0);"> -->
    <!-- <input type="button" name="file" class="button" value="拍照"> -->
    <!-- <input id="file" type="file" onchange="javascript:setImagePreview();" accept="image/*" multiple  /> -->
    <!-- </a> -->
    <a href="javascript:void(0);">
        <input type="button" name="file"  value="1.选取照片"class="clipBtn">
        <input id="file" type="file" onchange="javascript:setImagePreview();" accept="image/*" multiple  />
    </a>
    <a href="javascript:void(0);" class="qx"><button id="clipBtn" class="clipBtn">2.截取图片</button></a>
    <a href="javascript:void(0);" class="qx"><button id="clipBtn1" class="clipBtn">取消</button></a>

</div>
<script src="{{ asset('static/mobile/js/avatarjs/jquery.min.js') }}" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="{{ asset('static/mobile/js/avatarjs/jquery-2.1.1.min.js') }}"><\/script>')</script>
<script src="{{ asset('static/mobile/js/avatarjs/hammer.js') }}"></script>
<script src="{{ asset('static/mobile/js/avatarjs/jquery.photoClip.js') }}"></script>
<script src="{{ asset('static/mobile/js/avatarjs/iscroll-zoom.js') }}"></script>
<script src="{{ asset('static/mobile/js/avatarjs/lrz.all.bundle.js') }}"></script>
<script src="{{ asset('static/mobile/js/avatarjs/PhotoClip.js') }}"></script>
<script>
    var obUrl = new PhotoClip('#clipArea', {
        size: 260,
        outputSize: 640,
        //adaptive: ['60%', '80%'],
        file: '#file',
        view: '#view',
        ok: '#clipBtn',
        //img: 'img/mm.jpg',
        loadStart: function() {
            console.log('开始读取照片');
        },
        loadComplete: function() {
            console.log('照片读取完成');
        },
        done: function(dataURL) {
            console.log(dataURL);
        },
        fail: function(msg) {
            alert(msg);
        }
    });
</script>
<script>
    $(function(){
        $("#clipBtn1").click(function(){
            $("#dpage").removeClass("show");
            $(".htmleaf-container").hide();
        })
        $("#logoBox,#s_dpage").click(function(){
            $(".htmleaf-container").fadeIn(300);
            $("#dpage").addClass("show");
        })
        $("#clipBtn").click(function(){
            $("#logoBox").empty();
            $('#logoBox').append('<img src="' + imgsource + '" align="absmiddle" style=" width:100%;"type="file">');
            $('#logoBox').append('<input name="avatar" id="avatar" type="hidden"  value="' + imgsource + '">');
            $(".htmleaf-container").hide();
            $("#dpage").removeClass("show");
        })
    });
</script>
<script type="text/javascript">
    $(function(){
        jQuery.divselect = function(divselectid,inputselectid) {
            var inputselect = $(inputselectid);
            $(divselectid+" small").click(function(){
                $("#divselect ul").toggle();
                $(".mask").show();
            });
            $(divselectid+" ul li a").click(function(){
                var txt = $(this).text();
                $(divselectid+" small").html(txt);
                var value = $(this).attr("selectid");
                inputselect.val(value);
                $(divselectid+" ul").hide();
                $(".mask").hide();
                $("#divselect small").css("color","#333")
            });
        };
        $.divselect("#divselect","#inputselect");
    });
</script>
<script type="text/javascript">
    $(function(){
        jQuery.divselectx = function(divselectxid,inputselectxid) {
            var inputselectx = $(inputselectxid);
            $(divselectxid+" small").click(function(){
                $("#divselectx ul").toggle();
                $(".mask").show();
            });
            $(divselectxid+" ul li a").click(function(){
                var txt = $(this).text();
                $(divselectxid+" small").html(txt);
                var value = $(this).attr("selectidx");
                inputselectx.val(value);
                $(divselectxid+" ul").hide();
                $(".mask").hide();
                $("#divselectx small").css("color","#333")
            });
        };
        $.divselectx("#divselectx","#inputselectx");
    });
</script>
<script type="text/javascript">
    $(function(){
        jQuery.divselecty = function(divselectyid,inputselectyid) {
            var inputselecty = $(inputselectyid);
            $(divselectyid+" small").click(function(){
                $("#divselecty ul").toggle();
                $(".mask").show();
            });
            $(divselectyid+" ul li a").click(function(){
                var txt = $(this).text();
                $(divselectyid+" small").html(txt);
                var value = $(this).attr("selectyid");
                inputselecty.val(value);
                $(divselectyid+" ul").hide();
                $(".mask").hide();
                $("#divselecty small").css("color","#333")
            });
        };
        $.divselecty("#divselecty","#inputselecty");
    });
</script>
<script type="text/javascript">
    $(function(){
        $(".mask").click(function(){
            $(".mask").hide();
            $(".all").hide();
        })
        $(".right input").blur(function () {
            if ($.trim($(this).val()) == '') {
                $(this).addClass("place").html();
            }
            else {
                $(this).removeClass("place");
            }
        })
    });
</script>
<script>
    $("#file0").change(function(){
        var objUrl = getObjectURL(this.files[0]) ;
        obUrl = objUrl;
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#img0").attr("src", objUrl).show();
        }
        else{
            $("#img0").hide();
        }
    }) ;
    function qd(){
        var objUrl = getObjectURL(this.files[0]) ;
        obUrl = objUrl;
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#img0").attr("src", objUrl).show();
        }
        else{
            $("#img0").hide();
        }
    }
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>
<script type="text/javascript">
    var subUrl = "";
    $(function (){
        $(".file-3").bind('change',function(){
            subUrl = $(this).val()
            $(".yulan").show();
            $(".file-3").val("");
        });

        $(".file-3").each(function(){
            if($(this).val()==""){
                $(this).parents(".uploader").find(".filename").val("营业执照");
            }
        });
        $(".btn-3").click(function(){
            $("#img-1").attr("src", obUrl);
            $(".yulan").hide();
            $(".file-3").parents(".uploader").find(".filename").val(subUrl);
        })
        $(".btn-2").click(function(){
            $(".yulan").hide();
        })

    });
</script>
<script type="text/javascript">
    function setImagePreview() {
        var preview, img_txt, localImag, file_head = document.getElementById("file_head"),
            picture = file_head.value;
        if (!picture.match(/.jpg|.gif|.png|.bmp/i)) return alert("您上传的图片格式不正确，请重新选择！"),
            !1;
        if (preview = document.getElementById("preview"), file_head.files && file_head.files[0]) preview.style.display = "block",
            preview.style.width = "100px",
            preview.style.height = "100px",
            preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);
        else {
            file_head.select(),
                file_head.blur(),
                img_txt = document.selection.createRange().text,
                localImag = document.getElementById("localImag"),
                localImag.style.width = "100px",
                localImag.style.height = "100px";
            try {
                localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)",
                    localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = img_txt
            } catch(f) {
                return alert("您上传的图片格式不正确，请重新选择！"),
                    !1
            }
            preview.style.display = "none",
                document.selection.empty()
        }
        return document.getElementById("DivUp").style.display = "block",
            !0
    }
</script>

</body>
</html>

