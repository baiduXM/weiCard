$(document).ready(function(){
    /*start--html根节点字体大小控制*/
    (function(doc,win){
        var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize' ,
            recalc = function()
            {
                var clientWidth = docEl.clientWidth;
                if(!clientWidth) return;
                if(clientWidth>750){
                    clientWidth=750;
                }
                docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
            };
        recalc();
        if(!doc.addEventListener) return;
        win.addEventListener(resizeEvt,recalc,false);
        doc.addEventListener('DOMContentLoaded',recalc,false);
    })(document,window);
    /*end--html根节点字体大小控制*/




    /*弹窗效果*/
    function popup(eleId){
        if ($(eleId).length == 0) return;
        var top = 0;
        var popEle = $(eleId);
        var mask = popEle.find('.mask');
        var close = popEle.find('.close');
        var popMiddle = popEle.find('.popMiddle');

        popEle.show();
        mask.show();
        top = Math.floor((docHeight - popMiddle.outerHeight(true))/2);
        popMiddle.css({top: top});

        mask.add(close).on('click', function(event) {
            popEle.hide();
            mask.hide();
            event.preventDefault();
            if($(this).parents("#mp-contact" )){
                mpTab(".tabb");
            }
        });
    }

    /*二维码选项卡*/
    function mpTab(eleId,index){
        if ($(eleId).length == 0) return;
        var tab = $(eleId);
        var index = index ? index : 0;

        tab.find('a').removeClass('on');
        tab.find('a').eq(index).addClass('on');

        tab.parent().find('.tab-com').children().hide();
        tab.parent().find('.tab-com').children().eq(index).show();

        tab.find('a').on('click', function(event) {
            var index = $(this).index();
            $(this).parent().find('a').removeClass('on');
            $(this).parent().parent().find('.tab-com').children().hide();

            $(this).addClass('on');
            $(this).parent().parent().find('.tab-com').children().eq(index).show();
            event.preventDefault();
        });
    }
    mpTab(".tabb");
    mpTab(".tab");

    /*6.3 end 全屏通用代码*/

    /*底部展开*/
    var fMoreH = 0;
    var footerMore = $("#footer .footer-more");
    function footerUp(){
        $("#footer").toggleClass('in');
        $(".mp-footer-up").toggleClass('mp-footer-down');
        if ($("#footer").hasClass('in')) {
            footerMore.stop(true,false).animate({height: fMoreH},100);
        } else {
            footerMore.stop(true,false).animate({height: 0},100);
        }
    }
    function footerMain(){
        fMoreH = footerMore.outerHeight(true);
        footerMore.css({height: '0', position:'relative'});
        $("#footer .mp-footer-up,#fooBg").on('touchend', function(event) {
            footerUp();
            event.preventDefault();
        });
    }


    /*左边导航*/
    function mymenu(){
        $("#mp-menu").toggleClass('menuHover');
        $("#mp-menu-bg").toggleClass('mp-menu-bg');
    }
    $("#mp-menu-btn,#mp-menu-bg,#mp-menu-close").on('touchstart', function(event) {
        event.preventDefault();
        mymenu();
    });

    /*产品展示 start*/
    $('.mp-propage-btn').click(function(){
        $('#mp-propage').css('opacity',100).css('zIndex',100);
        $('#mp-propage .mask').show();
        var myswiper1 = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            paginationType: 'fraction',
            loop : true
        });

        $('#mp-propage').on('click', function(event) {
            $('#mp-propage').css('opacity',0).css('zIndex',-1);
        });

    });
    /*产品展示 end*/

    /*分享*/
    $(".fxBtn,.fxClose").click(function(event) {
        $("#fenxiang").slideToggle();
        event.preventDefault();
    });

    /*一键拨号 start*/
    $('.mp-tel-btn').click(function(event){
        popup("#mp-call");
        event.preventDefault();
    });

    /*名片二维码 start*/
    $('.mp-code-btn').click(function(event){
        popup("#mp-code");
        mpTab(".tab", 1);
        event.preventDefault();
    });

    /*保存通信录、名片二维码 start*/
    $('.mp-communication-btn').click(function(event){
        popup("#mp-code");
        mpTab(".tab", 0);
        event.preventDefault();
    });

    $('.mp-communication-btn1').click(function(event){
        popup("#mp-code");
        mpTab(".tab", 1);
        event.preventDefault();
    });

    /*公司介绍 start*/
    $('.mp-company-btn').click(function(event){
        popup("#mp-company");
        event.preventDefault();
    });

    /*联系我们 start*/
    $('.mp-contact-btn').click(function(event){
        popup("#mp-contact");
        mpTab(".tabb");
        event.preventDefault();
    });


    /*关注*/
    function myPost(myClass) {
        var _this = $(myClass);
        var myHref = _this.attr("href");
        var spanText = _this.find('span').text();

        /*已关注，不在请求。直接结束该函数*/
        if (spanText == "已关注") {
            $("#mp-follow-text").text("已关注");
            popup("#mp-follow");
            return false;
        };
        $.ajaxSetup({ // 无form表单时
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.post(myHref, function (data, textStatus, xhr) {
            if (textStatus == "success") {
                if (data == "关注成功") {
                    _this.find('span').text('已关注');
                    $("#mp-follow-text").text(data);
                    popup("#mp-follow");
                } else if (data == "不能关注自己") {
                    $("#mp-follow-text").text(data);
                    popup("#mp-follow2");
                }
            } else {
                $("#mp-follow-text").text("关注失败，请重新关注！");
                popup("#mp-follow");
            }
        }).error(function (emg) {
            console.log(emg);
        });
    }

    $(".mp-follow-btn").on('click', function (event) {
        event.preventDefault();
        myPost($(this));
    });
    /*关注提交 end*/


    /*8-30新增*/
    /*企业开票信息 start*/
    $('.qy-mess-btn').click(function(event){
        popup("#qy-mess");
        event.preventDefault();
    });
    /*一键拨号--不能打自己电话 start*/
    $('.mp-tel-btn2').click(function(event){
        popup("#mp-call2");
        event.preventDefault();
    });


    // /*9/26新增留言板*/
    // /*留言板信息 start*/
    // $('.mes_sub').click(function(event){
    //     // popup("#want-mess");
    //     // event.preventDefault();
    //     alert("设置保存成功！");
    // });
});

