<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>模块详细页面</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true" id="sysModelDetail_layout">
        <div data-options="region:'center'" style="padding: 10 10 10 20px;">
            <form id="sysModel_form" class="hgform">
                <input type="hidden" name="modelId" value="${modelObj.modelId}"/>
                <%-- <input type="hidden" name="fid" value="${modelObj.fid}"/> --%>
                <input type="hidden" name="isFinal" value="0"/>
                <table class="hgtable">
                    <tr height="10px;">
                        <td colspan="5"></td>
                    </tr>
                    <tr height="30px;">
                        <td width="50px;"></td>
                        <td width="100px;" align="right">父模块<font>*</font>：</td>
                        <td width="250px;">
                            <select id="fid" name="fid" class="easyui-combotree" 
                                panelHeight='auto' panelMaxHeight="300" style="width:200px;"   
                                data-options="url:'${ctx}/sys/sysAuthMenu/getModelTree?currModelID=${modelObj.modelId}'"></select>
                            <%-- <input  style="width: 200px" class=""
                                value="${modelObj.parent.modelName}" disabled /> --%>
                        </td>
                        <td width="100px;" align="right">模块名称<font>*</font>：</td>
                        <td width="250px;">
                            <input name="modelName" style="width: 200px" class=""
                                value="${modelObj.modelName}" />
                        </td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                        <td align="right">编码<font>*</font>：</td>
                        <td>
                            <input  name="modelCode" style="width: 200px" class=""
                                value="${modelObj.modelCode}" />
                        </td>
                        <td align="right">英文名称：</td>
                        <td>
                            <input name="engName" style="width: 200px" class=""
                                value="${modelObj.engName}" />
                        </td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                        <td align="right">国际化编码：</td>
                        <td>
                            <input name="i18nCode" class=""
                                value="${modelObj.i18nCode}" style="width: 200px" />
                        </td>
                        <td align="right">模块图标：</td>
                        <td>
                        	<c:choose>
	                        	<c:when test="${not empty modelObj.style}"> 
	                            	<a style="background:#ddd" class="easyui-linkbutton" data-options="plain:true,toggle:true,size:'small',iconCls:'${modelObj.style}'" tag="choose"></a>
	                        	</c:when>
	                        	<c:otherwise>
	                            	<a style="background:#ddd" class="easyui-linkbutton" data-options="plain:true,toggle:true,size:'small',iconCls:'icon_auto_colorful__upload1'" tag="choose"></a>
	                        	</c:otherwise>
                        	</c:choose>
                            <input type="hidden" name="style" value="${modelObj.style}" ></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="easyui-linkbutton" tag="change">清空图标</a>
                        </td>
                    </tr>   
                    <tr height="30px;">
                        <td></td>
                        <td align="right">是否顶部菜单：</td>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio"style="vertical-align:top " name="isTopMenu" value="${logicItem.itemValue}" <c:if test="${modelObj.isTopMenu == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                        <td align="right">是否左侧菜单：</td>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" style="vertical-align:top "name="isSubMenu" value="${logicItem.itemValue}" <c:if test="${modelObj.isSubMenu == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                        <td align="right">URI：</td>
                        <td>
                            <input class="" name="uri" value="${modelObj.uri}" style="width: 200px" onfocus="showNote();" onblur="hideNote();"></input></td>
                        <td align="right">排序<font>*</font>：</td>
                        <td><input  class="" name="sortNo" style="width: 200px" value="${modelObj.sortNo}"></input></td>
               
                    </tr>
                    <tr>
                    <td></td>
                    <td colspan="4">
                        <label for="uri" style="color:red;font-size:1em">录入时不允许录入GET风格参数。如/sys/sysAuth?type=add&id=1。<br>可以使用restful风格传参，传参时可以使用统配符(%d:数字类型,%s:字符类型)。如/sys/sysAuth/%s/%d</label>
                    </td>
                    </tr>
                    <tr height="30px;">
                        <td></td>
                        <td align="right">是否可见：</td>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" style="vertical-align:top " name="isVisible" value="${logicItem.itemValue}" <c:if test="${modelObj.isVisible == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>  
                    <tr height="30px;">
                        <td></td>
                        <td align="right">提示信息：</td>
                        <td colspan="3">
                            <input name="tip" style="width:555px;" class="" value="${modelObj.tip}">
                        </td>
                    </tr>
                    <tr height="30px;">
                        <td width="60px;"></td>
                        <td align="right">描述：</td>
                        <td colspan="3">
                            <textarea name="descr" multiline="true"  
                                style="height:70px;width:546px;" >${modelObj.descr}</textarea>
                        </td>
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
        var modelId = "${modelObj.modelId}";
        var mode = "add";
        var fid = '${modelObj.fid}';
        if (modelId) mode = "edit";
        $('label[for=uri]').hide();
        function showNote(){
            if (sysModel.mode != "view"){               
                $('label[for=uri]').show();
            }
        }
        function hideNote(){
            $('label[for=uri]').hide();
        }
    </script>
    <script type="text/javascript" src="${ctx}/static/js/sys/model/sysModel_detail.js?jsTimer=${jsTimer}"></script>
</body>

</html>
