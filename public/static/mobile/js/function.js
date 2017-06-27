$(document).ready(function(){
  /*start--全屏通用代码,body、html高度100%。底部有快捷导航*/
  function myPublic(eleId,footerId,headId){
    var docHeight = $(window).height();
    var headHeight = $(headId).outerHeight(true);
    var fooHeight = $(footerId).outerHeight(true);
    var content = $(eleId);
    var conHeight = docHeight - fooHeight - headHeight;
    content.height(conHeight);
  }
  myPublic(".card_main",".people",".sea_l");/*.footer底部快捷栏目外围高度;#content滚动内容*/
  myPublic(".pro_wrap","",".card_top");
  myPublic(".muban_wrap","",".card_top");
  /*6.3 end 全屏通用代码*/
  
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
	
	 
   $(".name").animate({right:"-1rem"}, 600,function(){
      $(".tell").animate({right:"-1rem"}, 600);
   }); 
   
   $(".qy_name").animate({right:"-0.6rem"}, 600);
   
   $(".choose_card").click(function(){
        $(".choose_box").show(100);
    });

  $(".up6").animate({bottom:"0rem"}, 600,function(){
      $(".up2").animate({bottom:"1.05rem"}, 600,function(){
         $(".up1").animate({bottom:"3.65rem"}, 600,function(){
            $(".up3").animate({bottom:"5.8rem"}, 600,function(){
                $(".up4").animate({bottom:"2.6rem"}, 600,function(){
                   $(".up5").animate({bottom:"2rem"}, 600,function(){
     
                   });
                });
            });
         });
      });
   }); 
   $('.muban_content li a').click(function(){
      $(this).find('em').toggle()
   }); 
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
    var docHeight = $(window).height();
    top = Math.floor((docHeight - popMiddle.outerHeight(true))/2);
    popMiddle.css({top: top});

    mask.add(close).on('click', function(event) {
      popEle.hide();
      mask.hide();
      event.preventDefault();
    });
  }

  /*模板弹窗 start*/
  $('.muban_content li a').each(function(){
      $(this).click(function(index){

        var href = $(this).find('img')[0].src;
        $('.pop_img').find('img').attr('src',href);
        var template_id = $(this).find('input').val();
        $('.pop_img').find('input').val(template_id);
        $('#setTP').attr('href',"change-u/"+template_id);

        popup(".muban");

        event.preventDefault();
      });
  });
});
  
