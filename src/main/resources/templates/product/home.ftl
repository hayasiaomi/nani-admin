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
        <@topbar mapcode="m002-01"></@topbar>
        <div id="page-wrapper">

            <div class="panel panel-info">
                <div class="panel-heading">
                    商品管理
                </div>


                <div class="panel-body">

                    <div class="container-fluid ni-container-fluid">
                        <form class="navbar-form navbar-left ni-navbar-form" role="search">
                            <div class="form-group">
                                <input type="text" name="keyword" id="keyword" class="form-control" placeholder="Search"
                                       value="${keyword!''}">
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
                                <th>销售信息</th>
                                <th>库存数量</th>
                                <th>是否上架</th>
                                <th>商品型号</th>
                                <th>操作 <a class="btn btn-success btn-xs" href="/product/addProduct">增加</a></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#assign productVos= pagerVo.data >
                            <#if productVos?? && (productVos?size > 0) >
                                <#list productVos as productVo>
                                    <tr>
                                        <td>${ productVo.id }</td>
                                        <td>${ productVo.productName!"" }</td>
                                        <td><img width="16" height="16" src="${ productVo.mainPictureSrc!"" }"></td>
                                        <td>
                                            <span class="label label-info">原价：${productVo.price!''}</span>
                                            <span class="label label-success">现价：${productVo.salePrice!''}</span>
                                            <span class="label label-primary">成本：${productVo.costPrice!''}</span>
                                        </td>
                                        <td>${ productVo.storeCount!'' } ${productVo.unit!''}</td>
                                        <td>
                                            <#if productVo.isOnLine!false>
                                                <span class="label label-success">上架</span>
                                            <#else >
                                                <span class="label label-danger">下架</span>
                                            </#if>

                                        </td>
                                        <td>${productVo.productCode!''}</td>
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
                                        <li class="active"><a href="javascript:void(0)">${num}</a></li>
                                    <#else >
                                        <li>
                                            <a href="/product?keywork=${keyword!''}&pageIndex=${num}&pageSize=${pagerVo.pageSize}">${num}</a>
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
