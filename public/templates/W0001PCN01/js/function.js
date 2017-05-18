$(document).ready(function(){
		$('.tel').click(function(){
            $('.call').show();
            $('.mask').show();
        });
        $('.call .close').click(function(){
	        $('.call').fadeOut();
	         $('.mask').fadeOut();
	    });
	    $('.code').click(function(){
            $('.call1').show();
            $('.mask').show();
        });
        $('.call1 .close').click(function(){
	        $('.call1').fadeOut();
	         $('.mask').fadeOut();
	    });
        $(".fxBtn,.fxClose").bind('touchstart', function(event) {
        $("#fenxiang").slideToggle();
        return false;
    });
  });
  
