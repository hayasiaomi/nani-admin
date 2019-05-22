<div id="div-picture-manager" class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                &times;
            </button>
            <h4 class="modal-title" id="modelTitleBar">
                图片管理 <input type="hidden" id="modalAction">
            </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-sm-5">
                    <a href="/dialog/images?target=${imageLocation}&pageIndex=${pagerVo.nowPage}&pageSize=${pagerVo.pageSize}&keyword=${keyword!''}&pictureTypeId=${pictureTypeId}"
                       data-toggle="tooltip" title="" id="button-picture-refresh" class="btn btn-default"
                       data-original-title="刷新"><i class="fa fa-refresh"></i></a>
                    <button type="button" data-toggle="tooltip" title="" id="button-picture-upload"
                            class="btn btn-primary"
                            data-original-title="上传"><i class="fa fa-upload"></i></button>
                    <button type="button" data-toggle="tooltip" title="" id="button-picture-dir" class="btn btn-default"
                            data-original-title="新目录"><i class="fa fa-folder"></i></button>

                </div>
                <div class="col-sm-7">
                    <div class="input-group">
                        <input type="text" id="input-picture-search" name="keyword" value="${ keyword!'' }" placeholder="检索......"
                               class="form-control">
                        <span class="input-group-btn">
                                <button type="button" data-toggle="tooltip" title="" id="button-picture-search"
                                        class="btn btn-primary"
                                        data-original-title="检索">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                    </div>
                </div>
            </div>
            <hr style="margin-bottom: 5px"/>
            <div class="row" style="margin-bottom: 5px">
                <div class="col-sm-12">
                    <div id="div-picture-clazz" class="btn-group btn-group-sm">
                        <input type="hidden" id="input-picture-type-id" name="pictureTypeId" value="${pictureTypeId}">
                        <#if pictureTypeId == -1>
                            <a href="/dialog/images?target=${imageLocation}&pageIndex=${pagerVo.nowPage}&pageSize=${pagerVo.pageSize}&keyword=${keyword!''}&pictureTypeId=-1"
                               class="btn btn-default active">全部</a>
                        <#else >
                            <a href="/dialog/images?target=${imageLocation}&pageIndex=${pagerVo.nowPage}&pageSize=${pagerVo.pageSize}&keyword=${keyword!''}&pictureTypeId=-1"
                               class="btn btn-default">全部</a>
                        </#if>
                        <#if pictureTypeVos?? && (pictureTypeVos?size > 0)>
                            <#list pictureTypeVos as ptv >
                                <#if ptv.id == pictureTypeId>
                                    <a href="/dialog/images?target=${imageLocation}&pageIndex=${pagerVo.nowPage}&pageSize=${pagerVo.pageSize}&keyword=${keyword!''}&pictureTypeId=${ptv.id}"
                                       class="btn btn-default active">${ ptv.typeName}</a>
                                <#else >
                                    <a href="/dialog/images?target=${imageLocation}&pageIndex=${pagerVo.nowPage}&pageSize=${pagerVo.pageSize}&keyword=${keyword!''}&pictureTypeId=${ptv.id }"
                                       class="btn btn-default">${ ptv.typeName}</a>
                                </#if>
                            </#list>
                        </#if>
                    </div>
                </div>
            </div>
            <#assign  folderVos = pagerVo.data >
            <#if folderVos?? && (folderVos?size > 0) >
                <#list folderVos as folderVo>
                    <#if folderVo?index % 4 ==0 >
                        <#if folderVo?index == 0>
                            <div class="row">

                        <#elseif folderVo?index != (folderVos?size-1)>
                            </div>
                            <div class="row">

                        </#if>



                    </#if>
                    <div class="col-sm-3 col-xs-3 text-center">
                        <a href="/pictures/${folderVo.dirName}" class="thumbnail" style="margin-bottom: 2px">
                            <img src="/pictures/${folderVo.dirName}"
                                 alt="${folderVo.dirName}"
                                 title="${folderVo.dirName}">
                        </a>
                        <input type="hidden" name="${ folderVo.dirName + folderVo.id}"
                               value="${folderVo.dirName}"> ${folderVo.dirName}
                    </div>
                    <#if  folderVo?index == (folderVos?size-1) >
                        </div>
                    </#if>
                </#list>
            <#else >
                <div class="row">
                    <div class="col-sm-12 text-center"> 没有相关的图片数据</div>
                </div>
            </#if>

            <#if pagerVo.totalPage gt 1>

                <div class="row">
                    <div class="col-sm-12">
                        <nav aria-label="Page navigation pull-right">
                            <ul id="ui-picture-pager" class="pagination ni-pagination">
                                <#if pagerVo.hasPrevious>
                                    <li>
                                        <a href="/dialog/images?keywork=${keyword!''}&pictureTypeId=${pictureTypeId}&pageIndex=${pagerVo.prePage}&pageSize=${pagerVo.pageSize}&target=${imageLocation}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                <#else>
                                    <li class="disabled">
                                        <a href="javascript:void(0)" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </#if>

                                <#list 1..pagerVo.totalPage as num>
                                    <#if num == pagerVo.nowPage>
                                        <li class="active"><a href="javascript:void(0)">${num}</a></li>
                                    <#else >
                                        <li>
                                            <a href="/dialog/images?keywork=${keyword!''}&pictureTypeId=${pictureTypeId}&pageIndex=${num}&pageSize=${pagerVo.pageSize}&target=${imageLocation}">${num}</a>
                                        </li>
                                    </#if>

                                </#list>

                                <#if pagerVo.hasNext>
                                    <li>
                                        <a href="/dialog/images?keywork=${keyword!''}&pictureTypeId=${pictureTypeId}&pageIndex=${pagerVo.nextPage}&pageSize=${pagerVo.pageSize}&target=${imageLocation}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                <#else>
                                    <li class="disabled">
                                        <a href="javascript:void(0)" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </#if>

                            </ul>
                        </nav>
                    </div>
                </div>

            </#if>

        </div>
    </div><!-- /.modal-content -->
</div>


<script id="script-picture-manager" type="text/javascript">
    $('#button-picture-upload').on('click', function () {
        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file[]" value="" multiple="multiple" /></form>');

        $('#form-upload input[name=\'file[]\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file[]\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: '/picture/upload?pictureTypeId=' + ${pictureTypeId},
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $('#button-upload i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
                        $('#button-upload').prop('disabled', true);
                    },
                    complete: function () {
                        $('#button-upload i').replaceWith('<i class="fa fa-upload"></i>');
                        $('#button-upload').prop('disabled', false);
                    },
                    success: function (json) {
                        if (json['code'] == '0') {
                            alert(json['msg']);
                        }

                        if (json['code'] == '1') {
                            $('#button-picture-refresh').trigger('click');
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });

    $('#button-picture-dir').popover({
        html: true,
        placement: 'bottom',
        trigger: 'click',
        title: '图片目录',
        content: function () {
            html = '<div class="input-group">';
            html += '  <input type="text" name="pictureTypeName" value="" placeholder="图片目录" class="form-control">';
            html += '  <span class="input-group-btn"><button type="button" title="新目录" id="button-create" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></span>';
            html += '</div>';

            return html;
        }
    });


    $('#button-picture-dir').on('shown.bs.popover', function () {
        $('#button-create').on('click', function () {
            $.ajax({
                url: '/picture/dir/create',
                type: 'post',
                data: {typeName: $('input[name=\'pictureTypeName\']').val()},
                beforeSend: function () {
                    $('#button-create').prop('disabled', true);
                },
                complete: function () {
                    $('#button-create').prop('disabled', false);
                },
                success: function (json) {
                    if (json['code'] == 0) {
                        alert(json['msg']);
                    }

                    if (json['code'] == 1) {
                        alert(json['msg']);

                        $('#button-picture-refresh').trigger('click');
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
    });

    $('a.thumbnail').on('click', function (e) {
        e.preventDefault();

        var callFn = eval(${imageLocation});

        if (callFn != null) {
            callFn($(this).parent().find('input').val(), $(this).find('img').attr('src'))
        }

        $('#div-picture-manager').parent().modal('hide');
    });

    $('#button-picture-refresh').on('click', function (e) {
        e.preventDefault();

        $('#div-picture-manager').parent().load($(this).attr('href'));
    });

    $('#ui-picture-pager li a').on('click', function (e) {
        e.preventDefault();

        $('#div-picture-manager').parent().load($(this).attr('href'));
    });

    $('#div-picture-clazz a').on('click', function (e) {

        e.preventDefault();
        var url = $(this).attr('href');

        if (url.indexOf("javascript:void(0)") < 0) {
            $('#div-picture-manager').parent().load($(this).attr('href'));
        }
    });
    $('#button-picture-search').on('click', function (e) {
        var keyword = $("#input-picture-search").val();
        $('#div-picture-manager').parent().load("/dialog/images?target=${imageLocation}&pageIndex=1&pageSize=${pagerVo.pageSize}&keyword=" + keyword + "&pictureTypeId=${pictureTypeId}");
    })

</script>
