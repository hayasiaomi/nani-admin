<#compress>
    <#include "../components/_start.ftl">
    <!DOCTYPE html>
    <html lang="zh">
    <@head>
        <link rel="stylesheet" href="/plugins/nestable/nestable.css" type="text/css">
    </@head>
    <body>
    <div id="wrapper">
        <@topbar mapcode="m002-02"></@topbar>
        <div id="page-wrapper">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">分类管理</h3>
                </div>
                <div class="panel-body table-responsive">


                    <div class="dd" id="div_nestable">


                        <#if productCategoryVos??&&(productCategoryVos?size >0)>

                            <ol class="dd-list">
                                <#list  productCategoryVos as  firstPCV >
                                    <li class="dd-item" data-id="${firstPCV.id}">
                                        <div class="dd-handle" style="width:100%;">
                                            [ID: ${firstPCV.id}] ${firstPCV.categoryName}
                                            <span class="pull-right">
                                        <a class="btn btn-success btn-sm"  href="/category/addCategory?parentId=${firstPCV.id}"
                                           title="" data-original-title="添加子分类"><i class="fa fa-plus"></i></a>
                                        <a class="btn btn-primary btn-sm"
                                           href="/category/editCategory?id=${firstPCV.id}"
                                           title="" data-original-title="修改"><i class="fa fa-edit"></i></a>
                                        <a class="btn btn-danger btn-sm"
                                           href="/category/delete?id=${firstPCV.id}"
                                           title="删除"
                                           onclick="return confirm('确认删除此分类吗？');return false;"><i
                                                    class="fa fa-remove"></i></a>
                                        </span>
                                        </div>
                                        <#if firstPCV.children??&&(firstPCV.children?size >0)>
                                            <ol class="dd-list" style="width: 100%;">
                                                <#list  firstPCV.children as secondPCV >
                                                    <li class="dd-item" data-id="${secondPCV.id}">
                                                        <div class="dd-handle">
                                                            <img src="http://shop.agogoktv.com/attachment/images/3/2019/01/l96jKZKUf9B97i66UUUe9FKzIaBllF.jpg"
                                                                 width="30" height="30" onerror="$(this).remove()"
                                                                 style="padding:1px;border: 1px solid #ccc;float:left;">
                                                            &nbsp;
                                                            [ID: ${secondPCV.id}] ${secondPCV.categoryName} <span
                                                                    class="pull-right">
                                                              <a class="btn btn-primary btn-sm"
                                                                 href="/category/editCategory?id=${secondPCV.id}"
                                                                 title=""
                                                                 data-original-title="修改"><i
                                                                          class="fa fa-edit"></i></a>
                                                            <a class="btn btn-danger btn-sm"
                                                               href="/category/delete?id=${secondPCV.id}"
                                                               title="" onclick="return confirm('确认删除此分类吗？');return false;"
                                                               data-original-title="删除"><i class="fa fa-remove"></i></a>                                                </span>
                                                        </div>
                                                    </li>
                                                </#list>
                                            </ol>
                                        </#if>

                                    </li>
                                </#list>

                            </ol>
                        <#else >
                            没有相关的数据
                        </#if>
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>
                                    <a href="/category/addCategory"
                                       class="btn btn-success"><i class="fa fa-plus"></i> 添加新分类</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- /.table-responsive -->


        </div>
        <@footer>
            <script src="/plugins/nestable/jquery.nestable.js"></script>
            <script type="text/javascript">
                $(function () {
                    var depth = 0;
                    if (depth <= 0) {
                        depth = 2;
                    }
                    $('#div_nestable').nestable({maxDepth: depth,draggable:false});

                    $(".dd-handle a,dd-handle embed,dd-handle div").mousedown(function (e) {
                        e.stopPropagation();
                    });
                    var $expand = false;
                    $('#nestableMenu').on('click', function (e) {
                        if ($expand) {
                            $expand = false;
                            $('.dd').nestable('expandAll');
                        } else {
                            $expand = true;
                            $('.dd').nestable('collapseAll');
                        }
                    });

                    $("#save_category").click(function () {
                        var json = window.JSON.stringify($('#div_nestable').nestable("serialize"));
                        $(':input[name=datas]').val(json);
                        $('form').submit();
                    })
                })

            </script>
        </@footer>
    </body>

    </html>
</#compress>
