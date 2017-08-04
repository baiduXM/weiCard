$(document).ready(function(){
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
  myPublic(".muban_wrap","",".card_choose");
  myPublic("#tabBox1","",".gz_head");
  /*6.3 end 全屏通用代码*/
	 
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

        popup(".muban");

        event.preventDefault();
      });
  });
  /*模板弹窗 end*/

  /*关注页面选项卡切换 start*/
  TouchSlide( { slideCell:"#tabBox1",
        endFun:function(i){ //高度自适应
          var bd = document.getElementById("tabBox1-bd");
          bd.parentNode.style.height = bd.children[i].children[0].offsetHeight+"px";
          if(i>0)bd.parentNode.style.transition="200ms";//添加动画效果
        }
      } );
  /*关注页面选项卡切换 end*/

  /*关注页面滚动 头部选项卡固定start*/
  $('.gz_page').scroll(function() {
    if($('.gz_page').scrollTop()>$('.gz_head').height()){
      $('.tabBox .hd').addClass('fixtop')
    } else{
      $('.tabBox .hd').removeClass('fixtop')
    }
  });
  /*关注页面滚动 头部选项卡固定end*/

});
  
