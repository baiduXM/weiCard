$(document).ready(function(){
    
    // $(document).on("click", ".checkAll", function (e) {  
    //     var child = $(this).attr('rel');  
    //     $(".child_" + child).prop('checked', $(this).prop("checked"));  
    // }); 
    // 侧边栏目
    $(".ce > li > a").click(function(){    
         $(this).children().toggleClass("a_down_h");
    })
    // 分类
        $(".down").click(function(){    
            $(this).toggleClass("down_h");
        })
        $(".up").click(function(){    
            $(this).toggleClass("up_h");
        })
    // 栏目管理
    $(".o_list > li > .o_nav").click(function(){
         $(this).siblings(".t_list").slideToggle()
    })
    // 通讯录
    $(".people_list > li > .people > .right > .down").click(function(){    
         $(this).toggleClass("down_c");
         $(this).parents().parents().siblings(".tact").slideToggle()
    })
    // 字母选择
    $(".contact .zimu").click(function(){    
        $(this).children(".word").slideToggle()
    })
});
	
    


	