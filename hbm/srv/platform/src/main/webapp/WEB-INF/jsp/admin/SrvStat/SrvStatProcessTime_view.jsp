<%@ include file="/WEB-INF/jsp/admin/common/lib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">统计报表</h3>
                <div class="box-tools">
                    <div class="input-group" style="width:350px;">
                        <span class="input-group-addon">
	                  		选择时间
	                	</span>
                        <input type="text" class="form-control" id="statProcessTimeTimeInput" readonly  >
                    </div>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div id="statProcessTimeChart" style="height: 800px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/js/srv/SrvStat/SrvStatComm.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/js/srv/SrvStat/SrvStatProcessTimeView.js?jsTimer=${jsTimer}"></script>