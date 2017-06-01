/**
 * Created by Hsieh on 2017/4/7.
 */
$(function () {
    /* 操作 - 添加 */
    $('.operate-create').on('click', function () {
        var _url = $(this).parents('form').attr('action');
        var _formData = new FormData($(this).parents('form')[0]);
        // var _url = $('.form-create').attr('action');
        // var _formData = new FormData($('.form-create')[0]);
        $("[class^='error-']").addClass('hidden');
        $.ajaxSetup({ // 无form表单时
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: _url,
            type: "post",
            cache: false,
            contentType: false,
            processData: false,
            data: _formData,
            dataType: 'json',
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

    /* 操作 - 显示 */
    $(".operate-show").click(function () {
        var _url = $(this).data("url");
        $.get(_url, function (data) {
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
            showInformation(data, 'class', 'info-');
        });
    });

    /* 操作 - 更新*/
    $(".operate-update").click(function () {
        var _url = $('.form-update').attr('action');
        var _formData = new FormData($('.form-update')[0]);
        $("[class^='error-']").addClass('hidden');
        $.ajaxSetup({ // 无form表单时
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: _url,
            type: "post",
            cache: false,
            contentType: false,
            processData: false,
            data: _formData,
            dataType: 'json',
            success: function (json) {
                $('.hintModal').modal('show');
                $('.hintModal .modal-body').text(json.msg);
                $('.hintModal .after-operate').text();
            },
            error: function (json) {
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
            var _url = relatedTarget.data('url');
            var _modal = $(this);
            _modal.find('form').attr('action', _url);
        });
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
        alert(1);
    });

    /* 提示 - 自动隐藏 */
    $('.hintModal').on('show.bs.modal', function (event) {
        var _modal = $(this);
        _modal.oneTime('1s', function () {
            _modal.modal('hide');
        });
    });

    /* 提示 - 隐藏后跳转 */
    $('.hintModal').on('hidden.bs.modal', function (event) {
        var _url = $('.hintModal .after-operate').text();
        window.location = _url; // 为空，刷新当前页
    });

    /* 模态框消失是错误信息隐藏并置为空 */
    $(".modal").on("hidden.bs.modal", function () {
        $("[class^='error-']").text('');
        $("[class^='error-']").addClass('hidden');
    });

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
                } else {
                    if (typeof n == 'object') { // 判断是否是关系模型对象
                        $('[' + selector + i + ']').val(n['name']);
                    } else {
                        $('[' + selector + i + ']').val(n);
                    }
                }

            } else if ($('[' + selector + i + ']').is('select')) {
                $('[' + selector + i + ']').val(n);
            }
        });
    }
});