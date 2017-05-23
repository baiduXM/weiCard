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
        (function(){
            $('.tab a').each(function(index){
                $(this).click(function(){
                    $('.tab a').removeClass('on')
                    $(this).addClass('on')
                    if(index==0){
                        $('.list').css('display','block')
                        $('.card').css('display','none')
                    } else{
                        $('.list').css('display','none')
                        $('.card').css('display','block')
                    }
                })
            })
        })();
  });
  
