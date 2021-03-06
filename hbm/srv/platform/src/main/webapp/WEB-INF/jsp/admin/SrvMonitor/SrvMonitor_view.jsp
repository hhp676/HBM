<%@ include file="/WEB-INF/jsp/admin/common/lib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">调用次数统计报表</h3>

                <div class="box-tools">
                    <div class="input-group" style="width:350px;">
                        <span class="input-group-addon">
	                  		选择时间
	                	</span>
                        <input type="text" class="form-control" id="monitorCallCountFilterTime" readonly  >
                    </div>
                </div>

            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div id="monitorCallCountLine" style="height: 360px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">调用结果统计报表</h3>
                <div class="box-tools">
                    <div class="input-group" style="width:350px;">
                        <span class="input-group-addon">
	                  		选择时间
	                	</span>
                        <input type="text" class="form-control" id="monitorResultFilterTime" readonly  >
                    </div>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div id="monitorResultLine" style="height: 360px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">调用平均耗时统计报表</h3>
                <div class="box-tools">
                    <div class="input-group" style="width:350px;">
                        <span class="input-group-addon">
	                  		选择时间
	                	</span>
                        <input type="text" class="form-control" id="monitorAvgProcessTimeFilterTime" readonly  >
                    </div>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div id="monitorAvgProcessTimeLine" style="height: 360px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${ctx}/static/js/srv/SrvMonitor/SrvMonitorView.js?jsTimer=${jsTimer}"></script>