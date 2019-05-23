<#compress>
    <#include "../components/_start.ftl">
    <!DOCTYPE html>
    <html lang="zh">
    <@head>
        <style type="text/css">
            .container-fluid.ni-container-fluid {
                padding-left: 0px;
            }

            .navbar-form.ni-navbar-form {
                padding-left: 0px;
            }

            .table.ni-table {
                margin-bottom: 0px;
            }

            .pagination.ni-pagination {
                margin-top: 3px
            }
        </style>
    </@head>
    <body>
    <div id="wrapper">
        <@topbar mapcode="m002-03"></@topbar>
        <div id="page-wrapper">

            <div class="panel panel-info">
                <div class="panel-heading">
                    <span class="label label-primary">${skuPropertyVo.propertyName}</span>的值管理 <a
                            class="btn btn-success btn-xs" href="/sku">返回</a>
                </div>


                <div class="panel-body">

                    <div class="container-fluid ni-container-fluid">
                        <div class="row">
                            <div class="col-sm-4">
                                <form action="/sku/value/add" method="post" class="navbar-form navbar-left ni-navbar-form"
                                      role="search">
                                    <div class="form-group">
                                        <input type="text" name="propertyValue" id="keyword" class="form-control"
                                               placeholder="属性值">
                                        <input type="hidden" name="skuPropertyId" value="${skuPropertyVo.id}">
                                    </div>
                                    <button type="submit" class="btn btn-default">增加</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover ni-table">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>属性值</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <#if skuPropertyValueVos?? && (skuPropertyValueVos?size > 0) >
                                <#list skuPropertyValueVos as skuPropertyValueVo>
                                    <tr>
                                        <td>${ skuPropertyValueVo.id!''}</td>
                                        <td>${ skuPropertyValueVo.propertyValue!"" }</td>
                                        <td style="width: 98px;text-align: center">
                                            <#if skuPropertyValueVo.enable??>
                                                <label class="label label-success">启动</label>
                                            <#else >
                                                <label class="label label-success">禁止</label>
                                            </#if>
                                        </td>
                                        <td style="width: 165px;text-align: center">
                                            <a href="/sku/value/delete?id=${skuPropertyValueVo.id}&skuPropertyId=${skuPropertyVo.id}" class="btn btn-danger btn-xs">删除</a>
                                        </td>
                                    </tr>
                                </#list>

                            <#else >
                                <tr>
                                    <td colspan="4">当前没有商品数据</td>
                                </tr>
                            </#if>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- /.table-responsive -->


        </div>
        <@footer>

        </@footer>
    </body>

    </html>
</#compress>
