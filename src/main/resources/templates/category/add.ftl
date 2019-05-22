<#compress>
    <#include "../components/_start.ftl">
    <!DOCTYPE html>
    <html lang="zh">
    <@head>

    </@head>
    <body>
    <div id="wrapper">
        <@topbar mapcode="m002-02"></@topbar>
        <div id="page-wrapper">
            <div class="panel panel-info">
                <div class="panel-heading">
                    增加商品分类 <a class="btn btn-success btn-xs" href="/category">返回</a>
                </div>
                <div class="panel-body table-responsive">
                    <form action="/category/add" method="post" class="form-horizontal" role="form">

                        <div class="form-group">
                            <label for="productName" class="col-sm-2 control-label">所属父类名</label>
                            <div class="col-sm-4">
                                <span class="label label-success">${parentName}</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="categoryName" class="col-sm-2 control-label">分类名称</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="categoryName"
                                       name="categoryName"
                                       placeholder="请输入分类名">
                                <input type="hidden" name="parentId" value="${parentId}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description" class="col-sm-2 control-label">分类说明</label>
                            <div class="col-sm-4">
                                <textarea id="description" name="description" class="form-control"
                                          rows="3"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">增加</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
            <!-- /.table-responsive -->
        </div>
        <@footer>

        </@footer>
    </body>

    </html>
</#compress>
