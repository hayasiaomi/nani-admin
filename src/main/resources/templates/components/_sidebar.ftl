<#macro sidebar selectItemCode="m001">
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="查找菜单...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <li>
                    <#if selectItemCode=="m001" >
                        <a href="javascript:void(0)"><i class="fa fa-dashboard fa-fw"></i> 商城首页</a>
                    <#else >
                        <a href="/admin"><i class="fa fa-dashboard fa-fw"></i> 商城首页</a>
                    </#if>


                </li>

                <li class="${selectItemCode?startsWith("m002")?string("active","")}">
                    <a href="javascript:void(0)"><i class="fa fa-dashboard fa-fw"></i> 商品目录 <span
                                class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <#if selectItemCode=="m002-01" >
                            <li class="active">
                                <a href="javascript:void(0)"><i class="fa fa-dashboard fa-fw"></i> 商品管理</a>
                            </li>

                        <#else >
                            <li>
                                <a href="/product"><i class="fa fa-dashboard fa-fw"></i> 商品管理</a>
                            </li>
                        </#if>
                        <#if selectItemCode=="m002-02" >
                            <li class="active">
                                <a href="javascript:void(0)"><i class="fa fa-dashboard fa-fw"></i> 商品分类管理</a>
                            </li>

                        <#else >
                            <li>
                                <a href="/category"><i class="fa fa-dashboard fa-fw"></i> 商品分类管理</a>
                            </li>
                        </#if>

                    </ul>

                </li>


                <#if selectItemCode=="m003" >
                    <li class="active">
                        <a href="/sku"><i class="fa fa-sitemap fa-fw">
                            </i>SKU属性管理</span>
                        </a>
                    </li>
                <#else >
                    <li>
                        <a href="/sku"><i class="fa fa-sitemap fa-fw">
                            </i>SKU属性管理</span>
                        </a>
                    </li>
                </#if>


            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
</#macro>
