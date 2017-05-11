/**
 * Created by Administrator on 2017/4/1.
 */
$(function(){

// 字体大小
    (function(doc,win){

        var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize' ,
            recalc = function()
            {
                var clientWidth = docEl.clientWidth;
                if(!clientWidth) return;
                if(clientWidth>640){
                    clientWidth=640;
                }
                docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
            };
        recalc();
        if(!doc.addEventListener) return;
        win.addEventListener(resizeEvt,recalc,false);
        doc.addEventListener('DOMContentLoaded',recalc,false);
    })(document,window);
   $(".list i ").bind("touchstart",function(){
       $(".content").find(".tt").removeClass("tt");
       $(this).parent().parent().find(".icon-list").addClass("tt");
    });

 });

