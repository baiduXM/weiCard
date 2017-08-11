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
      
});
  
