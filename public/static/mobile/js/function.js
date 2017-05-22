$(document).ready(function(){
		(function(){
			$('.txt1').focus(function(){
				if($(this).val()=='输入名片码'){
					$('.txt1').val('');
				}
		});
		$('.txt1').blur(function(){
			if($(this).val()==''){
				$('.txt1').val('输入名片码')
			}
		});			
	})();
	
  });
  
