<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>权限详细页面</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true" id="sysAuthDetail_layout">
        <div data-options="region:'center'" style="padding: 10 10 10 20px;">
            <form id="sysAuth_form" class="hgform">
                <input type="hidden" name="authId" value="${authObj.authId}"/>
                <%-- <input type="hidden" name="modelId" value="${authObj.modelId}"/> --%>
                <input type="hidden" name="authShowType" value="2"/>
                <input type="hidden" name="isFinal" value="0"/>
                <table class="hgtable">
                    <tr height="10px;">
                        <td colspan="5"></td>
                    </tr>
                    <tr height="30px;">
                        <td width="50px;"></td>
                        <td width="100px;" align="right">模块<font>*</font>：</td>
                        <td width="250px;">
                            <select id="modelId" name="modelId" class="easyui-combotree" 
                                panelHeight='auto' panelMaxHeight="300" style="width:200px;"   
                                data-options="url:'${ctx}/sys/sysAuthMenu/getModelTree'"></select>
	                        <%-- <input type="text" class="" style="width: 200px" 
	                            value="${authObj.sysModel.modelName}" disabled="disabled"></input> --%>
                        </td>
                        <td align="right">权限类型：</td>
                        <td>
                        	<input type="text" name="authCategoryStr" class="" style="width: 200px" disabled="disabled" value=""></input>
                        	<input type="hidden" name="authCategory" value="${authObj.authCategory}"/>
                        </td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                    	<td width="100px;" align="right">权限名称<font>*</font>：</td>
                        <td width="250px;"><input type="text" name="authName" class="" style="width: 200px" value="${authObj.authName}"></input></td>
                        <td align="right">编码<font>*</font>：</td>
                        <td>
                            <input  type="text" name="authCode" class="" style="width: 200px" value="${authObj.authCode}"></input>
                        </td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                    	<td align="right">英文名称：</td>
                        <td><input type="text" name="engName" class="" style="width: 200px" value="${authObj.engName}"></input></td>
                        <td align="right"><nobr>国际化编码：</nobr></td>
                        <td><input type="text" name="i18nCode" class="" value="${authObj.i18nCode}" style="width: 200px"></input></td>
                    </tr>   
                    <tr height="30px;">
                        <td></td>
                        <td align="right">操作类型<font>*</font>：</td>
                        <td>
                             <select id="operationId" class="easyui-combogrid" style="width:202px" name="operationId"  
	                             data-options="
	                                panelWidth: 320,editable:false,fitColumns: true,
	                                idField: 'operationId',textField: 'operationName',
	                                url: '${ctx}/sys/sysOperation/list?rows=999',
	                                columns: [[
	                                    {field:'operationCode',title:'编号',width:80},
	                                    {field:'operationName',title:'名称',width:80},
	                                    {field:'descr',title:'描述',width:100}]]">
                            </select>
                        </td>
                        <td align="right">排序<font>*</font>：</td>
                        <td><input  type="text" name="sortNo" class="" style="width: 200px" value="${authObj.sortNo}"></input></td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                        <td align="right">提示信息：</td>
                        <td><input name="tip" class="" style="width:200px;" value="${authObj.tip}"></td>
                        <td align="right"><!-- 权限图标： --></td>
                        <td>
                            <%-- <a style="background:#ddd" class="easyui-linkbutton" data-options="plain:true,toggle:true,size:'small',iconCls:'${authObj.style}'" tag="choose"></a>
                            <input type="hidden" name="style" style="width: 200px" value="${authObj.style}"></input> --%>
                        </td>
                        <%-- <td>图标：</td>
                        <td><input type="text" name="style" style="width: 250px" value="${authObj.style}"></input></td> --%>
                    </tr>  
                    <tr height="30px;">
                        <td></td>
                        <td align="right">是否可见：</td>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" style="vertical-align:middle " name="isVisible" value="${logicItem.itemValue}" <c:if test="${authObj.isVisible == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                        <td align="right"><nobr>是否可继承：</nobr></td>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" style="vertical-align:middle " name="isInheritable" value="${logicItem.itemValue}" <c:if test="${authObj.isInheritable == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                        <td align="right">URI<font>*</font>：</td>
                        <td colspan="3"><textarea type="text" name="uri" class="hgtextarea" style="height:70px;width:517px;" onfocus="showNote();" onblur="hideNote();">${authObj.uri}</textarea></td>
                    </tr>
                    <tr>
	                    <td></td>
	                    <td></td>
	                    <td colspan="3">
	                        <label for="uri" style="color:red;font-size:1em">
	                        	1、录入时不允许录入GET风格参数。如/sys/sysAuth?type=add&id=1。<br>
	                        	2、可以使用restful风格传参，传参时可以使用通配符(%d:数字类型,%s:字符类型)。如/sys/sysAuth/%s/%d。<br>
	                        	3、多个url用英文分号";"隔开。
	                        </label>
	                    </td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                        <td align="right">描述：</td>
                        <td colspan="3"><textarea name="descr" class="" style="height:70px;width:517px;">${authObj.descr}</textarea></td>
                    </tr>
                    
                    
                </table>
            </form>
        </div>
        <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" tag="ok">提交</a>
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" tag="cancel">关闭</a>
        </div>
    </div>

    <script type="text/javascript">
        var authId = "${authObj.authId}";
        var mode = "add";
        var modelId = '${authObj.modelId}';
        if (authId) mode = "edit";  
        var operationId = "${authObj.operationId}";
        $('label[for=uri]').hide();
        function showNote(){
            if (sysAuth.mode != "view"){                
                $('label[for=uri]').show();
            }
        }
        function hideNote(){
            $('label[for=uri]').hide();
        }
    </script>
    <script type="text/javascript" src="${ctx}/static/js/sys/auth/sysAuth_detail.js?jsTimer=${jsTimer}"></script>
</body>

</html>
