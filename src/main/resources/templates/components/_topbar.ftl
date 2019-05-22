<#macro topbar mapcode="m000">
    <#import "_header.ftl" as hd >
    <#import "_sidebar.ftl" as sb>
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
        <@hd.header></@hd.header>
        <!-- 菜单-->
        <@sb.sidebar selectItemCode="${mapcode}"></@sb.sidebar>
    </nav>
</#macro>
