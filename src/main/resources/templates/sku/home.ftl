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
                    SKU属性管理
                </div>


                <div class="panel-body">

                    <div class="container-fluid ni-container-fluid">
                        <form action="/sku" method="get" class="navbar-form navbar-left ni-navbar-form" role="search">
                            <div class="form-group">
                                <input type="text" name="keyword" id="keyword" class="form-control" placeholder="属性名"
                                       value="${keyword!''}">
                            </div>
                            <button type="submit" class="btn btn-default">查找</button>
                        </form>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover ni-table">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>SKU名称</th>
                                <th>前端名称</th>
                                <th>后端名称</th>
                                <th>是否选择值</th>
                                <th>操作 <a class="btn btn-success btn-xs" href="/sku/addSkuProperty">增加</a></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#assign skuPropertyVos = pagerVo.data >
                            <#if skuPropertyVos?? && (skuPropertyVos?size > 0) >
                                <#list skuPropertyVos as skuPropertyVo>
                                    <tr>
                                        <td>${ skuPropertyVo.id }</td>
                                        <td>${ skuPropertyVo.propertyName!"" }</td>
                                        <td>${ skuPropertyVo.frontPropertyName!"" }</td>
                                        <td>${ skuPropertyVo.backPropertyName!""}</td>
                                        <td style="width: 98px;text-align: center">${ skuPropertyVo.selectable?string("是","否")}</td>
                                        <td style="width: 165px;text-align: center">
                                            <a href="/sku/editSkuProperty?id=${skuPropertyVo.id}" class="btn btn-primary btn-xs">编辑</a>
                                            |
                                            <a href="/sku/valueManager?id=${skuPropertyVo.id}" class="btn btn-info btn-xs">值管理</a>
                                            |
                                            <a href="/sku/delete?id=${skuPropertyVo.id}" class="btn btn-danger btn-xs">删除</a>
                                        </td>
                                    </tr>
                                </#list>

                            <#else >
                                <tr>
                                    <td colspan="6">当前没有商品数据</td>
                                </tr>
                            </#if>


                            </tbody>
                        </table>
                    </div>

                    <#if (pagerVo.totalPage > 1)>
                        <nav aria-label="Page navigation pull-right">
                            <ul class="pagination ni-pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <#list 1..pagerVo.totalPage as num>
                                    <#if num == pagerVo.nowPage>
                                        <li class="active"><a href="javascript:void(0)">${num}</a></li>
                                    <#else >
                                        <li>
                                            <a href="/sku?keywork=${keyword!''}&pageIndex=${num}&pageSize=${pagerVo.pageSize}">${num}</a>
                                        </li>
                                    </#if>
                                </#list>

                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </#if>
                </div>
            </div>

            <!-- /.table-responsive -->


        </div>
        <@footer>

        </@footer>
    </body>

    </html>
</#compress>
