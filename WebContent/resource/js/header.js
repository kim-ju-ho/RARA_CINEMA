$(function () {
    $('#loginform').submit(function (e) {
        return false;
    });

    $('#modaltrigger').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});