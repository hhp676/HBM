<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>权限详细页面</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true" id="sysAuthDetail_layout">
        <div data-options="region:'center'">
            <form id="sysAuth_form" class="hgform">
                <input type="hidden" name="authId" value="${authObj.authId}"/>
                <input type="hidden" name="authShowType" value="2"/>
                <input type="hidden" name="isFinal" value="0"/>
                <table class="hgtable  table_form" cellpadding="0" cellspacing="0">
                    <tr>
                        <th width="100px;"><font>*</font>模块：</th>
                        <td >
                            <select id="modelId" name="modelId" class="easyui-combotree" 
                                panelHeight='auto' panelMaxHeight="300" style="width:205px;"   
                                data-options="url:'${ctx}/sys/sysAuthMenu/getModelTree'"></select>
	                        <%-- <input type="text" class="" style="width: 200px" 
	                            value="${authObj.sysModel.modelName}" disabled="disabled"></input> --%>
                        </td>
                        <th width="100px;">权限类型：</th>
                        <td>
                        	<input type="text" name="authCategoryStr" class="" style="width: 200px" disabled="disabled" value=""></input>
                        	<input type="hidden" name="authCategory" value="${authObj.authCategory}"/>
                        </td>
                    </tr>
                    <tr >
                    	<th  ><font>*</font>权限名称：</th>
                        <td><input type="text" name="authName" class="" style="width: 200px" value="${authObj.authName}"></input></td>
                        <th ><font>*</font>编码：</th>
                        <td>
                            <input  type="text" name="authCode" class="" style="width: 200px" value="${authObj.authCode}"></input>
                        </td>
                    </tr>
                    <tr >
                    	<th >英文名称：</th>
                        <td><input type="text" name="engName" class="" style="width: 200px" value="${authObj.engName}"></input></td>
                        <th >国际化编码：</th>
                        <td><input type="text" name="i18nCode" class="" value="${authObj.i18nCode}" style="width: 200px"></input></td>
                    </tr>   
                    <tr >
                        <th ><font>*</font>操作类型：</th>
                        <td>
                             <select id="operationId" class="easyui-combogrid" style="width:205px" name="operationId"  
	                             data-options="
	                                panelWidth:300,editable:false,fitColumns: true,idField: 'operationId',textField: 'operationName',
	                                url: '${ctx}/sys/sysOperation/list?rows=999',
	                                columns: [[
	                                    {field:'operationCode',title:'编号',width:80},
	                                    {field:'operationName',title:'名称',width:80},
	                                    {field:'descr',title:'描述',width:100}]]">
                            </select>
                        </td>
                        <th ><font>*</font>排序：</th>
                        <td><input  type="text" name="sortNo" class="" style="width: 200px" value="${authObj.sortNo}"></input></td>
                    </tr>
                    <tr >
                        <th >提示信息：</th>
                        <td><input name="tip" class="" style="width:200px;" value="${authObj.tip}"></td>
                        <th ><!-- 权限图标： --></th>
                        <td>
                            <%-- <a style="background:#ddd;height:12px;width:20px;float:left;text-align:center;padding:4px 0px;" tag="choose"><i class="${authObj.bsStyle}"></i></a>
                            <input type="hidden" name="bsStyle" value="${authObj.bsStyle}" ></input> --%>
                        </td>
                    </tr>  
                    <tr >
                        <th >是否可见：</th>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" name="isVisible" value="${logicItem.itemValue}" <c:if test="${authObj.isVisible == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                        <th >是否可继承：</th>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" name="isInheritable" value="${logicItem.itemValue}" <c:if test="${authObj.isInheritable == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                    </tr>
                    <tr >
                        <th ><font>*</font>URI：</th>
                        <td colspan="3"><textarea type="text" name="uri" class="hgtextarea" style="height:70px;width:590px;" onfocus="showNote();" onblur="hideNote();">${authObj.uri}</textarea></td>
                    </tr>
                    <tr>
	                    <th></th>
	                    <td colspan="3">
	                        <label for="uri" style="color:red;font-size:1em">
	                        	1、录入时不允许录入GET风格参数。如/sys/sysAuth?type=add&id=1。<br>
	                        	2、可以使用restful风格传参，传参时可以使用通配符(%d:数字类型,%s:字符类型)。如/sys/sysAuth/%s/%d。<br>
	                        	3、多个url用英文分号";"隔开。
	                        </label>
	                    </td>
                    </tr>
                    <tr >
                        <th >描述：</th>
                        <td colspan="3"><textarea name="descr" class="" style="height:70px;width:590px;">${authObj.descr}</textarea></td>
                    </tr>
                    
                    
                </table>
            </form>
        </div>
        <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
            <div class="block_pop_foot">
	            <a href="javascript:void(0)" class="a_blue" rel="close" tag="ok"><em>提交</em></a>
	            <a href="javascript:void(0)" class="a_gray" rel="close" tag="cancel"><em>取消</em></a>
	        </div>
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
