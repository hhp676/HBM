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
    <table style="width: 100%">
        <tr>
            <td align="right" width="55px;">名称：</td>
            <td width="150px;">
                <input id="authName" class="easyui-textbox">
            </td>
            <td width="70px;">
				<a href="javascript:void(0);" onclick="sysUserTabNAuthGrid.searchStr();" class="btn-palegreen  btn-sm"> 
					<i class="fa fa-search"></i>定位
				</a>
			</td>
			<td id="sysUserTabNAuthGridShowNext" width="75px;">
				<a href="javascript:void(0);"  onclick="sysUserTabNAuthGrid.showNext();" class="btn-yellow  btn-sm"> 
					<i class="fa fa-angle-down"></i>下一个
				</a>
			</td>
            <td>
            </td>
         </tr>
    </table>
</div>


<script type="text/javascript"
	src="${ctx}/static/js/sys/user/sysUserTabNAuth_view.js"></script>
