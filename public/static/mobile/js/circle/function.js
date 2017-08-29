$(function () {
    (function (doc, win) {
        var docEl     = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc    = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth) return;
                if (clientWidth > 640) {
                    clientWidth = 640;
                }
                docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
            };
        recalc();
        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);


    /*选项卡*/
    function Wtab(eId, index) {
        if ($(eId).length == 0) return;
        var tab   = $(eId);
        var index = index ? index : 0;

        tab.find('div').removeClass('current');
        tab.find('div').eq(index).addClass('current');

        tab.siblings('.w-content').find('.w-list').hide();
        tab.siblings('.w-content').find('.w-list').eq(index).show();

        tab.find('div').on('touchstart', function () {
            var index = $(this).index();
            $(this).parent().find('div').removeClass('current');
            $(this).parent().siblings('.w-content').find('.w-list').hide();

            $(this).addClass('current');
            $(this).parent().siblings('.w-content').find('.w-list').eq(index).show();


        });
        var listL = tab.find('div').parent().siblings('.w-content').find('.w-list').eq(index).find('.list1');
        // console.log(listL.length);
        if (listL.length == 0) {
            $('.list').siblings('.indexImg').show();
        } else {
            $('.list').siblings('.indexImg').hide();
        }
    }


    /*加入成功弹出框*/
    $(".confirm").click('touchstart', function () {
        $(this).parents('#add2').hide();
    });

    /*编辑*/
    $(".x-cont-had .bianji a").click('touchstart', function () {
        $(this).toggleClass("complete");
        if ($(".x-cont-had .bianji a").hasClass("complete")) {
            $(".G-list .G-close").show();
            $(".G-list input").hide();
            $(this).parent().parent().find('input').attr("disabled", "disabled");
            $(this).find('img').hide();
            $(this).find('span').html('完成');
        } else {
            $(".G-list .G-close").hide();
            $(".G-list input").show();
            $(this).parent().parent().find('input').removeAttr("disabled", "disabled");
            $(this).find('img').show();
            $(this).find('span').html('编辑');
        }
    });


    /*删除*/
    $(".G-close").click('touchstart', function () {
        $(this).attr("data-am-modal", "{target: '#G-close' }");
        var self = $(this);
        $(".close-modal .confirm").click('touchstart', function () {
            $(self).parent('.G-list').hide();
        });
    });

    /*引导页高度*/
    var height = $('html').height();
    // console.log(height);
    $(".lead").height(height);


    // 引导页
    function lead() {
        $(".new-btn .next").click('touchstart', function () {
            $(this).parents('.lead').hide();
            $(this).parents('.lead').next().show();
        });
        $(".onShow").click('touchstart', function () {
            $(this).parents('.lead').hide();
        });
        $(".L-hide").hover(function () {
            $(this).hide();
        });
    }

    // function common(x) {
    //     x();
    //     Wtab('.myTab');
    // }
    // common(lead);

    lead();
    Wtab('.myTab');
});
