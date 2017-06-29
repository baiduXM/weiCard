/**
 * Created by Hsieh on 2017/4/7.
 */
$(function () {


    /* 显示modal时，更新form里的action */
    $('[class^="opshow-"]').on('touchstart', function () {
        var _this  = $(this);
        var _url   = _this.data('url');
        var _modal = _this.data('target');
        // console.log('opshow-');
        // console.log(_url);
        $(_modal).find('form').attr('action', _url);
    });
    // /* 删除 */
    // $('.op-delete').click(function () {
    //     var _this  = $(this);
    //     var _url   = _this.data('url');
    //     var _modal = _this.data('target');
    //     $(_modal).find('form').attr('action', _url);
    // });

    /* 表单ajax提交 */
    $('.op-submit').on('touchstart', function () {
        var _this     = $(this);
        var _modal    = _this.parents('.modal');
        var _form     = _this.parents('form');
        var _url      = _form.attr('action');
        var _method   = _form.attr('method');
        var _formData = _form.serializeArray();
        $.ajax({
            type: _method,
            url: _url,
            data: _formData,
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
            success: function (data) {
                console.log('success');
                console.log(data);
                /* 现实成功消息，刷新当前页面 */
                $.Display.dismiss(_modal.data('display-name'));
                $.messager.show("<i class='icon-check'>  " + data + "</i>", {
                    type: 'success', placement: 'center', autoHide: 800, closeButton: false
                });
                setTimeout(window.location.href = _url, 1); // 1s后刷新页面
            },
            error: function (data) {
                console.log('error');
                console.log(data);
                /* 显示错误 */
                var errors = JSON.parse(data.response);
                showError(_modal, errors);
            }
        });
    });
});

/**
 * 显示错误信息
 *
 * @param scope     当前范围
 * @param data      错误信息
 */
function showError(scope, data) {
    $.each(data, function (i, n) {
        var obj = scope.find('.error-' + i.split('.')[1]);
        obj.addClass('has-error');
        obj.find('.help-text').text(n);
    });
}