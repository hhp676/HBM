<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div data-options="region:'center',title:'负授予用户',border:false"
    style="padding: 0px; height: 100%">
    <table singleSelect=false fit=true id="sysUser_grid_neg_view"
        toolbar="#sysUser_grid_neg_view_toolbar" fitColumns=true
        pagination="true" pageSize="${defaultPageSize}"
        pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/sysUser/pageListByAuthId'">
        <thead>
            <tr>
                <th data-options="field:'userId',checkbox:true"></th>
                <th data-options="field:'userName',width:80,formatter:HgUtil.userInfoDetail('sysAuthUserNegTabGrid.reload')">用户名</th>
                <th
                    data-options="field:'gender',width:60,
                        formatter:function(value){return HgUtil.getDictItemName('maleOrFemale',value);}" align="center">性别</th>
                <th data-options="field:'mobile',width:100">手机号码</th>
                <th data-options="field:'email',width:180">邮箱</th>
                <th
                    data-options="field:'userPosition.sysOrganization.orgName',width:100">部门</th>
                <th data-options="field:'userPosition.positionName',width:80">主岗位</th>
            </tr>
        </thead>
    </table>
</div>
<div id="sysUser_grid_neg_view_toolbar">
    <table>
        <tr>
            <td><a href="javascript:void(0)" class="easyui-linkbutton"
                iconCls="icon_add1" plain="true" onclick="_grantSysUserAuthView(-1);">授予</a></td>
            <td><a href="javascript:void(0)" class="easyui-linkbutton"
                iconCls="icon_delete" plain="true" tag="del" onclick="_grantSysUserAuthNegView(-1);">删除</a></td>
            <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    var sysAuthUserNegTabGrid = new HgUi.Datagrid ("sysUser_grid_neg_view");
    sysAuthUserNegTabGrid.options.tipCells
		= ["userName","mobile","email","userPosition.sysOrganization.orgName","userPosition.positionName"];
    sysAuthUserNegTabGrid.init ();
    sysAuthUserNegTabGrid.grid.datagrid ('enableFilter', [
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
                        sysAuthUserNegTabGrid.grid.datagrid ('removeFilterRule', 'gender');
                    }
                    else
                    {
                        sysAuthUserNegTabGrid.grid.datagrid ('addFilterRule',
                        {
                            field : 'gender',
                            op : 'equal',
                            value : value
                        });
                    }
                    sysAuthUserNegTabGrid.grid.datagrid ('doFilter');
                }
            }
        }
    ]);
    // 清空查询----------------------------------------------
    $("#sysUser_grid_neg_view_toolbar [tag=clear]").click(function() {
    	sysAuthUserNegTabGrid.grid.datagrid("removeFilterRule");
    	sysAuthUserNegTabGrid.grid.datagrid("reload");
    });
    sysAuthUserNegTabGrid.reload = function() {
    	sysAuthUserNegTabGrid.grid.datagrid("reload");
    }
</script>