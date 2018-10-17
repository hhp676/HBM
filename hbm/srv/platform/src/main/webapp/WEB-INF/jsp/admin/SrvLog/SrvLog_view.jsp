<%@ include file="/WEB-INF/jsp/admin/common/lib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="srvLogSearchForm">
    <div class="row ">
        <div class="col-xs-3">
            <div class="input-group">
                <span class="input-group-addon"><div style="width:55px;">接口</div></span>
                <select class="form-control" name="ifId" paramVal="">
                    <option value="">全部</option>
                    <c:forEach var="item" items="${interfaceList}">
                        <option value="${item.id}">${item.reqUri}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-xs-3">
            <div class="input-group">
                <span class="input-group-addon"><div style="width:55px;">用户</div></span>
                <input type="text" name="bo.reqUsername" class="form-control" placeholder="请输入用户名 ..."
                       data-toggle="tooltip" title="必须输入完整的用户名">
            </div>
        </div>
        <div class="col-xs-4">
            <div class="input-group">
                <span class="input-group-addon"><div style="width:55px;">调用时间</div></span>
                <input type="text" class="form-control" name="bo.filterTime" readonly value="">
            </div>
        </div>

        <div class="col-xs-1">
            <button class="btn btn-block btn-info searchBtn">搜索</button>
        </div>

        <div class="col-xs-1">
            <button class="btn btn-block btn-nomal clearBtn">清空</button>
        </div>
    </div>
    <div class="row tableTool">
        <div class="col-xs-3">
            <div class="input-group">
                <span class="input-group-addon"><div style="width:55px;">结果</div></span>
                <select class="form-control" name="result" paramVal="">
                    <option value="">全部</option>
                    <option value="1">成功</option>
                    <option value="0">失败</option>
                </select>
            </div>
        </div>
        <div class="col-xs-3">
            <div class="input-group">
                <span class="input-group-addon"><div style="width:55px;">客户端IP</div></span>
                <input type="text" name="bo.ip" class="form-control" placeholder="请输入IP地址 ...">
            </div>
        </div>
        <div class="col-xs-4">
            <div class="input-group">
            <span class="input-group-addon" style="border-right: 1px solid #d2d6de;" data-toggle="tooltip"
                  title="单位：毫秒">
                <div style="width:55px;">响应时间</div></span>
                <div style="padding: 6px 15px">
                    <input type="text" name="bo.processTime" class="slider form-control" data-slider-min="0"
                           data-slider-max="${maxProcessTime}" data-slider-step="5" data-slider-value="[0,${maxProcessTime}]"
                           data-slider-orientation="horizontal" data-slider-selection="before"
                           data-slider-tooltip="show" data-slider-id="blue">
                </div>

            </div>
        </div>

        <div class="col-xs-1">
        </div>

        <div class="col-xs-1">
        </div>
    </div>
</form>

<div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">日志列表</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <table id="SrvLogTable" class="table table-bordered table-striped" width="100%">
                    <thead>
                    <tr>
                        <th>URI</th>
                        <th>接口</th>
                        <th>用户</th>
                        <th>耗时（毫秒）</th>
                        <th>结果</th>
                        <th>客户端IP</th>
                        <th>消费端IP</th>
                        <th>服务端IP</th>
                        <th>时间</th>
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
<script src="${ctx}/static/js/srv/SrvLog/SrvLogView.js?jsTimer=${jsTimer}"></script>