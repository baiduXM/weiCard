/**
 * Created by Hsieh on 2017/4/7.
 */
$(function () {

    var once = true;
    /* 显示modal时，更新form里的action */
    // $('[class^="opshow-"]').on('touchstart', function () {
    $('[class^="opshow-"]').on('tap', function () {
        var _this      = $(this);
        var _url       = _this.data('url');
        var _after_url = _this.data('after_url');
        var _modal     = _this.data('target');
        // console.log('opshow-');
        // console.log(_url);
        $(_modal).find('form').attr('action', _url);
        $(_modal).find('[name="after-url"]').val(_after_url);
    });
    // /* 删除 */
    // $('.op-delete').click(function () {
    //     var _this  = $(this);
    //     var _url   = _this.data('url');
    //     var _modal = _this.data('target');
    //     $(_modal).find('form').attr('action', _url);
    // });

    /* 表单ajax提交 */
    $('.op-submit').unbind('click', 'touchstart', 'tap').on('tap', function (event) {
        if (!once) {
            return false;
        }
        once = false;
        event.stopPropagation();
        var _this      = $(this);
        var _modal     = _this.parents('.modal');
        var _form      = _this.parents('form');
        var _url       = _form.attr('action');
        var _after_url = _form.find('[name="after-url"]');
        var _method    = _form.attr('method');
        var _formData  = _form.serializeArray();
        $.ajax({
            type: _method,
            url: _url,
            data: _formData,
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}, // CSRF验证必填
            success: function (data) {
                once = true;
                console.log('success');
                console.log(data);
                /* 现实成功消息，刷新当前页面 */
                $.Display.dismiss(_modal.data('display-name'));
                $.messager.show("<i class='icon-check'>  " + data + "</i>", {
                    type: 'success', placement: 'center', autoHide: 1000, closeButton: false
                });
                // if (_method == 'delete') {
                //
                // }
                // if (_method == 'put') {
                //
                // }
                // if (_method == 'post') {
                //
                // }
                window.location.href = _after_url ? _after_url : _url; // 1s后刷新页面
            },
            error: function (data) {
                once = true;
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

