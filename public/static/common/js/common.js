$(function () {
    $('#back').click(function () {
        var url = $(this).data('url');
        window.location.href = url;
    });
});
