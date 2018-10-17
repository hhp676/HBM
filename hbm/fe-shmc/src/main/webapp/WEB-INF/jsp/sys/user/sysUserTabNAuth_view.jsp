<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<table singleSelect=true fit=true id="sysUserTabNAuth_grid" fitColumns=true
    class="easyui-treegrid" toolbar="#sysUserTabNAuth_toolbar"
    pagination="false" class="easyui-treegrid"
    data-options="idField:'authId',treeField:'authName',
    url:'${ctx}/sys/sysAuthMenu/getUserNAuthList?userId=${filter.userId}',
    onLoadSuccess:sysUserTabNAuthGrid.onLoadSuccess">
    <thead>
        <tr>
            <th data-options="field:'authId',width:160,hidden:true">主键</th>
            <th data-options="field:'authName',width:120">名称</th>
            <th data-options="field:'authShowType',formatter:function(val){if(val == 2) {return '权限';}else if(val == 1){return '模块';}}"
                width="30px" align="center">类型</th>
            <!-- <th data-options="field:'authShowType',formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);}">类型</th> -->
        </tr>
    </thead>
</table>
<div id="sysUserTabNAuth_toolbar" tag=listen_hotkey>
    <table style="width: 100%" class="table_form_result">
        <tr>
            <td align="right" width="55px;">名称：</td>
            <td width="150px;">
                <input id="authName" >
            </td>
            <td width="65px">
            	<a href="javascript:void(0);" class="a_btn_green" onclick="sysUserTabNAuthGrid.searchStr();"><em>定位</em></a>
            </td>
            <td id="sysUserTabNAuthGridShowNext" width="75px;">
            	<a href="javascript:void(0);" class="a_btn_orange" onclick="sysUserTabNAuthGrid.showNext();"><em>下一个</em></a>
            </td>
            <td>
            </td>
         </tr>
    </table>
</div>


<script type="text/javascript"
	src="${ctx}/static/js/sys/user/sysUserTabNAuth_view.js?jsTimer=${jsTimer}"></script>
