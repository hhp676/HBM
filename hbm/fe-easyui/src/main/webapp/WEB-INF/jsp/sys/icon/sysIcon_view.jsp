<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="easyui-layout" fit=true id="icon_layout">
        <div region="center" data-options="split:true,title:'图标管理'" >
            <table singleSelect=true fit=true id="icon_grid" fitColumns=true toolbar="#icon_toolbar" 
                pagination="true"
                pageSize="${defaultPageSize}" 
                pageList="${defaultPageList}"
                data-options="url:'${ctx}/sys/sysIcon/iconList'">
                <thead>
                    <tr>
                        <!-- <th data-options="field:'iconId',width:200" sortable="true">ICON编号</th> -->
                        <th data-options="field:'icon',width:90,align:'center',formatter:imgFormatter">ICON预览</th>
                        <th data-options="field:'iconType',width:120,formatter:dictItemGridIconTypeFormatter" sortable="true" 
                            editor="{type:'combobox',options:{panelHeight:'auto',url:'${ctx}/sys/common/sysDict/itemList/easyuiOrBootstrap',
                            textField:'itemName',valueField:'itemValue',mode:'remote',editable:false,prompt: '---请选择---',
                            required:true,missingMessage:'此输入项为必填项'}}">类型</th>
                        <th data-options="field:'skinCode',width:100" sortable="true" editor="{type:'textbox',options:{required:true,validType:'length[1,128]',missingMessage:'此输入项为必填项'}}">皮肤编码</th>
                        <th data-options="field:'iconCss',width:300" sortable="true" editor="{type:'textbox',options:{required:true,validType:'length[1,128]',missingMessage:'此输入项为必填项'}}">css名称</th>
                        <th data-options="field:'imagePath',width:400" editor="{type:'textbox',options:{required:true,validType:'length[1,256]',missingMessage:'此输入项为必填项'}}">图片路径</th>
                        <th data-options="field:'sortNo',width:100" sortable="true" editor="{type:'numberbox',options:{required:true,validType:'length[1,10]',min:0,missingMessage:'此输入项为必填项'}}">排序</th>
                        <th data-options="field:'isVisible',width:110,formatter:dictItemGridVisibleFormatter"
                            editor="{type:'combobox',options:{panelHeight:'auto',url:'${ctx}/sys/common/sysDict/itemList/trueOrFalse',prompt: '---请选择---',
                            textField:'itemName',valueField:'itemValue',mode:'remote',editable:false}}">是否可见</th>
                        <th data-options="field:'tip',width:120" editor="{type:'textbox',options:{validType:'length[0,255]'}}">提示信息</th>
                        <th data-options="field:'descr',width:120" editor="{type:'textbox',options:{validType:'length[0,255]'}}">描述</th>
                    </tr>
                </thead>
            </table>
            <div id="icon_toolbar" tag=listen_hotkey>
                <table>
                    <tr>
                        <shiro:hasPermission name="<%= Auths.Sys.ICON_ADD %>">
                            <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                iconCls="icon_add1" plain="true" tag="add">新建</a>
                            </td>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%= Auths.Sys.ICON_UPDATE %>">
                            <td style="display: none"><a href="javascript:void(0)"
                                iconCls="icon_add1" plain="true" tag="update">修改</a></td>
                        </shiro:hasPermission>
                        <h:hasAnyPermissions name='<%= Auths.Sys.ICON_ADD + "," + Auths.Sys.ICON_UPDATE %>'>
                            <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                iconCls="icon_save1" plain="true" tag="save">保存</a></td>
                        </h:hasAnyPermissions>
                        <shiro:hasPermission name="<%= Auths.Sys.ICON_DELETE %>">
                            <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                iconCls="icon_delete" plain="true" tag="del">删除</a></td>
                        </shiro:hasPermission>
                        <td><a href="javascript:void(0)" class="easyui-linkbutton"
                            data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <shiro:hasPermission name="<%= Auths.Sys.ICON_RECONFIG %>">
                        <td><a class="easyui-linkbutton" iconCls="icon_refresh_2" plain="true" tag="Reconfiguration">一键配置图标</a></td>
                        </shiro:hasPermission>
                        <td><div class="datagrid-btn-separator"></div></td>
                        <td>
                            <div id="choose_layout">
                                    <span>快速获取图标css：</span>
                                    <a style="background:#ddd" class="easyui-linkbutton"
                                        data-options="plain:true,toggle:true,size:'small'" tag="choose"></a>
                                    <input type="text" style="width: 180px" 
                                        id="chooseIconText" class="easyui-textbox"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${ctx}/static/js/sys/icon/sysIcon_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>