<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>呐呢商城</title>
    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="/dist/css/sb-admin-2.css">
    <link rel="stylesheet" href="/plugins/morrisjs/morris.css">
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css" type="text/css">
    <sitemesh:write property='headStyle'/>
</head>

<body>
this is a sitemesh
<sitemesh:write property='wrapper'/>

<!-- /#wrapper -->
<script src="/plugins/jquery/jquery.min.js"></script>
<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/metisMenu/metisMenu.min.js"></script>
<script src="/plugins/raphael/raphael.min.js"></script>
<script src="/plugins/morrisjs/morris.min.js"></script>
<script src="/data/morris-data.js"></script>
<script src="/js/sb-admin-2.js"></script>
<script>
    var nani = new $.nani();
    var heading = "<@spring.message code='common.text.tips' />";
</script>
<sitemesh:write property='footerScript'/>
</body>

</html>
