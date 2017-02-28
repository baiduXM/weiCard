

function DY_scroll(wraper,prev,next,img,speed,or)
{
var wraper = $(wraper);
var prev = $(prev);
var next = $(next);
var img = $(img);
var w = 760;
var s = speed;
next.click(function()
{
img.stop(true,true).animate({'marginLeft':-w},function()
{
img.find('.i_pro').eq(0).appendTo(img);
img.css({'margin-left':0});
});
});
prev.click(function()
{
img.find('.i_pro:last').prependTo(img);

img.css({'margin-left':-w});
img.stop(true,true).animate({"marginLeft":0});
});
//if (or == true)
//{
//ad = setInterval(function() { next.click();},s*1000);
//wraper.hover(function(){clearInterval(ad);},function(){ad = setInterval(function() { next.click();},s*1000);});
//}
}


	
	$(function(){
		   

		   
DY_scroll('.main_a','.btn02','.btn01','.main_b2',3,true);	
	})





  $(document).ready(function(){
						   $(".sub_Learn ul li").hover(
									function(){
										$(this).find(".bg").stop().animate({"width":"800px"})
										
										},
									function(){
										$(this).find(".bg").stop().animate({"width":"0%"})
										
										}
									 )
						   
						   
						   
						   
						   
						   
						   
						   
						   
						   $(".sub_Learn").find(".list ul li:even .bg").addClass("bg1")
						  $(".sub_Learn").find(".list ul li:even .txt").addClass("txt1")
						   $(".sub_Learn").find(".list ul li:even .pic").addClass("pic1")
						   
						   
						   
						   
	
	
	 	$(document).ready(function(){

	// 0.4代表遮罩的透明度
	$('.pic div').css('opacity',0.2);

	$('.pic').hover(function(){
	
		var el = $(this);
		
		// 先淡出阴影，后淡入文字
		el.find('div').stop().animate({width:200,height:200},'slow',function(){

			el.find('p').fadeIn('fast');
		});

	},function(){

		var el = $(this);
		
		// 隐藏文字
		el.find('p').stop(true,true).hide();
		
		// 去掉遮罩
		el.find('div').stop().animate({width:60,height:60},'fast');

	}).click(function(){
		
		// 点击图片时打开链接
		
		window.open($(this).find('a').attr('href'));
		
	});
});					   

});























<!--返回顶部开始-->
  jQuery(function () {
    jQuery(window).toTop({
      showHeight: 1500, //设置滚动高度时显示
      speed: 300 //返回顶部的速度以毫秒为单位
    });
  });
	$.fn.toTop = function(options) {
		var defaults = {			
			showHeight:150,
			speed : 1000
		};
		var options = $.extend(defaults,options);
		$("body").prepend("<div id='totop'><a title='返回顶部' href='#' hidefocus='true'></a></div>");
		var $toTop = $(this);
		var $top = $("#totop");
		var $ta = $("#totop a");
		$toTop.scroll(function(){
			var scrolltop=$(this).scrollTop();		
			if(scrolltop>=options.showHeight){				
				$top.fadeIn();
			}
			else{
				$top.fadeOut();
			}
		});	
		$ta.hover(function(){ 		
			$(this).addClass("cur");	
		},function(){			
			$(this).removeClass("cur");		
		});	
		$top.click(function(){
			$("html,body").animate({scrollTop: 0},options.speed);
			return false;
		});
	}


	


<!--返回顶部结束-->

































<!--右边悬浮框代码开始-->
$(document).ready(function(e) {
        $('.l1').hover(function(){
            $('#code_img').show();
        },function(){
            $('#code_img').hide();
        })

$('.l2').hover(function(){
            $('#code_img1').show();
        },function(){
            $('#code_img1').hide();
        })


$('.l3').hover(function(){
            $('#code_img2').show();
        },function(){
            $('#code_img2').hide();
        })

<!--右边悬浮框代码结束-->



if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	new WOW().init();
};







    });

   

