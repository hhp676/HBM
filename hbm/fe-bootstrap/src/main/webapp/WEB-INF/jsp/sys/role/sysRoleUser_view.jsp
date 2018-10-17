<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<div class="easyui-layout" fit=true id="sysRoleUser_layout">
	<table singleSelect=false fit=true id="sysRoleUser_grid" fitColumns=true
		toolbar="#sysRoleUser_toolbar" pagination="true"
		pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		data-options="url:'${ctx}/sys/sysUserRole/list?roleId=0',border:false">
		<thead>
			<tr>
				<th data-options="field:'userRoleId',width:160,hidden:true">主键</th>
				<th data-options="field:'checked',checkbox:true">选择</th>
				<th data-options="field:'sysUser.userName',width:150,formatter:HgUtil.userInfoDetail('sysRoleUserGrid.reload')">姓名</th>
				<th data-options="field:'sysUser.gender',width:120,
						formatter:HgUtil.fieldFormatterFunc('maleOrFemale')" align="center">性别</th>
				<th data-options="field:'sysUser.mobile',width:200" >手机号码</th>
				<th data-options="field:'sysUser.userPosition.positionName',width:200" >主岗位</th>
			</tr>
		</thead>
	</table>
	<div id="sysRoleUser_toolbar" tag=listen_hotkey>
		<table>
			<tr>
			 <td>
			    <shiro:hasPermission name="<%=Auths.Sys.ROLE_AUTH_ADD%>">
				<a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>添加</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="<%=Auths.Sys.ROLE_AUTH_DELETE%>">
				<a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
				</shiro:hasPermission>
			 </td>
			</tr>
		</table>
	</div>
</div>
<script type="text/javascript">
    var sysRoleUserGrid = new HgUi.Datagrid ("sysRoleUser_grid");
    sysRoleUserGrid.toolbar = $ ("#sysRoleUser_toolbar");
    sysRoleUserGrid.init ();
    
    sysRoleUserGrid.toolbar.find ("[tag=add]").click (function () {
	    var _selectedRow = sysRoleGrid.grid.datagrid ('getSelected');
	    if (_selectedRow == null) {
		    HgUi.error ("请首先选择角色。");
		    return;
	    } else if (_selectedRow.roleId == null){
	    	HgUi.error ("请先保存新建角色。");
		    return;
		}
	    
	    HgUtil.chooseSysUser (function(rows) {
            var userRoles = {};
            for(var i=0;i<rows.length;i++){
            	userRoles["userRoles[" + i + "].userId"]
                	= rows[i]["id"];
            	userRoles["userRoles[" + i + "].roleId"]
                	= _selectedRow['roleId'];
            }
            HgUtil.post("/sys/sysUserRole/add", userRoles, function (data) {
            	if(!data.success){
            		$.messager.alert("提示","保存失败!"+data.data,"warning");
    			}else{
    				HgUi.ok("保存成功!", function() {
    					sysRoleUserGrid.grid.datagrid('reload');
    				});
    			} 	
            })
	    }, 'multiple');
    });

    sysRoleUserGrid.toolbar.find ("[tag=del]").click (function () {
	    var selections = sysRoleUserGrid.grid.datagrid ("getSelections");
	    if (selections.length == 0) {
		    HgUi.error ("请首先选择一条记录。");
		    return;
	    }
	    $.messager.confirm("确认删除", "确认将选中的删除?", function(r){
	        if (r) {
	        	var userRoles = {};
	            for(var index in selections){
	                userRoles["userRoles[" + index + "].userRoleId"]
                        = selections[index]["userRoleId"];
	            }
	            HgUtil.post("/sys/sysUserRole/delete", userRoles, function () {
	                    sysRoleUserGrid.grid.datagrid('reload');
	                }
	           )
	        }
	    })
    });
    
    sysRoleUserGrid.reload = function(type) {
    	sysRoleUserGrid.grid.datagrid('reload');
    }
</script>