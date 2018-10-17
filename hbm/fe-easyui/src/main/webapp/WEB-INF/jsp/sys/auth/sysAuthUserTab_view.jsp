<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div data-options="region:'center',title:'授予用户',border:false"
    style="padding: 0px; height: 100%">
    <table singleSelect=false fit=true id="sysUser_grid_view"
        toolbar="#sysUser_grid_view_toolbar" fitColumns=true pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/sysUser/pageListByAuthId'">
        <thead>
            <tr>
                <th data-options="field:'userId',checkbox:true"></th>
                <th data-options="field:'userName',width:80,formatter:HgUtil.userInfoDetail('sysAuthUserTabGrid.reload')">用户名</th>
                <th
                    data-options="field:'gender',width:60,
                        formatter:function(value){return HgUtil.getDictItemName('maleOrFemale',value);}" align="center">性别</th>
                <th data-options="field:'mobile',width:100">手机号码</th>
                <th data-options="field:'email',width:180">邮箱</th>
                <th
                    data-options="field:'userPosition.sysOrganization.orgName',width:100">主部门</th>
                <th data-options="field:'userPosition.positionName',width:80">主岗位</th>
            </tr>
        </thead>
    </table>
</div>
<div id="sysUser_grid_view_toolbar">
    <table>
        <tr>
            <td><a href="javascript:void(0)" class="easyui-linkbutton"
                iconCls="icon_add1" plain="true" onclick="_grantSysUserAuthView('1');">授予</a></td>
            <td><a href="javascript:void(0)" class="easyui-linkbutton"
                iconCls="icon_delete" plain="true" tag="del" onclick="_grantSysUserAuthNegView(1);">删除</a></td>
            <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    var sysAuthUserTabGrid = new HgUi.Datagrid ("sysUser_grid_view");
    sysAuthUserTabGrid.options.tipCells
		= ["userName","mobile","email","userPosition.sysOrganization.orgName","userPosition.positionName"];
    sysAuthUserTabGrid.init ();
    sysAuthUserTabGrid.grid.datagrid ('enableFilter', [
        {
            field : 'gender',
            type : 'combobox',
            options :
            {
            	data:$.merge([{"text":"---请选择---","value":""}],HgUtil.getDictComboboxData('maleOrFemale')),
                panelHeight : 'auto',
                editable:false,
                onChange : function (value)
                {
                    if (value == '')
                    {
                        sysAuthUserTabGrid.grid.datagrid ('removeFilterRule', 'gender');
                    }
                    else
                    {
                        sysAuthUserTabGrid.grid.datagrid ('addFilterRule',
                        {
                            field : 'gender',
                            op : 'equal',
                            value : value
                        });
                    }
                    sysAuthUserTabGrid.grid.datagrid ('doFilter');
                }
            }
        }
    ]);
    // 清空查询----------------------------------------------
    $("#sysUser_grid_view_toolbar [tag=clear]").click(function() {
    	sysAuthUserTabGrid.grid.datagrid("removeFilterRule");
    	sysAuthUserTabGrid.grid.datagrid("reload");
    });
    sysAuthUserTabGrid.reload = function() {
    	sysAuthUserTabGrid.grid.datagrid("reload");
    }
</script>