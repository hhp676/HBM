<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统信息页面</title>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
</head>
<body>

	<div class="row" style="padding: 10px">
		<div class="col-xs-12 col-md-12">

			<div class="well with-header ">
				<div class="header bg-blue">系统变量</div>
				<table class="table table-hover">
					<thead class="bordered-darkorange">
						<tr>
							<th width="60">#</th>
							<th width="200">键</th>
							<th>值</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${system}" var="item" varStatus="status">
							<tr>
								<td>${status.index +1}</td>
								<td>${item.key}</td>
								<td>${item.value}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>
	</div>
	
</body>

</html>
