<#compress>
    <#include "../components/_start.ftl">
    <!DOCTYPE html>
    <html lang="zh">
    <@head>
        <link rel="stylesheet" href="/plugins/fileinput/css/fileinput.css" type="text/css">
        <style type="text/css">
            .kv-avatar .krajee-default.file-preview-frame, .kv-avatar .krajee-default.file-preview-frame:hover {
                margin: 0;
                padding: 0;
                border: none;
                box-shadow: none;
                text-align: center;
            }

            .kv-avatar {
                display: inline-block;
            }

            .kv-avatar .file-input {
                display: table-cell;
                width: 213px;
            }

            .kv-reqd {
                color: red;
                font-family: monospace;
                font-weight: normal;
            }

            #formMenu {
                width: 88px;
                height: auto;
                position: fixed;
                top: 50%;
                right: 15px;
                margin-top: -135px;
                z-index: 99;
            }
        </style>
    </@head>
    <body>
    <div id="formMenu">
        <div class="list-group">
            <a href="#fm-product-info" class="list-group-item">基础信息</a>
            <a href="#fm-product-spec" class="list-group-item">规格参数</a></li>
            <a href="#item3" class="list-group-item">Three</a>
            <a href="#item4" class="list-group-item">Four</a>
            <a href="#item5" class="list-group-item">Fir</a>
        </div>
    </div>
    <div id="wrapper">

        <@topbar mapcode="m002_01"></@topbar>

        <div id="page-wrapper">

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            增加商品 <a class="btn btn-success btn-xs" href="/product">返回</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form action="/product/add" method="post" class="form-horizontal" role="form">
                                <div style="margin-top: 10px;">

                                    <div id="fm-product-info-zone">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <h3 id="fm-product-info">基础信息</h3>
                                                <hr/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">商品名称</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="productName"
                                                       name="productName"
                                                       placeholder="请输入商品名称">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">商品分类</label>
                                            <div class="col-sm-10">
                                                <div class="row row-fix">
                                                    <div class="col-sm-4">
                                                        <select id="select-first-category"
                                                                class="form-control selectpicker"
                                                                onchange="changeFirstCategory(this)">
                                                            <option value="-1">第一级分类</option>
                                                            <#if productCategoryVos??&&(productCategoryVos?size > 0)>
                                                                <#list productCategoryVos as  firstPCV >
                                                                    <option value="${firstPCV.id}"> ${firstPCV.categoryName}</option>
                                                                </#list>
                                                            </#if>
                                                        </select>
                                                        <input id="input-productCategoryId" type="hidden"
                                                               name="productCategoryId"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <select id="select-second-category"
                                                                onchange="changeSecondCategory(this)"
                                                                class="form-control selectpicker">
                                                            <option value="-1">第二级分类</option>

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">商品标题</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="title" name="title"
                                                       placeholder="请输入商品标题">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">商品描述</label>
                                            <div class="col-sm-4">
                                                    <textarea id="description" name="description" class="form-control"
                                                              rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">商品主图</label>
                                            <div class="col-sm-6">
                                                <button class="btn btn-default" type="button"
                                                        onclick="showImageDialog(this);">选择图片
                                                </button>
                                                <div id="div-main-images">
                                                    <div class="input-group " style="margin-top:.5em;">
                                                        <img src="/images/nopic.jpg"
                                                             onerror="this.src='./resource/images/nopic.jpg'; this.title='图片未找到.'"
                                                             class="img-responsive img-thumbnail" width="150"/>
                                                        <em class="close"
                                                            style="position:absolute; top: 0px; right: -14px;"
                                                            title="删除这张图片" onclick="deleteImage(this)">×</em>
                                                    </div>
                                                </div>
                                                <span class="help-block">建议尺寸: 640 * 640 ，或正方型图片 </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">商品副图</label>
                                            <div class="col-sm-6">
                                                <button class="btn btn-default" type="button"
                                                        onclick="uploadMultiImage(this);">选择图片
                                                </button>
                                                <div class="row" id="div-sub-images">
                                                    <div class="col-sm-3 col-xs-3">
                                                        <div class="input-group " style="margin-top:.5em;">
                                                            <img src="/images/nopic.jpg"
                                                                 onerror="this.src='./resource/images/nopic.jpg'; this.title='图片未找到.'"
                                                                 class="img-responsive img-thumbnail" width="150"/>
                                                            <em class="close"
                                                                style="position:absolute; top: 0px; right: -14px;"
                                                                title="删除这张图片"
                                                                onclick="deleteMultiImage(this)">×</em>
                                                        </div>
                                                    </div>
                                                </div>

                                                <span class="help-block">建议尺寸: 640 * 640 ，或正方型图片 </span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">商品单位</label>
                                            <div class="col-sm-2">
                                                <input type="text" name="unit" class="form-control" id="unit"
                                                       placeholder="请输入商品单位">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">是否上架</label>
                                            <div class="col-sm-2">
                                                <label class="radio-inline">
                                                    <input type="radio" name="isOnLine" id="isOnLine" value="1"
                                                           checked>是
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="isOnLine" id="isOnLine" value="0">否
                                                </label>
                                            </div>
                                        </div>

                                    </div>

                                    <div id="fm-product-spec-zone">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <h3 id="fm-product-spec">规格参数</h3>
                                                <hr/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button type="button" id="button-add-spec" class="btn btn-success"
                                                        onclick="addProductSpec()">增加规格
                                                </button>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">原价</label>
                                            <div class="col-sm-2">
                                                <div class="input-group">
                                                    <input type="text" id="price" name="price"
                                                           class="form-control"/>
                                                    <span class="input-group-addon">元</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">现价</label>
                                            <div class="col-sm-2">
                                                <div class="input-group">
                                                    <input type="text" name="salePrice" id="salePrice"
                                                           class="form-control"/>
                                                    <span class="input-group-addon">元</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">成本</label>
                                            <div class="col-sm-2">
                                                <div class="input-group">
                                                    <input type="text" id="costPrice" name="costPrice"
                                                           class="form-control"/>
                                                    <span class="input-group-addon">元</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">商品重量</label>
                                            <div class="col-sm-2">
                                                <input type="text" name="weight" class="form-control" id="unit"
                                                       placeholder="重量">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">商品数量</label>
                                            <div class="col-sm-2">
                                                <div class="input-group">
                                                    <input type="text" id="storeCount" name="storeCount"
                                                           class="form-control">
                                                    <span class="input-group-addon">件</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">商品编码</label>
                                            <div class="col-sm-2">
                                                <input type="text" name="productCode" class="form-control" id="unit"
                                                       placeholder="库存">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">条形码</label>
                                            <div class="col-sm-2">
                                                <input type="text" name="unit" class="form-control" id="barCode"
                                                       placeholder="条形码">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-2 control-label">
                                                <input type="text" name="specNames" class="form-control text-right" placeholder="规格名">
                                            </div>

                                            <div class="col-sm-2 control-label">
                                                <div class="input-group">
                                                    <input type="text" name="specValues" class="form-control" id="unit"
                                                           placeholder="规格值">
                                                    <span class="input-group-btn">

                                                    <button type="button" class="btn btn-danger" onclick="deleteProductSpec(this)">删除</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary">增加商品</button>
                                    </div>
                                </div>
                            </form>
                            <div id="kv-avatar-errors-1" class="center-block" style="width:800px;display:none"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>

    <@footer>
        <script src="/plugins/sb-admin/sb-admin-2.js" type="text/javascript">></script>
        <script src="/plugins/fileinput/js/fileinput.js" type="text/javascript"></script>
        <script src="/plugins/fileinput/locales/zh.js" type="text/javascript"></script>
        <script type="text/javascript">


            function addProductSpec() {
                var html = '<div class="form-group">' +
                    '<div class="col-sm-2 control-label">' +
                    '<input type="text" class="form-control text-right" placeholder="规格名" >' +
                    '</div>' +
                    '<div class="col-sm-2 control-label">' +
                    '<div class="input-group">' +
                    '<input type="text" name="unit" class="form-control" id="unit"  placeholder="规格值">' +
                    '<span class="input-group-btn">' +
                    '<button  type="button"  class="btn btn-danger" onclick="deleteProductSpec(this)">删除</button>' +
                    '</span>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                $("#fm-product-spec-zone").append(html);
            }

            function deleteProductSpec(elm) {
                $(elm).parent().parent().parent().parent().remove();
            }


            function changeFirstCategory(elm) {
                // 选中性别
                var parentId = $(elm).val();

                $("#input-productCategoryId").val(parentId);

                $("#select-second-category").find("option:not(:first)").remove();

                $.ajax({
                    url: "/category/children?parentId=" + parentId,
                    async: false,
                    cache: false,
                    type: 'get',
                    success: function (data) {

                        if (data['code'] == 1) {
                            if (data['result'] != null) {
                                for (var i in data['result']) {

                                    var keyName = data['result'][i]['categoryName'];
                                    var keyValue = data['result'][i]['id'];

                                    $("#select-second-category").append(new Option(keyName, keyValue));
                                }
                            }

                        }

                    }
                })
            }

            function changeSecondCategory(elm) {
                $("#input-productCategoryId").val($(elm).val());
            }

            function showImageDialog(elm, opts, options) {
                var $button = $(elm);

                $('#div-dialog-image').remove();

                $.ajax({
                    url: '/dialog/images?target=mainImageManagerCallback',
                    dataType: 'html',
                    beforeSend: function () {
                        $button.prop('disabled', true);
                    },
                    complete: function () {
                        $button.prop('disabled', false);
                    },
                    success: function (html) {

                        var dialog = $('<div class="modal in" id="div-dialog-image" tabindex="-1" role="dialog" ' +
                            'aria-labelledby="modelTitleBar" aria-hidden="true"></div>').append(html);

                        $('body').append(dialog);

                        $('#div-dialog-image').modal('show');
                    }
                });

            }

            function deleteImage(elm) {
                $(elm).parent().remove();

                var html = '<div class="input-group " style="margin-top:.5em;">' +
                    '<img src="/images/nopic.jpg"' +
                    'onerror="this.src=\'./resource/images/nopic.jpg\'; this.title=\'图片未找到.\'"' +
                    'class="img-responsive img-thumbnail" width="150"/>' +
                    '<em class="close"' +
                    'style="position:absolute; top: 0px; right: -14px;"' +
                    'title="删除这张图片" onclick="deleteImage(this)">×</em>' +
                    '</div>';

                $("#div-main-images").append(html);
            }

            function uploadMultiImage(elm) {
                var $button = $(elm);

                $('#div-dialog-image').remove();

                $.ajax({
                    url: '/dialog/images?target=subImageManagerCallback',
                    dataType: 'html',
                    beforeSend: function () {
                        $button.prop('disabled', true);
                    },
                    complete: function () {
                        $button.prop('disabled', false);
                    },
                    success: function (html) {

                        var dialog = $('<div class="modal in" id="div-dialog-image" tabindex="-1" role="dialog" ' +
                            'aria-labelledby="modelTitleBar" aria-hidden="true"></div>').append(html);

                        $('body').append(dialog);

                        $('#div-dialog-image').modal('show');
                    }
                });
            }

            function deleteMultiImage(elm) {

                $(elm).parent().parent().remove();

                var childernLen = $("#div-sub-images").children().length;

                if (childernLen == 0) {
                    var html = '<div class="col-sm-3 col-xs-3"><div class="input-group " style="margin-top:.5em;">' +
                        '<img src="/images/nopic.jpg"' +
                        'onerror="this.src=\'/images/nopic.jpg\'; this.title=\'图片未找到.\'"' +
                        'class="img-responsive img-thumbnail" width="150"/>' +
                        '<em class="close"' +
                        'style="position:absolute; top: 0px; right: -14px;"' +
                        'title="删除这张图片" onclick="deleteImage(this)">×</em>' +
                        '</div> </div>';

                    $("#div-sub-images").append(html);
                }
            }

            function mainImageManagerCallback(imgName, imgUrl) {
                var html = '<div class="input-group " style="margin-top:.5em;">' +
                    '<img src="' + imgUrl + '"' +
                    'onerror="this.src=\'/images/nopic.jpg\'; this.title=\'图片未找到.\'"' +
                    'class="img-responsive img-thumbnail" width="150"/>' +
                    '<em class="close"' +
                    'style="position:absolute; top: 0px; right: -14px;"' +
                    'title="删除这张图片" onclick="deleteMultiImage(this)">×</em>' +
                    '<input type="hidden" name="mainPictureSrc" value="' + imgUrl + '" />' +
                    '</div>';

                if (imgName != '' && imgName != null) {
                    $("#div-main-images").empty();
                    $("#div-main-images").append(html);
                }
            }

            function subImageManagerCallback(imgName, imgUrl) {

                var img = $("#div-sub-images").find("img[src='" + imgUrl + "']");

                if (img == null || img.length <= 0) {

                    var childernLen = $("#div-sub-images").children().length;

                    if (childernLen == 1) {
                        var noimg = $("#div-sub-images").find("img[src='/images/nopic.jpg']");

                        if (noimg != null && noimg.length > 0) {
                            $("#div-sub-images").empty();
                        }
                    }

                    var html = '<div class="col-sm-3 col-xs-3"><div class="input-group " style="margin-top:.5em;">' +
                        '<img src="' + imgUrl + '"' +
                        'onerror="this.src=\'/images/nopic.jpg\'; this.title=\'图片未找到.\'"' +
                        'class="img-responsive img-thumbnail" width="150"/>' +
                        '<em class="close"' +
                        'style="position:absolute; top: 0px; right: -14px;"' +
                        'title="删除这张图片" onclick="deleteMultiImage(this)">×</em>' +
                        '<input type="hidden" name="subPictureSrcs" value="' + imgUrl + '" />' +
                        '</div> </div>';

                    $("#div-sub-images").append(html);

                }


            }
        </script>
    </@footer>
    </body>

    </html>
</#compress>
