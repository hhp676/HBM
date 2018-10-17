<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SysConfig</title>
</head>
<body>
    <div class="easyui-layout" fit=true>
        <div data-options="region:'center',border:false"
            style="padding: 0px; ">
            <table singleSelect=true fit=true id="sysOperation_grid" fitColumns=true
                toolbar="#sysOperation_toolbar" pagination="true"
                pageSize="${defaultPageSize}" pageList="${defaultPageList}"
                data-options="url:'${ctx}/sys/sysOperation/list'">
                <thead>
                    <tr>
                        <th data-options="field:'operationCode',width:150"
                            editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,25]'}}">编码</th>
                        <th data-options="field:'operationName',width:150"
                            editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,25]'}}">名称</th>
                        <th data-options="field:'engName',width:120"
                            editor="{type:'textbox',options:{validType:['onlyEng','length[0,60]']}}">英文名称</th>
                        <th data-options="field:'i18nCode',width:100"
                            editor="{type:'textbox',options:{validType:'length[0,100]'}}">国际化编码</th>
<!--                         <th data-options="field:'iconId',width:80"
                            editor="{type:'textbox',options:{validType:'length[0,20]'}}">类型图标</th> -->
                        <th data-options="field:'style',width:90"
                            editor="{type:'textbox',options:{validType:'length[0,20]'}}">图标</th>
                        <th data-options="field:'uri',width:180"
                            editor="{type:'textbox',options:{validType:'length[0,64]'}}">URI</th>
                        <th data-options="field:'sortNo',width:60"
                            editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:['minnum','length[1,10]']}}">排序</th>
                        <th data-options="field:'isVisible',width:100,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);}" 
                            editor="{type:'combobox',options:{prompt: '---请选择---',panelHeight:'auto',url:'${ctx}/sys/common/sysDict/itemList/trueOrFalse',textField:'itemName',
                            valueField:'itemValue', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">是否可见</th>
                        <th data-options="field:'tip',width:100"
                                editor="{type:'textbox',options:{validType:'length[0,100]'}}">提示信息</th>
                        <th data-options="field:'descr',width:100"
                                editor="{type:'textbox',options:{validType:'length[0,200]'}}">描述</th>
                    </tr>
                </thead>
            </table>
            <div id="sysOperation_toolbar" tag=listen_hotkey>
                <table>
                    <tr>
                    	<td>
							<shiro:hasPermission name="<%= Auths.Sys.OPERATION_ADD %>">
	                        	<a href="javascript:void(0)" class="btn btn-primary"
                                	tag="add"><i class="fa fa-plus"></i>新建</a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="<%= Auths.Sys.OPERATION_UPDATE %>">
			                	<div style="display: none">
			                		<a href="javascript:void(0)"  tag="update"><i class="fa fa-plus"></i>修改</a>
			                	</div>
		            		</shiro:hasPermission>
		            		<h:hasAnyPermissions name='<%= Auths.Sys.OPERATION_ADD + "," + Auths.Sys.OPERATION_UPDATE %>'>
		            			 <a href="javascript:void(0)" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
		            		</h:hasAnyPermissions>
                        	<shiro:hasPermission name="<%= Auths.Sys.OPERATION_DELETE %>">
	                    		<a href="javascript:void(0)" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
                       		</shiro:hasPermission>
                        	<a href="javascript:void(0)" class="btn btn-azure" tag="undo">
                        		<i class="fa fa-mail-reply"></i>撤销
                        	</a>
                        	<a class="btn btn-yellow" tag="clear">
                        		<i class="fa fa-eraser"></i>清空查询
                        	</a>
                       </td>
                      
                       

                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript"
        src="${ctx}/static/js/sys/operation/sysOperation_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>