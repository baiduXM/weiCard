/**
 * Created by Administrator on 2017/3/17.
 */
/**
 * Created by Administrator on 2017/3/16.
 */
/*******************左侧导航下拉列表**************************/
$(function () {
    var tree_box = $(".nav-list").find(".tree_box");
    var h3 = $(".tree_box").find("h3");
    var tree_one = $(".tree_box").find(".tree_one");
    h3.each(function (i) {
        $(this).click(function () {
            tree_one.eq(i).slideToggle();
            tree_one.eq(i).parent().siblings().find(".tree_one").slideUp();
            $(this).addClass("h3-active").parent().siblings().find(h3).removeClass("h3-active");
            $(this).find("i").addClass("nav-j");
            $(this).parent().siblings().find("i").removeClass("nav-j");

        })
    });
    tree_one.each(function (i) {
        $(this).children("li").click(function () {
            $(this).removeClass("li-active");
            $(this).addClass("li-active").siblings("li").removeClass("li-active").parent().siblings().find("li").removeClass("li-active");
        })

    });

});

/**********点击退出右侧导航************/
$(function () {
    $(".navbar-header").bind("click", function (event) {
        $("#nav_list").show();
        $("#nav_list").css("height", "100%");
        event.stopPropagation();
    });
    $(".tree_box").bind("click", function (event) {
        event.stopPropagation();
    });
    $(document).bind("click", function () {
        var b1 = $("#nav_list").css("display");
        if (b1 == "block") {
            $("#nav_list").hide();
            $("#nav_list").click(function (event) {
                event.stopPropagation();
            });

        }
    });

    /***************控制左侧导航高度**********************/
    function main() {
        var height = $(window).height();
        $("html,body").css("height", height + "px");
        $(".m-nav").height(height - 80);
        var m = $(".m-nav").height();
    }

    main();
    $(window).resize(function () {
        main();
    });

    /***********手机端点击向下显示四个图标**************/
    var tdIcon = $("#b-td-show");
    var icon = $(".td-icon-hide");
    tdIcon.each(function (i) {
        $(this).click(function () {
            $(this).find("i").toggleClass("td-show-color");
            icon.eq(i - 1).toggle();
        });
    });
    /******************选择排序下拉列表*******************/
    $(".b-sort-btn").click(function () {
        $(".b-sort").slideToggle();
        $(this).toggleClass("b-sort-icon");
    });
    $(".t-sort-btn").click(function () {
        $(".t-sort").slideToggle();
        $(this).toggleClass("t-sort-icon");
    });

    /******************查询字段下拉列表*******************/
    $(".b-word-btn").click(function () {
        $(".b-word").slideToggle();
        $(this).toggleClass("b-word-icon");
    });
    $(".t-word-btn").click(function () {
        $(".t-word").slideToggle();
        $(this).toggleClass("t-word-icon");
    });


});

