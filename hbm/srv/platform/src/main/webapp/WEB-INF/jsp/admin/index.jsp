<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/admin/common/meta.jsp"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${h:getSysProperty('sysName')}-接口管理后台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/bootstrap/css/bootstrap.min.css">
    <!-- font-awesome -->
    <link rel="stylesheet" href="${ctx}/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/plugins/iCheck/square/purple.css">
    <!-- daterangepicker -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap slider -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/plugins/bootstrap-slider/slider.css">
    <!--[if lt IE 9]>
    <script src="${ctx}/static/js/html5shiv.min.js"></script>
    <script src="${ctx}/static/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="${ctx}/static/adminlte/css/skins/skin-purple.css">
    <style>
        .navbar-nav-txt{color: #fff;padding:15px 10px;
            display: block;}
        #index-logout-btn{}
        #index-logout-btn:hover{text-decoration: underline;color: #eaeaea;cursor: pointer;}
        .tableTool{margin-bottom: 5px;}
    </style>
</head>
<body class="hold-transition skin-purple sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="###" class="logo">
            <span class="logo-mini"><b>SRV</b></span>
            <span class="logo-lg">接口管理平台</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li>
                        <span class="navbar-nav-txt">欢迎您：${curUser.userName}，
                            <span id="index-logout-btn">注销</span>
                        </span>
                    </li>

                </ul>
            </div>
        </nav>
    </header>

    <!-- =============================================== -->

    <!-- Left side column. contains the sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">导航菜单</li>
                <li class="active"><a href="###" uri="${ctxAdmin}/dashboard"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>
                <li><a href="###" uri="${ctxAdmin}/SrvInterface/view"><i class="fa fa-gear"></i> <span>接口管理</span></a></li>
                <li><a href="###" uri="${ctxAdmin}/SrvMonitor/view"><i class="fa fa-pie-chart"></i> <span>运行监控</span></a></li>
                <li class="treeview">
                    <a href="###">
                        <i class="fa fa-signal"></i> <span>调用统计</span>
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display: none;">
                        <li><a href="###" uri="${ctxAdmin}/SrvStat/countsView"><i class="fa fa-circle-o"></i>调用次数统计</a></li>
                        <li><a href="###" uri="${ctxAdmin}/SrvStat/processTimeView"><i class="fa fa-circle-o"></i>调用耗时统计</a></li>
                        <li><a href="###" uri="${ctxAdmin}/SrvStat/resultView"><i class="fa fa-circle-o"></i>调用结果统计</a></li>
                        <li><a href="###" uri="${ctxAdmin}/SrvLog/view"><i class="fa fa-circle-o"></i>调用记录列表</a></li>
                    </ul>
                </li>
                <%--<li><a href="###" uri="${ctxAdmin}/"><i class="fa fa-gavel"></i> <span>基础配置</span></a></li>--%>

                <li class="header">快捷链接</li>
                <li class=""><a href="${ctx}/swagger-ui/index.html" target="_blank"><i class="fa fa-book"></i> <span>Swagger-UI</span></a></li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- =============================================== -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small></small>
            </h1>
            <%--<ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Examples</a></li>
                <li class="active">Blank page</li>
            </ol>--%>
        </section>

        <!-- Main content -->
        <section class="content">


        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            接口管理平台
        </div>
        <strong>Copyright &copy; 2017-2020 <a href="https://www.hongguaninfo.com">鸿冠信息</a>.</strong> All rights
        reserved.
    </footer>


</div>
<!-- ./wrapper -->


<!-- jQuery 2.2.3 -->
<script src="${ctx}/static/adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${ctx}/static/adminlte/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${ctx}/static/adminlte/plugins/datatables/jquery.dataTables.zh.js"></script>
<script src="${ctx}/static/adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>

<script src="${ctx}/static/adminlte/js/app.min.js"></script>
<script src="${ctx}/static/plugins/jquery-validator/jquery.validate.js"></script>
<script src="${ctx}/static/plugins/jquery-validator/additional-methods.js"></script>
<script src="${ctx}/static/js/security/rsaSecurity.js"></script>
<script src="${ctx}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/static/plugins/jquery-blockUI/jquery.blockUI.js"></script>
<script src="${ctx}/static/plugins/bootbox/bootbox.js"></script>
<script src="${ctx}/static/plugins/echarts/echarts.js"></script>

<script src="${ctx}/static/adminlte/plugins/daterangepicker/moment.min.js"></script>
<script src="${ctx}/static/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${ctx}/static/adminlte/plugins/bootstrap-slider/bootstrap-slider.js"></script>

<script src="${ctx}/static/js/hg/hg.config.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/js/hg/hg.util.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/js/hg/hg.ui.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/js/srv/index.js?jsTimer=${jsTimer}"></script>

</body>
</html>
