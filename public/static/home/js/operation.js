/**
 * Created by Hsieh on 2017/4/7.
 */
$(function () {
    $('#employee .operate-submit').on('click', function () {
        var _url = $('#employee').attr('action');
        // var _url = {{ url('company/employee') }}
        // var _formData = $('#employee').serializeArray();
        var _formData = new FormData($('#employee')[0]);
        console.log(_formData);

        $.ajax({
            url: _url,
            type: "post",
            cache: false,
            contentType: false,
            processData: false,
            data: _formData,
            dataType: 'json',
            success: function (json) {
                console.log(json);
                return false;
            },
            error: function (json) {
                var errors = json.responseJSON;
                console.log(errors);

                return false;
            }
        });
        return false;
    });

    /**
     * 显示错误信息
     *
     * @param msg       错误信息
     * @param name      数组
     * 名
     */
    function showError(msg, name) {

    }

});