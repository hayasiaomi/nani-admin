var nani = new $.nani();
$(document).ready(function () {
    $("#username").val(localStorage.getItem("username"));
});

function doLogin() {
    var btnLogin = $('#btnLogin');
    var loginBody = $('.login-body');
    var name = $("#username");
    var pwd = $("#password");
    btnLogin.button('loading');
    if (name.val() === "" || pwd.val() === "") {
        nani.showMsg("请输入完整信息！", 'info', 2000);
        btnLogin.button('reset');
    } else {
        $.post('/admin/auth',{
            'username': name.val(),
            'password': pwd.val()
        },function (data) {
            localStorage.setItem('username', name.val());
            if (data.code === 1) {
                nani.showMsgAndRedirect(data.msg, 'success', 1000, '/admin','false');
            } else {
                loginBody.addClass('animate shake');
                $.toast({
                    text: data.msg,
                    heading: heading,
                    icon: 'error',
                    showHideTransition: 'fade',
                    allowToastClose: true,
                    hideAfter: 2000,
                    stack: 1,
                    position: 'top-center',
                    textAlign: 'left',
                    loader: true,
                    loaderBg: '#ffffff',
                    afterHidden: function () {
                        loginBody.removeClass('animate shake');
                    }
                });
                btnLogin.button('reset');
            }
        },'JSON');
    }
}

$(document).keydown(function (event) {
    if (event.keyCode === 13) {
        doLogin();
    }
});
