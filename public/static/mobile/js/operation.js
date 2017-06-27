/**
 * Created by Hsieh on 2017/4/7.
 */
$(function () {
    /* 表单ajax提交 */
    $('.op-submit').click(function () {
        var _url = $(this).parents('form').attr('action');
        var _method = $(this).parents('form').attr('method');
        var _formData = new FormData($('.form-import')[0]);
        console.info(_url);
        console.info(_method);
        console.info(_formData);
        $.ajaxSetup({ // 无form表单时
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        // $.ajax({
        //     url: _url,
        //     type: _method,
        //     data: _formData,
        //     dataType: 'json',
        //     // cache: false,
        //     // contentType: false,
        //     // processData: false,
        //     success: function (json) {
        //         console.log('success');
        //         console.log(json);
        //         $('.hintModal').modal('show');
        //         $('.hintModal .modal-body').text(json.msg);
        //         $('.hintModal .after-operate').text(_url);
        //         return false;
        //     },
        //     error: function (json) {
        //         console.log('failed');
        //         console.log(json);
        //         var errors = json.responseJSON;
        //         showError(errors);
        //         return false;
        //     }
        // });

    });

});