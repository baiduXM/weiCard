/**
 * Created by Administrator on 2017/3/17.
 */
/**
 * Created by Administrator on 2017/3/16.
 */
/*******************左侧导航下拉列表**************************/
$(function () {
    var tree_box = $(".nav-list").find(".tree_box");
    var h3       = $(".tree_box").find("h3");
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


    /**********点击退出右侧导航************/
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
    var icon   = $(".td-icon-hide");
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

    var addressList = function (objId) {
        this.tableList   = $(objId);
        this.tableHeadTr = tableList.find('#boxAll');
        /*全选按钮*/
        this.tableTbody = tableList.find('tbody');
        /*展示列表父元素*/
        this.tableTr = tableList.find('tbody tr');
        /*展示列表*/
        this.tableTrSel = tableTr.find('td').find('input');
        /*列表选择框*/
        this.tabDel = $(".b-button .delete");


        /*全选按钮*/
        tableHeadTr.on('click', function () {
            tableTrSel.prop('checked', this.checked);
        });

        /*多条数据选择*/
        tableTrSel.on('click', function () {
            tableHeadTr.prop('checked', tableTrSel.length == tableTrSel.filter(':checked').length);
        });

        /*批量删除*/
        tabDel.on('click', function (event) {
            event.preventDefault();
            var inputId = [];
            var url     = $(this).attr('href');

            for (var i = tableTrSel.length - 1; i >= 0; i--) {
                if (tableTrSel.eq(i).prop('checked')) {
                    inputId.push(tableTrSel.eq(i).attr('id'));
                }
            }
            var ids_str = inputId.join(','); // 将数组用','连接成字符串
            myPost(url, ids_str);
        });

        this.myPost = function (url, myData) {






            $.ajax({
                url: url,
                type: "delete",
                data: {'ids': myData},
                traditional: true,
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
                success: function (json) {
                    console.log('success');
                    console.log(json);
                    // $('.hintModal').modal('show');
                    // $('.hintModal .modal-body').text('成功导入' + json.success + '条数据');
                    // $('.hintModal .after-operate').text(_url);
                    // return false;
                },
                error: function (json) {
                    console.log('failed');
                    console.log(json);
                    // var errors = json.responseJSON;
                    // showError(errors);
                    // return false;
                }
            });
            // $.post(url, myData, function (data, textStatus) {
            //     if (textStatus == "success") {
            //         if (data == "删除成功") {
            //             console.log(7);
            //         }
            //     } else {
            //         alert("操作失败");
            //     }
            // });
        }

    }

    addressList("#tableList");

});


