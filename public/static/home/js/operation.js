/**
 * Created by Hsieh on 2017/4/7.
 */
$(function () {
    /* 操作 - 添加 - 员工 */
    $('#employee .operate-add').on('click', function () {
        var _url = $('#employee').attr('action');
        var _formData = new FormData($('#employee')[0]);
        $("[class^='error-']").addClass('hidden');
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
                $('.hintModal .modal-body').text("添加成功");
                $('.hintModal .after-operate').text(_url);
            },
            error: function (json) {
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
            showInformation(data, 'info-', 'name');
        })
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
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.post(_url, function (json) {
            console.log('post:' + json);
        });
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
        window.location = _url;
    });

    /**
     * 显示错误信息
     *
     * @param msg       错误信息
     * @param name      数组
     * 名
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
     * @param prefix    前缀，默认空
     * @param label     标签名，默认class
     */
    function showInformation(data, prefix, label) {
        var selector = '';
        selector = 'class=';
        if (prefix) {
            selector = 'class=' + prefix;
            if (label) {
                selector = label + '=' + prefix;
            }
        }
        $.each(data, function (i, n) {
            if (typeof n == 'object' && n != null) {
                $('[' + selector + i + ']').val(n['name'])
            } else {
                $('[' + selector + i + ']').val(n)
            }
        });
    }

});