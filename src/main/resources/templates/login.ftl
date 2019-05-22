<#compress >
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>呐呢商城</title>
    <link  rel="stylesheet"  href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"  href="/plugins/metisMenu/metisMenu.min.css" >
    <link rel="stylesheet"  href="/plugins/sb-admin/sb-admin-2.css">
    <link rel="stylesheet"  href="/plugins/font-awesome/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/plugins/animate/animate.min.css">
    <link rel="stylesheet" href="/plugins/toast/css/jquery.toast.min.css">
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">呐呢商城</h3>
                    </div>
                    <div class="panel-body">
                        <form>
                            <fieldset>
                                <div class="form-group">
                                    <input id="username" class="form-control" placeholder="<@spring.message code='login.form.username' />" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input id="password" class="form-control" placeholder="<@spring.message code='login.form.password' />" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me" /> <@spring.message code='login.form.remember' />
                                    </label>
                                </div>
                                <button id="btnLogin" type="button" class="btn btn-lg btn-success btn-block animated fadeInUp" data-loading-text="<@spring.message code='login.form.btn.logining' />" style="animation-delay: 0.4s;outline: none;" onclick="doLogin()" ><@spring.message code='login.form.btn.login' /></button>


                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var heading = "<@spring.message code='common.text.tips' />";
    </script>
    <script src="/plugins/jquery/jquery.min.js"></script>
    <script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/plugins/metisMenu/metisMenu.min.js"></script>
    <script src="/plugins/sb-admin/sb-admin-2.js"></script>
    <script src="/plugins/toast/js/jquery.toast.min.js"></script>
    <script src="/js/nani.js"></script>
    <script src="/js/login.js"></script>
</body>

</html>
</#compress>