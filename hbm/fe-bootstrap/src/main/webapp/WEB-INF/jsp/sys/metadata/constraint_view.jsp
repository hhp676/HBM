<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>元数据管理</title>
</head>
<body>
<div class="easyui-layout" fit=true>
    <div region="west" title="实体列表" data-options="width:'45%',hideCollapsedContent:false,collapsed:false,split:true">
        <div class="easyui-layout" fit=true>
            <div class="easyui-layout" fit=true>
		        <div region="center"data-options="split:true"
		        	href="${ctx}/sys/sysMetadata/metadataEntityConstraintView">
		        </div>
		        <div region="south" title="字段列表" data-options="height:'240px',split:true,hideCollapsedContent:false,collapsible:true"
					href='${ctx}/sys/sysMetadata/metadataFieldConstraintView'>
		        </div>
       		</div>
        </div>
    </div>
    <div region="center" data-options="split:true"
         href="${ctx}/sys/meta/constraintDefView">
    </div>
</div>
</body>

</html>