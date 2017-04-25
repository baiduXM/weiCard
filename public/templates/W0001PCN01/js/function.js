$(document).ready(function(){
  //隐藏导航跟wrap的切换
	$("#class,.menuico").click(function(){
		$(".class").removeClass("page-prev").addClass("page-in");
		$(".wrap").removeClass("page-active").addClass("page-next page-in")
		$(".opacity2").show()
		pageSlideOver();
		
	})
	$(".class-close,.opacity2").on('touchstart',function(){
		$(".class").addClass("page-prev page-out")
		$(".wrap").removeClass("page-next").addClass(" page-out")
		$(".opacity2").hide()
		$(".newsclass").removeClass("show")
		pageSlideOver();
		return false;
	})
	$("#classa").click(function(){
		$(".class").removeClass("page-prev").addClass("page-in");
		$(".wrap").removeClass("page-active").addClass("page-next page-in")
		$(".opacity2").show()
		pageSlideOver();
		
	})
	$(".class-close,.opacity2").on('touchstart',function(){
		$(".class").addClass("page-prev page-out")
		$(".wrap").removeClass("page-next").addClass(" page-out")
		$(".opacity2").hide()
		$(".newsclass").removeClass("show")
		pageSlideOver();
		return false;
	})	

	$(".tell-icon .close").click(function(){
		$(".tell-icon").removeClass("display-block")
		$(".index-wrap").height($(window).height()-$(".fixed").height())
		return false
	})
	
	$(".headersearch").on('touchstart',function(){
		$(".searchbox").toggleClass("searchbox-block")
		return false
		})	
  	
	$("#share_btn").click(function(){
		$(".newsclass").addClass("show")
		$(".opacity2").show()
		return false
	})
	
	$(".share-cance").click(function(){
		$(".newsclass").removeClass("show")
		$(".opacity2").hide()
	})

	// 加载页面特效
	$.MyCommon.PageLoading({ sleep: 500 });

	// 名片二维码的显示与隐藏
	$(".i-qrcode").click(function(event) {
		$(".pop-coverCodebg").addClass('active');
		$(".shape-chrome").css({visibility:"visible"}).stop(true, true).animate({opacity:"1"}, 200)
	});
	$(".theme-popcode-close").click(function(event) {
		$(".pop-coverCodebg").removeClass('active');
		$(".shape-chrome").css({visibility:"hidden"}).stop(true, true).animate({opacity:"0"}, 200)
	});

  });
  
