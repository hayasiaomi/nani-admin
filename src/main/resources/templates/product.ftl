<#compress>
    <#include "components/_start.ftl">
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
        <@topbar mapcode="m002"></@topbar>
        <div id="page-wrapper">

            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">商品管理</h3>
                </div>


                <div class="panel-body">

                    <div class="container-fluid ni-container-fluid">
                        <form class="navbar-form navbar-left ni-navbar-form" role="search">
                            <div class="form-group">
                                <input type="text" name="keyword" id="keyword" class="form-control" placeholder="Search" value="${keyword!''}">
                            </div>
                            <button type="submit" class="btn btn-default">查找</button>
                        </form>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover ni-table">
                            <thead>
                            <tr>
                                <th>商品编号</th>
                                <th>商品名称</th>
                                <th>浏览</th>
                                <th>分类</th>
                                <th>库存数量</th>
                                <th>价格</th>
                                <th>状态</th>
                                <th>操作 <a class="btn btn-success btn-xs" href="/product/add">增加</a></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#assign productVos= pagerVo.data >
                            <#if productVos?? && (productVos?size > 0) >
                                <#list productVos as productVo>
                                    <tr>
                                        <td>${ productVo.id }</td>
                                        <td>${ productVo.productName!"" }</td>
                                        <td>${ productVo.pictureUrl!"" }</td>
                                        <td></td>
                                        <td>${ productVo.stock }</td>
                                        <td>${ productVo.salePrice}</td>
                                        <td>${productVo.status}</td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-xs">编辑</button>
                                            |
                                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                                        </td>
                                    </tr>
                                </#list>

                            <#else >
                                <tr>
                                    <td colspan="8">当前没有商品数据</td>
                                </tr>
                            </#if>


                            </tbody>
                        </table>
                    </div>

                    <#if pagerVo.totalPage gt 1>
                        <nav aria-label="Page navigation pull-right">
                            <ul class="pagination ni-pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <#list 1..pagerVo.totalPage as num>
                                    <#if num == pagerVo.nowPage>
                                        <li  class="active"><a href="javascript:void(0)">${num}</a></li>
                                        <#else >
                                            <li><a href="/product?keywork=${keyword!''}&pageIndex=${num}&pageSize=${pagerVo.pageSize}">${num}</a></li>
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
