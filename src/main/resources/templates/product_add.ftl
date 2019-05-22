<#compress>
    <#include "components/_start.ftl">
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
        </style>
    </@head>
    <body>

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
                            <form action="/product/addProduct" method="post" class="form-horizontal" role="form">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a>
                                    </li>
                                    <li><a href="#profile" data-toggle="tab">Profile</a>
                                    </li>
                                    <li><a href="#messages" data-toggle="tab">Messages</a>
                                    </li>
                                    <li><a href="#settings" data-toggle="tab">Settings</a>
                                    </li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane fade in active" id="home">
                                        <div style="margin-top: 10px;">
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
                                                            <select class="form-control">
                                                                <option>第一级分类</option>
                                                                <option>2</option>
                                                                <option>3</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <select class="form-control">
                                                                <option>第二级分类</option>
                                                                <option>2</option>
                                                                <option>3</option>
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
                                                    <div class="input-group " style="margin-top:.5em;">
                                                        <img src="/images/nopic.jpg"
                                                             onerror="this.src='./resource/images/nopic.jpg'; this.title='图片未找到.'"
                                                             class="img-responsive img-thumbnail" width="150"/>
                                                        <em class="close"
                                                            style="position:absolute; top: 0px; right: -14px;"
                                                            title="删除这张图片" onclick="deleteMultiImage(this)">×</em>
                                                    </div>
                                                    <span class="help-block">建议尺寸: 640 * 640 ，或正方型图片 </span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="productName" class="col-sm-2 control-label">商品数量</label>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <input type="text" id="stock" name="stock" class="form-control">
                                                        <span class="input-group-addon">件</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="productName" class="col-sm-2 control-label">警报数量</label>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <input type="text" name="warningStock" id="warningStock"
                                                               class="form-control" value="5"/>
                                                        <span class="input-group-addon">件</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="productName" class="col-sm-2 control-label">商品条码</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="barCode" name="barCode"
                                                           placeholder="请输入商品条码"/>
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
                                                <label for="productName" class="col-sm-2 control-label">商品价格</label>
                                                <div class="col-sm-2">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">现价</span>
                                                        <input type="text" name="salePrice" id="salePrice"
                                                               class="form-control"/>
                                                        <span class="input-group-addon">元</span>
                                                    </div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon">原价</span>
                                                        <input type="text" id="price" name="price"
                                                               class="form-control"/>
                                                        <span class="input-group-addon">元</span>
                                                    </div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon">成本</span>
                                                        <input type="text" id="costPrice" name="costPrice"
                                                               class="form-control"/>
                                                        <span class="input-group-addon">元</span>
                                                    </div>
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
                                    </div>
                                    <div class="tab-pane fade" id="profile">
                                    </div>
                                    <div class="tab-pane fade" id="messages">
                                    </div>
                                    <div class="tab-pane fade" id="settings">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary">增加</button>
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

            }
            
            function subImageManagerCallback(imgName,imgUrl) {
                var html = '<div class="input-group " style="margin-top:.5em;">' +
                    '<img src="'+imgUrl+'"' +
                    'onerror="this.src=\'./resource/images/nopic.jpg\'; this.title=\'图片未找到.\'"' +
                    'class="img-responsive img-thumbnail" width="150"/>' +
                    '<em class="close"' +
                    'style="position:absolute; top: 0px; right: -14px;"' +
                    'title="删除这张图片" onclick="deleteImage(this)">×</em>' +
                    '<input type="hidden" name="mainImageFile" value="'+imgUrl+'" />'+
                    '</div>';

                if(imgName!='' && imgName != null)
                {
                    $("#div-main-images").empty();
                    $("#div-main-images").append(html);
                }
            }
            
            function mainImageManagerCallback(imgName,imgUrl) {
                $("#div-main-images").has()

                var html = '<div class="input-group " style="margin-top:.5em;">' +
                    '<img src="'+imgUrl+'"' +
                    'onerror="this.src=\'./resource/images/nopic.jpg\'; this.title=\'图片未找到.\'"' +
                    'class="img-responsive img-thumbnail" width="150"/>' +
                    '<em class="close"' +
                    'style="position:absolute; top: 0px; right: -14px;"' +
                    'title="删除这张图片" onclick="deleteImage(this)">×</em>' +
                    '<input type="hidden" name="subImageFile" value="'+imgUrl+'" />'+
                    '</div>';

                if(imgName!='' && imgName != null)
                {
                    $("#div-main-images").empty();
                    $("#div-main-images").append(html);

            }
        </script>
    </@footer>
    </body>

    </html>
</#compress>
