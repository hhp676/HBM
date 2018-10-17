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
        <div data-options="region:'north',border:false" style="padding: 0px;height: 38px;">
            <table class="table_form_result">
            <caption>
                        名称：
                        <input id="authName" >
                        <a href="javascript:void(0)" class="a_btn_blue" onclick="authManageDialog_view.searchStr();"><em>定位</em></a>
                    <div id="treeGridShowNext" style="display:none;display:inline-block">
                        <a href="javascript:void(0)" class="a_btn_orange" onclick="authManageDialog_view.showNext();"><em>下一个</em></a>
                    </div>
                </caption>
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
