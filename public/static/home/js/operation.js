/**
 * Created by Hsieh on 2017/4/7.
 */
$(function () {
    /* 运行 */
    init();
    /* 操作 - 添加 */
    $('.operate-create').on('click', function () {
        var _url      = $('.form-create').attr('action');
        var _formData = new FormData($('.form-create')[0]);
        $("[class^='error-']").addClass('hidden');
        console.log(_url);
        $.ajax({
            url: _url,
            type: "post",
            cache: false,
            contentType: false,
            processData: false,
            data: _formData,
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function (json) {
                console.log('success');
                console.log(json);
                $('.hintModal').modal('show');
                $('.hintModal .modal-body').text(json.msg);
                $('.hintModal .after-operate').text(_url);
                return false;
            },
            error: function (json) {
                console.log('failed');
                console.log(json);
                var errors = json.responseJSON;
                showError(errors);
                return false;
            }
        });
    });

    /* 操作 - 导入 */
    $(".operate-import").click(function () {
        var _url      = $(this).parents('form').data('url');
        var _formData = new FormData($('.form-import')[0]);
        $.ajax({
            url: _url,
            type: "post",
            data: _formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (json) {
                console.log('success');
                console.log(json);
                $('.hintModal').modal('show');
                $('.hintModal .modal-body').text('成功导入' + json.success + '条数据');
                $('.hintModal .after-operate').text(_url);
                return false;
            },
            error: function (json) {
                console.log('failed');
                console.log(json);
                var errors = json.responseJSON;
                showError(errors);
                return false;
            }
        });
    });

    /* 操作 - 显示 */
    $(".operate-show").click(function () {
        var _url = $(this).data("url");
        $.get(_url, function (data) {
            console.log('operate-show')
            console.log(data)
            showInformation(data, 'name', 'info-');
        });
    });

    /* 操作 - 显示名片 */
    $(".operate-cardshow").click(function () {
        var _url = $(this).data("url");
        $("#modal-cardshow-show iframe").attr('src', _url);
    });

    /* 操作 - 查看 */
    $(".operate-edit").click(function () {
        var _url = $(this).data("url");
        $(".form-update").attr("action", _url);
        $.get(_url, function (data) {
            console.log('operate-edit');
             // data.link_img = data.link_img + ';'
            var er = data.link_img
            var is = er+';'
            console.log(is);
            console.log(er);
            $("#inputIcons1").val(er);
            $("#iconStart1").html(is);
            console.log(data);

            showInformation(data, 'class', 'info-');
        });
    });

    /* 操作 - 更新*/
    $(".operate-update").click(function () {
        var _url      = $('.form-update').attr('action');
        var _method   = $('.form-update').attr('method') ? $('.form-update').attr('method') : 'post';
        var _formData = new FormData($('.form-update')[0]);
        $("[class^='error-']").addClass('hidden');
        $.ajax({
            url: _url,
            type: _method,
            cache: false,
            contentType: false,
            processData: false,
            data: _formData,
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function (json) {
                console.log('success-update')
                console.log(json)
                $('.hintModal').modal('show');
                $('.hintModal .modal-body').text(json.msg);
                $('.hintModal .after-operate').text();
            },
            error: function (json) {
                console.log('error-update')
                console.log(json)
                var errors = json.responseJSON;
                showError(errors);
                return false;
            }
        });
    });


    /* 操作 - 查看3 */
    $(".operate-edit3").click(function () {
        var _url = $(this).data("url");
        $(".form-update3").attr("action", _url);
        $.get(_url, function (data) {
            console.log('operate-edit3');
            // data.link_img = data.link_img + ';'
            var er = data.category_img
            var is = er+';'
            console.log(is);
            console.log(er);
            $("#inputIcons1").val(er);
            $("#iconStart1").html(is);
            console.log(data);

            showInformation(data, 'class', 'info-');
        });
    });
    /* 操作 - 更新3*/
    $(".operate-update3").click(function () {
        var _url      = $('.form-update3').attr('action');
        console.log(_url)
        var _method   = $('.form-update3').attr('method') ? $('.form-update3').attr('method') : 'post';
        console.log(_method)
        var _formData = new FormData($('.form-update3')[0]);
        $("[class^='error-']").addClass('hidden');
        $.ajax({
            url: _url,
            type: _method,
            cache: false,
            contentType: false,
            processData: false,
            data: _formData,
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function (json) {
                console.log('success-update')
                console.log(json)
                $('.hintModal').modal('show');
                $('.hintModal .modal-body').text(json.msg);
                $('.hintModal .after-operate').text();
            },
            error: function (json) {
                console.log('error-update')
                console.log(json)
                var errors = json.responseJSON;
                showError(errors);
                return false;
            }
        });
    });


    /* 操作 - 查看4 */
    $(".operate-edit4").click(function () {
        var _url = $(this).data("url");
        $(".form-update4").attr("action", _url);
        $.get(_url, function (data) {
            console.log('operate-edit4');
            // data.link_img = data.link_img + ';'
            var er = data.category_img
            var is = er+';'
            console.log(is);
            console.log(er);
            $("#inputIcons4").val(er);
            $("#iconStart4").html(is);
            console.log(data);

            showInformation(data, 'class', 'info-');
        });
    });
    /* 操作 - 更新4*/
    $(".operate-update4").click(function () {
        var _url      = $('.form-update4').attr('action');
        console.log(_url)
        var _method   = $('.form-update4').attr('method') ? $('.form-update4').attr('method') : 'post';
        console.log(_method)
        var _formData = new FormData($('.form-update4')[0]);
        $("[class^='error-']").addClass('hidden');
        $.ajax({
            url: _url,
            type: _method,
            cache: false,
            contentType: false,
            processData: false,
            data: _formData,
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function (json) {
                console.log('success-update')
                console.log(json)
                $('.hintModal').modal('show');
                $('.hintModal .modal-body').text(json.msg);
                $('.hintModal .after-operate').text();
            },
            error: function (json) {
                console.log('error-update')
                console.log(json)
                var errors = json.responseJSON;
                showError(errors);
                return false;
            }
        });
    });



    /* 操作 - 查看2 */
    $(".operate-edit2").click(function () {
        var _url = $(this).data("url");
        $(".form-update2").attr("action", _url);
        $.get(_url, function (data) {
            console.log('operate-edit2');
            // data.link_img = data.link_img + ';'
            console.log(data);

            showInformation(data, 'class', 'info-');
        });
    });
    /* 操作 - 更新2*/
    $(".operate-update2").click(function () {
        var _url      = $('.form-update2').attr('action');
        var _method   = $('.form-update2').attr('method') ? $('.form-update2').attr('method') : 'post';
        var _formData = new FormData($('.form-update2')[0]);
        $("[class^='error-']").addClass('hidden');
        $.ajax({
            url: _url,
            type: _method,
            cache: false,
            contentType: false,
            processData: false,
            data: _formData,
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function (json) {
                console.log('success-update')
                console.log(json)
                $('.hintModal').modal('show');
                $('.hintModal .modal-body').text(json.msg);
                $('.hintModal .after-operate').text();
            },
            error: function (json) {
                console.log('error-update')
                console.log(json)
                var errors = json.responseJSON;
                showError(errors);
                return false;
            }
        });
    });


    /* 操作 - 删除 */
    $('.operate-delete').click(function () {
        $('.bs3').on('show.bs.modal', function (event) {
            var relatedTarget = $(event.relatedTarget);
            var _url          = relatedTarget.data('url');
            var _modal        = $(this);
            _modal.find('form').attr('action', _url);
            _modal.find('.modal-body').html('<p><i class="iconFont">&#xe604;</i>确认删除所选？</p>');
        });
    });

    $('.operate-batch-delete').click(function () {
        var length = $('.select-item:checked').length;
        var _url   = $(this).data('url');
        if (length == 0) {
            alert('未选择');
            return false;
        } else {
            var ids_arr = new Array; // 定义一个空数组，用来存放选中的值
            $('.select-item:checked').each(function () {
                ids_arr.push($(this).val()); // 遍历checkbox，有checked的加到ids_arr数组中
            });
            var ids_str = ids_arr.join(','); // 将数组用','连接成字符串
            $('.bs3').on('show.bs.modal', function () {
                var _modal = $(this);
                _modal.find('form').attr('action', _url);
                _modal.find('.modal-body').html('<p><i class="iconFont">&#xe604;</i>确认删除所选 ' + length + ' 条数据？</p>');
                _modal.find('form').append('<input type="hidden" name="ids" value="' + ids_str + '"/>');
            });
        }
    });


    /* 操作 - 收藏/关注 */
    $(".operate-follow").click(function () {
        var _url = $(this).data("url");
        $.ajaxSetup({ // 无form表单时
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.post(_url, function (json) {
            $('.hintModal').modal('show');
            $('.hintModal .modal-body').text(json.msg);
        });
    });

    /* 操作 - 分享 */
    $(".operate-share").click(function () {
        var _url = $(this).data("url");
        console.log(_url)
    });

    /* 提示 - 自动隐藏 */
    $('.hintModal').on('show.bs.modal', function () {
        var _modal = $(this);
        _modal.oneTime('2s', function () {
            _modal.modal('hide');
        });
    });

    /* 提示 - 隐藏后跳转 */
    $('.hintModal').on('hidden.bs.modal', function () {
        var _url = $('.hintModal .after-operate').text();

        window.location = _url; // 为空，刷新当前页
    });

    /* 模态框消失是错误信息隐藏并置为空 */
    $(".modal").on("hidden.bs.modal", function () {
        $("[class^='error-']").text('');
        $("[class^='error-']").addClass('hidden');
    });

    /* 查询下拉选择 */
    $(".dropdown-word").click(function () {
        var word = $(this).attr('id');
        var text = $(this).text();
        $('.word-select').attr('name', word);
        $('.word-select').html(text);
        $('.word').val(word);
    });

    /* 搜索 */
    $('.b-form-bg').click(function () {
        var word   = $('.word-select').attr('name');
        var search = $('.b-form-bor').val();
        if (word == 'noword') {
            alert('请选择要搜索的字段');
            return false;
        } else {
            if (search) {
                // window.location.href = 'employee/' + word + '/' + search; //方法1
                $('[name="search-form"]').submit();
            } else {
                alert('请输入关键字');
                return false;
            }
        }
    });


    /*2017-6-20*/
    $('#modal-product-add').on("click", function(e){
        console.log("123")
        $("#selIcon")&&$("#selIcon").hide();
    });
    $("#iconId").on("click", function (e) {
        $("#selIcon").show();
        e.stopPropagation();
        console.log('failed');
        $("#selIcon span").on("click", function () {
            var itext  = $(this).attr('name');
            var itexts = $(this).find("i").text();
            $("#inputIcons").val(itext);
            console.log(itext);
            $("#iconStart").text(itexts);
            $("#selIcon").hide();

        })
    });

    $('#modal-employee-edit').on("click", function(e){
        console.log("123")
        $("#selIcon1")&&$("#selIcon1").hide();
    });
    $('#modal-employee-edit3').on("click", function(e){
        console.log("123")
        $("#selIcon1")&&$("#selIcon1").hide();
    });

    $("#iconId1").on("click", function (e) {
        console.log("1")
        $("#selIcon1").show();
        e.stopPropagation();
        $("#selIcon1 span").on("click", function () {
            console.log("12")
            var itext  = $(this).attr('name');
            var itexts = $(this).find("i").text();
            $("#inputIcons1").val(itext);
            $("#iconStart1").text(itexts);
            $("#selIcon1").hide();
        })
    })

    $('#modal-employee-edit4').on("click", function(e){
        console.log("123")
        $("#selIcon4")&&$("#selIcon4").hide();
    });
    $("#iconId4").on("click", function (e) {
        $("#selIcon4").show();
        e.stopPropagation();
        console.log('111');
        $("#selIcon4 span").on("click", function () {
            var itext  = $(this).attr('name');
            var itexts = $(this).find("i").text();
            $("#inputIcons4").val(itext);
            console.log(itext);
            console.log(itexts);
            $("#iconStart4").text(itexts);
            $("#selIcon4").hide();

        })
    })

});

/* 初始化 */
function init() {
    // 搜索初始值
    var word    = getQueryString('word');
    var keyword = getQueryString('keyword');
    word        = (word != null) ? word : 'noword';
    keyword     = (keyword != null) ? decodeURIComponent(keyword) : '';
    $('.word-select').attr('name', word);
    var text = $('#' + word).text();
    $('.word-select').html(text);
    $('.word').val(word);
    $('[name="keyword"]').val(keyword);
}

/* 获取url参数 */
function getQueryString(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r   = window.location.search.substr(1).match(reg);
    if (r != null) {
        return (r[2]);
    }
    return null;
}

/**
 * 显示错误信息
 *
 * @param data       错误信息
 */
function showError(data) {
    $.each(data, function (i, n) {
        $('.error-' + i.split('.')[1]).removeClass('hidden').text(n);
    });
}

/**
 * 显示信息
 *
 * @param data      数据，必填
 * @param label     标签名，默认class
 * @param prefix    前缀，默认空
 */
function showInformation(data, label, prefix) {
    var selector = '';
    if (label) {
        selector = label + '=';
    } else {
        selector = 'class=';
    }
    if (prefix) {
        selector = selector + prefix;
    }
    $.each(data, function (i, n) {
        if ($('[' + selector + i + ']').is('img') && n != null) {
            if (n != null) {
                $('[' + selector + i + ']').attr('src', '../' + n);
            } else {
                $('[' + selector + i + ']').attr('src', '../static/home/images/avatar.jpg');
            }
        }
        if ($('[' + selector + i + ']').is('input') && n != null) {
            if ($('[' + selector + i + ']').attr('type') == "checkbox") {
                if (n == 1) {
                    $('[' + selector + i + ']').prop("checked", true);
                } else {
                    $('[' + selector + i + ']').prop("checked", false);
                }

            } else if ($('[' + selector + i + ']').attr('type') == "radio") {
                if (n) {
                    $('[' + selector + i + '][value="' + n + '"]').prop("checked", true);
                } else {
                    $('[' + selector + i + '][value="0"]').prop("checked", true);
                }
            } else {
                if (typeof n == 'object') { // 判断是否是关系模型对象
                    $('[' + selector + i + ']').val(n['name']);
                } else {
                    $('[' + selector + i + ']').val(n);
                }
            }
        }
        if ($('[' + selector + i + ']').is('span')) {
            $('[' + selector + i + ']').text(n);
        }
        if ($('[' + selector + i + ']').is('select')) {
            $('[' + selector + i + ']').val(n);
        }
    });
}