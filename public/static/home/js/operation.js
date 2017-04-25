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
        return false;
    });

    /* 操作 - 显示 */
    // operate-show
    /* 操作 - 删除 */
    // operate-delete

    /* 提示 - 自动隐藏 */
    $('.hintModal').on('show.bs.modal', function (event) {
        var _modal = $(this);
        _modal.oneTime('1s', function () {
            _modal.modal('hide');
        });
    });

    /* 提示 - 隐藏后动作 */
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
    function showError(msg) {
        $.each(msg, function (i, n) {
            $('.error-' + i.split('.')[1]).removeClass('hidden').text(n);
        });
    }

});