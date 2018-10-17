<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div style="width: 49%;float:left;" >
				<div class="easyui-panel" title="开发文档" style="height: 200px;width:100%" iconCls="icon_auto_colorful__document">
					<div style="margin-top:20px;margin-left: 20px">
						<a href="http://cc.hongguaninfo.com/_hdp/" target="_blank" style="line-height: 30px;color: #428bca;font-size: 16px;margin-bottom: 5px;">
							HDP开发文档
						</a>
					</div>
				</div>
			</div>
			<div style="padding: 0 0 0 5px;float:right;width:50%;">
				<div class="easyui-panel" title=" " style="height: 200px;width:100%">
				</div>
			</div>
			
	       <div style="width: 49%;float:left;margin-top:10px;" >
                <div class="easyui-panel" title="  " style="height: 200px;width:100%">
                </div>
            </div>
            <div style="padding: 0 0 0 5px;float:right;width:50%;margin-top:10px;">
                <div class="easyui-panel" title=" " style="height: 200px;width:100%">
                </div>
            </div>
            
            <script>
                $("#tab").resize();
            </script>
</body>

</html>