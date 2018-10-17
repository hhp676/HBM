<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
    <div class="easyui-layout" fit=true id="authManageDialog_view">
        <div data-options="region:'north',border:false" style="padding: 0px;height: 30px;">
            <table style="width: 100%" >
                <tr>
                    <td align="right" width="10%">名称：</td>
                    <td width="30%">
                        <input id="authName" >
                    </td>
                    <td width="65px">
                        <a href="javascript:void(0)" class="easyui-linkbutton"
                               iconCls="icon-search" onclick="authManageDialog_view.searchStr();">定位</a>
                    </td>
                    <td id="treeGridShowNext" >
                        <a href="javascript:void(0)" class="easyui-linkbutton"
                               iconCls="icon_auto_colorful__down" onclick="authManageDialog_view.showNext();">下一个</a>
                    </td>
                </tr>
            </table>
        </div>
        <div data-options="region:'center',border:false" style="padding: 0px;">
            <table id="sysAuthManage_grid_${id}" class="easyui-treegrid" 
                fit=true fitColumns=true singleSelect=true  
                data-options="idField:'authId',treeField:'authName',cascadeCheck:true">
                <thead>
                    <tr>
                        <th data-options="field:'authName',width:180">名称</th>
                        <th data-options="field:'authShowType',formatter:function(val){if(val == 2) {return '权限';}else if(val == 1){return '模块';}}"  width="30px">类型</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
<script type="text/javascript">
    var id="${id}";
    window.dialogAuthManage.init(window.dialogAuthManageData);
    $("#authManageDialog_view #treeGridShowNext").hide();
    var authManageDialog_view = {};
    authManageDialog_view.grid = $ ("#authManageDialog_view #sysAuthManage_grid_"+id);
    /**
     * 查询匹配字段值
     * @author yinyanzhen
     */
     authManageDialog_view.searchStr = function(){
         authManageDialog_view.sysAuthLocation = 
                new sysAuthLocation(authManageDialog_view.grid, 
                     $("#authManageDialog_view #authName").val(), 
                     $("#authManageDialog_view #treeGridShowNext"));
         authManageDialog_view.sysAuthLocation.searchStr();
    }
    /**
     * 定位下一个匹配值
     */
    authManageDialog_view.showNext = function (){
        authManageDialog_view.sysAuthLocation.showNext();
    }
    
</script>
</body>
</html>
