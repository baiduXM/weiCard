/**
 * 使用ajax
 *
 * @param method    请求方法
 * @param url       请求路径
 * @param data      参数
 * @param sync      是否异步
 * @returns {string}
 */
function useAjax(method, url, data, sync) {
    var json = '';
    var _sync;
    _sync ? _sync = sync : _sync = false;
    $.ajax({
        type: method,
        url: url,
        data: data,
        async: _sync, // 非异步(同步)加载
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
        }, // CSRF验证必填
        success: function (data, textStatus) {
            json        = data;
            json.status = textStatus;
        },
        error: function (data, textStatus) {
            json        = data;
            json.status = textStatus;
        }
    });
    return json;
}

/**
 * 显示数据
 *
 * @param _html     数据
 * @param _div      定位
 * @param _type     显示类型
 */
function showHtml(_html, _div, _type) {
    if (_type == 'init' || _type == 'refresh') {
        $(_div).html(_html);
    } else if (_type == 'more') {
        $(_div).append(_html);
    } else if (_type == 'before') {
        $(_div).prepend(_html);
    }
}
