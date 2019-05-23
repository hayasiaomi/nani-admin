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
                    编辑SKU属性 <a class="btn btn-success btn-xs" href="/sku">返回</a>
                </div>
                <div class="panel-body table-responsive">
                    <form action="/sku/edit" method="post" class="form-horizontal" role="form">

                        <div class="form-group">
                            <label for="categoryName" class="col-sm-2 control-label">属性名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="categoryName"
                                       name="propertyName"
                                       placeholder="属性名" value="${skuPropertyVo.propertyName!''}"/>
                                <input type="hidden" name="id" value="${skuPropertyVo.id}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="categoryName" class="col-sm-2 control-label">前端属性名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="categoryName"
                                       name="frontPropertyName" value="${skuPropertyVo.frontPropertyName!''}"
                                       placeholder="前端属性名"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="categoryName" class="col-sm-2 control-label">后台属性名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="categoryName"
                                       name="backPropertyName"
                                       placeholder="后台属性名" value="${skuPropertyVo.backPropertyName!''}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">属性描述</label>
                            <div class="col-sm-4">
                                  <textarea id="description" name="description" class="form-control"
                                                              rows="3">${skuPropertyVo.description!''}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="categoryName" class="col-sm-2 control-label">是否为选择</label>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="selectable" id="isOnLine"
                                           value="1" ${skuPropertyVo.selectable?string("checked","")}>是
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="selectable" id="isOnLine"
                                           value="0" ${skuPropertyVo.selectable?string("","checked")}>否
                                </label>
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
