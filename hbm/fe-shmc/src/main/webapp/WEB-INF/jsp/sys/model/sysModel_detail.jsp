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
                <input type="hidden" name="isFinal" value="0"/>
                <table class="hgtable  table_form" cellpadding="0" cellspacing="0">
                    <tr >
                        <th width="100px;" ><font>*</font>父模块：</th>
                        <td >
                            <select id="fid" name="fid" class="easyui-combotree" 
                                panelHeight='auto' panelMaxHeight="300" style="width:205px;"   
                                data-options="url:'${ctx}/sys/sysAuthMenu/getModelTree?currModelID=${modelObj.modelId}'"></select>
                            <%-- <input  style="width: 200px" class=""
                                value="${modelObj.parent.modelName}" disabled /> --%>
                        </td>
                        <th width="100px;" ><font>*</font>模块名称：</th>
                        <td >
                            <input name="modelName" style="width: 200px" class=""
                                value="${modelObj.modelName}" />
                        </td>
                    </tr>
                    <tr >
                        <th ><font>*</font>编码：</th>
                        <td>
                            <input  name="modelCode" style="width: 200px" class=""
                                value="${modelObj.modelCode}" />
                        </td>
                        <th >英文名称：</th>
                        <td>
                            <input name="engName" style="width: 200px" class=""
                                value="${modelObj.engName}" />
                        </td>
                    </tr>
                    <tr >
                        <th >国际化编码：</th>
                        <td>
                            <input name="i18nCode" class=""
                                value="${modelObj.i18nCode}" style="width: 200px" />
                        </td>
                        <th >模块图标：</th>
                        <td name="iconname">
                            <c:choose>
	                        	<c:when test="${not empty modelObj.bsStyle}"> 
                           			<a style="background:#ddd;height:12px;width:20px;float:left;text-align:center;padding:4px 0px;" tag="choose"><i style="color:#000" name="iconname" class="${modelObj.bsStyle}"></i></a>
	                        	</c:when>
	                        	<c:otherwise>
                           			<a style="background:#ddd;height:12px;width:20px;float:left;text-align:center;padding:4px 0px;" tag="choose"><i style="color:#000" name="iconname" class="fa fa-upload"></i></a>
	                        	</c:otherwise>
                        	</c:choose>
                            <input type="hidden" name="bsStyle" value="${modelObj.bsStyle}" ></input>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:void(0);" class="a_btn_red" tag="change"><em>清空图标</em></a>
                        </td>
                    </tr>   
                    <tr >
                        <th >是否顶部菜单：</th>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" name="isBsTopMenu" value="${logicItem.itemValue}" <c:if test="${modelObj.isBsTopMenu == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                        <th >是否左侧菜单：</th>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" name="isBsSubMenu" value="${logicItem.itemValue}" <c:if test="${modelObj.isBsSubMenu == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                    </tr>
                    <tr >
                        <th >URI：</th>
                        <td>
                            <input class="" name="uri" value="${modelObj.uri}" style="width: 200px" onfocus="showNote();" onblur="hideNote();"></input></td>
                        <th ><font>*</font>排序：</th>
                        <td><input  class="" name="sortNo" style="width: 200px" value="${modelObj.sortNo}"></input></td>
               
                    </tr>
                    <tr>
	                    <td colspan="4">
	                        <label for="uri" style="color:red;font-size:1em">录入时不允许录入GET风格参数。如/sys/sysAuth?type=add&id=1。<br>可以使用restful风格传参，传参时可以使用统配符(%d:数字类型,%s:字符类型)。如/sys/sysAuth/%s/%d</label>
	                    </td>
                    </tr>
                    <tr >
                        <th >是否可见：</th>
                        <td>
                            <c:forEach var="logicItem" items="${logicMap}">
                                <input type="radio" name="isVisible" value="${logicItem.itemValue}" <c:if test="${modelObj.isVisible == logicItem.itemValue}">checked='checked'</c:if>>${logicItem.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>  
                    <tr >
                        <th >提示信息：</th>
                        <td colspan="3">
                            <input name="tip" style="width:594px;" class="" value="${modelObj.tip}">
                        </td>
                    </tr>
                    <tr >
                        <th >描述：</th>
                        <td colspan="3">
                            <textarea name="descr" multiline="true"  
                                style="height:70px;width:590px;" >${modelObj.descr}</textarea>
                        </td>
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
