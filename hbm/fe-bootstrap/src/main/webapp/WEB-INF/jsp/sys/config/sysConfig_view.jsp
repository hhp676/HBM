<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>

<div class="easyui-layout" fit=true>
<div data-options="region:'north',title:'系统设置',border:false,collapsible:false" style="padding: 0px;width:100%;height:60%" class="easyui-datagrid-layout">
	<table singleSelect=true fit=true id="sysConfig_grid" fitColumns=true
		toolbar="#sysConfig_toolbar" pagination="true"
		pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		data-options="url:'${ctx}/sys/sysConfig/list'" style="width:100%">
		<thead>
			<tr>
				<th data-options="field:'configId',width:160,hidden:true">主键</th>
				<th data-options="field:'configKey',width:120"
					editor="{type:'textbox',options:{required:true,validType:'length[1,32]',missingMessage:'此输入项为必填项'}}">设置KEY</th>
				<th data-options="field:'configType',width:100"
					editor="{type:'textbox',options:{required:true,validType:'length[1,32]',missingMessage:'此输入项为必填项'}}">设置类型</th>
				<th data-options="field:'configValue',width:80"
					editor="{type:'textbox',options:{required:true,validType:'length[1,256]',missingMessage:'此输入项为必填项'}}">设置值</th>
				<th data-options="field:'defaultValue',width:80"
					editor="{type:'textbox',options:{required:true,validType:'length[1,256]',missingMessage:'此输入项为必填项'}}">默认值</th>
				<th data-options="field:'configDesc',width:220"
					editor="{type:'textbox',options:{validType:'length[0,256]'}}">设置描述</th>
				<th data-options="field:'sortNo',width:80"
					editor="{type:'numberbox',options:{validType:'length[0,10]'}}" sortable="true">排序号</th>
				<th data-options="field:'version',width:80">版本号</th>
				<th
					data-options="field:'isCurrent',width:100,formatter:HgUtil.fieldFormatterFunc('trueOrFalse')">是否当前版本</th>
				<th
					data-options="field:'isFinal',width:100,formatter:HgUtil.fieldFormatterFunc('trueOrFalse')">是否不可修改</th>

			</tr>
		</thead>
	</table>
	
	<div id="sysConfig_toolbar">
    <table>
        <tr>
            <td>
            <shiro:hasPermission name="<%=Auths.Sys.CONFIG_CREATE%>">
                <a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
                <div style="display: none">
                    <a href="javascript:void(0);" tag="update"><i class="fa fa-plus"></i>修改</a>
                </div>
            </shiro:hasPermission>
            <h:hasAnyPermissions name='<%=Auths.Sys.CONFIG_CREATE + "," + Auths.Sys.CONFIG_UPDATE%>'>
                <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
            </h:hasAnyPermissions>
            <shiro:hasPermission name="<%=Auths.Sys.CONFIG_DELETE%>">
                    <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
            </shiro:hasPermission>
            <a href="javascript:void(0);" class="btn btn-azure"
                tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
            <a href="javascript:void(0);" class="btn btn-yellow"
                tag="clear"><i class="fa fa-eraser"></i>清空查询</a>
        </td>
        </tr>
    </table>
    </div>
</div>

<div data-options="region:'center',title:'历史版本',split:true,collapsible:false" style="height:40%;" class="easyui-datagrid-layout">
      <table singleSelect=true fit=true id="sysConfigHis_grid" fitColumns=true pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="">
        <thead>
            <tr>
                <th data-options="field:'configId',width:160,hidden:true">主键</th>
                <th data-options="field:'configKey',width:120"
                    >设置KEY</th>
                <th data-options="field:'configType',width:100"
                    >设置类型</th>
                <th data-options="field:'configValue',width:80"
                    >设置值</th>
                <th data-options="field:'defaultValue',width:80"
                    >默认值</th>
                <th data-options="field:'configDesc',width:220"
                    >设置描述</th>
                <th data-options="field:'sortNo',width:80"
                    >排序号</th>
                <th data-options="field:'version',width:80">版本号</th>
                <th data-options="field:'isCurrent',width:100,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);}">是否当前版本</th>
                <th data-options="field:'isFinal',width:100,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);}" >是否不可修改</th>

            </tr>
        </thead>
    </table>
</div>
</div>
<script type="text/javascript"
	src="${ctx}/static/js/sys/config/sysConfig_view.js?jsTimer=${jsTimer}"></script>

