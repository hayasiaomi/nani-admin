<#macro footer>
    <script src="/plugins/jquery/jquery.min.js"></script>
    <script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/plugins/metisMenu/metisMenu.min.js"></script>
    <script src="/plugins/raphael/raphael.min.js"></script>
    <script src="/plugins/sb-admin/sb-admin-2.js"></script>
    <script src="/js/nani.js"></script>
    <#nested >
    <script>
        var nani = new $.nani();
        var heading = "<@spring.message code='common.text.tips' />";
    </script>
</#macro>