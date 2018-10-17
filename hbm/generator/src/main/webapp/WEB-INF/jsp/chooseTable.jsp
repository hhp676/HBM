<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<title>HDP代码生成器</title>
</head>
<body>
    <form action="${ctx}/gen" method="post">
        <div style="text-align: center;">
            <h3>HDP代码生成器</h3>
        </div>
        <table align="center" border="1">
            <tr>
                <td width="50"></td>
                <td width="250">表名</td>
                <td width="250">类名</td>
                <td width="150">别名</td>
                <td width="150">模块</td>
                <td width="150">实体表/关系表</td>
                <td width="200">备注</td>
            </tr>
            <c:forEach items="${tables}" var="item" varStatus="status">
                <tr>
                    <td><input type="checkbox" name="tableName" value="${item.tableName}"></td>
                    <td>${item.tableName}</td>
                    <td>${item.className}</td>
                    <td>
                        <input name="__alias_${item.className}" value="${item.tableAlias}" size="10">
                    </td>
                    <td>
                        <input name="__module_${item.className}" value="${item.module}" size="10">
                    </td>
                    <td>
                        <input type="radio" name="__base_${item.className}" value="1" ${item.bizTable ? "checked" : ""}>&nbsp;实体表&nbsp;&nbsp;
                        <input type="radio" name="__base_${item.className}" value="2" ${item.bizTable ? "" : "checked"}>&nbsp;关系表
                    </td>
                    <td>${item.tableDesc}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="7" align="center" height="40">
                    <input type="checkbox" name="checkAll">所有&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="生  成" size="30" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="重  置" size="30" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
