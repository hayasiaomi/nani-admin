<#macro head>
<#import  "mHeader.ftl" as mHeader>
<#import  "mMenu.ftl" as mMenu>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>呐呢商城</title>
    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="/dist/css/sb-admin-2.css">
    <link rel="stylesheet" href="/plugins/morrisjs/morris.css">
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css" type="text/css">
</head>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:void(0)">呐呢商城后台管理系统</a>
        </div>
        <!-- 头部-->
        <@mHeader></@mHeader>
        <!-- 菜单-->
        <#include "mMenu.ftl">

    </nav>
</#macro>

<#macro footer>
<#include "mFooter.ftl">
</div>
<script src="/plugins/jquery/jquery.min.js"></script>
<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/metisMenu/metisMenu.min.js"></script>
<script src="/plugins/raphael/raphael.min.js"></script>
<script src="/plugins/morrisjs/morris.min.js"></script>
<script src="/data/morris-data.js"></script>
<script src="/js/sb-admin-2.js"></script>
<script>
    var nani = new $.nani();
    var heading = "<@spring.message code='common.text.tips' />";
</script>
<#nested />
</body>
</html>
</#macro>
