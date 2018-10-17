<%@ include file="/WEB-INF/jsp/admin/common/lib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="srvInterfaceSearchForm">
<div class="row tableTool">
    <div class="col-xs-4">
        <div class="input-group">
            <span class="input-group-addon"><div style="width:55px;">URL</div></span>
            <input type="text" name="bo.reqUri" class="form-control" placeholder="请输入URL地址 ...">
        </div>
    </div>
    <div class="col-xs-3">
        <div class="input-group">
            <span class="input-group-addon"><div style="width:55px;">类名</div></span>
            <input type="text" name="bo.className" class="form-control" placeholder="请输入类名 ...">
        </div>
    </div>
    <div class="col-xs-3">
        <div class="input-group">
            <span class="input-group-addon"><div style="width:55px;">方法名</div></span>
            <input type="text" name="bo.methodName" class="form-control" placeholder="请输入方法名 ...">
        </div>
    </div>

    <div class="col-xs-1">
        <button class="btn btn-block btn-info searchBtn">搜索</button>
    </div>

    <div class="col-xs-1">
        <button class="btn btn-block btn-nomal clearBtn">清空</button>
    </div>
</div>
</form>

<div class="row">
    <div class="col-xs-12">
<div class="box">
    <div class="box-header">
        <h3 class="box-title">接口列表</h3>
        <div class="box-tools">
            <button class="btn btn-sm btn-success" id="srvInterfaceGenerate">重新生成</button>
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="SrvInterfaceTable" class="table table-bordered table-striped" width="100%">
            <thead>
            <tr>
                <th>ID</th>
                <th>URL</th>
                <th>类名</th>
                <th>方法名</th>
                <th>状态</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
</div>
<!-- /.box -->
</div>
</div>
<script src="${ctx}/static/js/srv/SrvInterface/SrvInterfaceView.js?jsTimer=${jsTimer}"></script>