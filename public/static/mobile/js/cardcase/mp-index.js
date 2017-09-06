$(function () {

});

function checkField(url, data) {
    return useAjax('post', url, data);
}

/* 分组拼接 */
function jointGroup(data) {
    var _html = '';
    $.each(data, function (k, v) {
        _html += '<dl class=" accordion-item custom-group" data-id="' + v.id + '">';
        if (v.id) {
            _html += '<b class="mp-btn3"><em class="rt">-</em></b>';
        }
        _html += '<dt class=" accordion-title ">';
        _html += '<span> ' + v.name + '</span>';
        _html += '<i class="on">' + v.count + '</i>';
        _html += '</dt>';
        _html += '<dd class="accordion-bd am-collapse">';
        _html += '<div class="accordion-content" id="group' + v.id + '">';
        _html += '</div>';
        _html += '</dd>';
        _html += '</dl>';
    });
    return _html;
}

/* 分组模态拼接 */
function jointGroupModal(data) {
    var _html = '';
    $.each(data, function (k, v) {
        _html += '<li>';
        _html += '<label for="num' + v.id + '">';
        _html += '<input type="radio" name="group_id" id="num' + v.id + '" value="' + v.id + '">';
        _html += '<span>' + v.name + '</span>';
        _html += '</label>';
        _html += '</li>';
    });
    return _html;
}


/* 组内人员拼接 */
function jointFollower(data) {
    var _html = '';
    $.each(data, function (k, v) {
        _html += '<div class="group-list">';
        _html += '<div class="group-list-mes">';
        _html += '<div class="mes-img"><img src="' + v.avatar + '" alt=""></div>';
        _html += '<div class="mes-data">';
        if (v.employee) {
            _html += '<h3>' + v.employee.nickname + '（' + v.company.display_name + '）</h3>';
            _html += '<p>' + v.employee.positions + '</p>';
            _html += '<i>企业</i>';
        } else {
            _html += '<h3>' + v.followed.nickname + '</h3>';
            _html += '<p>' + v.followed.mobile + '</p>';
            _html += '<i>个人</i>';
        }
        _html += '</div>';
//                _html += '<div class="mes-gz rt ygz">';
//                _html += '<i class="iconfont">&#xe61b;</i>';
//                _html += '<span>已关注</span>';
//                _html += '</div>';
        _html += '</div>';
        _html += '<ul class="group-list-btn" data-id="' + v.followed_id + '" data-group-id="' + v.group_id + '">';
        _html += '<li class="lt mp-show"><a href="javascript:;"><i class="iconfont">&#xe639;</i><span>查看</span></a></li>';
        if (v.employee) {
            _html += '<li class="lt mp-call"><a href="TEL:' + v.employee.mobile + '"><i class="iconfont">&#xe644;</i><span>拨号</span></a></li>';
        } else {
            _html += '<li class="lt mp-call"><a href="TEL:' + v.followed.mobile + '"><i class="iconfont">&#xe644;</i><span>拨号</span></a></li>';
        }
        _html += '<li class="lt mp-group-edit mp-btn5" ><a href="javascript:;"><i class="iconfont">&#xe694;</i><span>分组</span></a></li>';
        _html += '<li class="lt mp-unfollow"><a href="javascript:;"><i class="iconfont">&#xe609;</i><span>取消</span></a></li>';
        _html += '</ul>';
        _html += '</div>';
    });
    return _html;
}

function showError(scope, data) {
    $.each(data, function (i, n) {
        var obj = scope.find('.error-' + i.split('.')[1]);
        obj.removeClass('hidden');
        obj.text(n);
    });
}

