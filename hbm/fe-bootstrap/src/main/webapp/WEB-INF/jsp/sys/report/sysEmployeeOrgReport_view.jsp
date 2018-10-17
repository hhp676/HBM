<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工分布统计</title>
</head>
<body>
    <div class="easyui-layout" fit=true>
        <div data-options="region:'center',border:false" style="padding: 0px; ">
            <div style="width: 49%;">
                <div
                    style="width: 100%; height: 40px; text-align: center; margin-top: 30px;">
                    <label>部门选择：</label> 
                    <select id="sysEmployeeOrgReport_org"
                        class="easyui-combotree" panelHeight='auto'
                        panelMaxHeight="600" style="width: 180px;"
                        data-options="
                         url:'${ctx}/sys/org/getOrgTree',
                         onSelect:sysEmployeeOrgReport.orgOnSelect,
                         onLoadSuccess:sysEmployeeOrgReport.orgOnLoadSuccess">
                    </select>
                </div>
                <div id="sysEmployeeOrgReport"
                    style="height: 450px; width: 100%; margin-top: 50px; float: left;"></div>
            </div>
            <div
                style="height: 550px; margin-top: 50px; width: 49%; float: right;">
                <fieldset style="height: 100%">
                    <legend>部门信息</legend>
                    <form id="orgInfo" class="hgform">
                        <table width="100%" class="hgtable">
                            <tr>
                                <td width="15%" align="right">当前部门：</td>
                                <td width="34%"><input id="orgName" disabled>
                                </td>
                                <td width="15%" align="right">部门编码：</td>
                                <td width="34%"><input id="orgCode" disabled></td>
                            </tr>
                            <tr>
                                <td align="right">部门全名：</td>
                                <td colspan="3">
                                   <input id="orgFullname" disabled style="width: 75%">
                                </td>
                            </tr>
                            <tr>
                                <td align="right">英文名称：</td>
                                <td><input id="engName" disabled></td>
                                <td align="right">国际化编码：</td>
                                <td><input id="i18nCode" disabled></td>
                            </tr>
                            <tr>
                                <td align="right">描述：</td>
                                <td colspan="3">
                                   <textarea disabled id="descr" cols="70" rows="6" style="width: 75%"></textarea>
                                </td>
                            </tr>
                        </table>
                    </form>
                </fieldset>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    var sysEmployeeOrgReport = {};
    
    //图表  
    sysEmployeeOrgReport.pieReport = echarts.init($('#sysEmployeeOrgReport').get(0));  
  
    //查询  
    sysEmployeeOrgReport.loadPieReport = function(code) { 
        //清空echart
        sysEmployeeOrgReport.pieReport.clear();  
        sysEmployeeOrgReport.pieReport.showLoading({text: '读取数据中...'});
        HgUtil.post("/sys/report/sysEmployeeOrgReport/getOrgUserPieData", {orgCode:code}, function (data) {  
          sysEmployeeOrgReport.pieReport.hideLoading();  
            if (data.success) {
            	//处理文字过长被遮挡
                var option = data.data;
                option.tooltip.confine = true;
                option.legend.formatter = function (name) {
                	return echarts.format.truncateText(name, 250);
			    };
                option.legend.tooltip = {
                		show: true
                };
                option.series[0].itemStyle = {
                		normal: {
                			label: {
                				formatter: function(param){
                					return echarts.format.truncateText(param.name, 110);
                				}
                	        }
                		}
                };
                //设置echart数据
                sysEmployeeOrgReport.pieReport.setOption(option);
            } else {
                HgUi.error("操作失败,请稍后再试!", function(){});
            }  
        });  
    } 
    //绑定双击事件
    sysEmployeeOrgReport.pieReport.on('dblclick', function (param) {
     var name=param.name;
     if(name.substr(name.length-2,name.length)=='直属'){
          HgUi.error('部门直属不存在需要展示的下级!',function(){});
     }else{
          var strs = name.split("(");
          var code = strs[strs.length-1];
          code = code.substr(0,code.length-1);
          sysEmployeeOrgReport.freshAllInfo(code);
     }
    });
    sysEmployeeOrgReport.orgOnSelect = function(node){
     sysEmployeeOrgReport.freshAllInfo(node.code);
    }
    sysEmployeeOrgReport.orgOnLoadSuccess = function(){
     $("#sysEmployeeOrgReport_org").combotree('setValue','1');
     sysEmployeeOrgReport.freshAllInfo('hg');
    }
    //刷新页面信息
    sysEmployeeOrgReport.freshAllInfo = function(orgCode) {
    	if(orgCode==null || orgCode==''){
            HgUi.error("操作失败,无法获取到部门编号信息!");
            return;
     }
     sysEmployeeOrgReport.loadPieReport(orgCode);
        HgUtil.post("/sys/org/getSysOrganization", {orgCode:orgCode}, function(data){
             if(data != null){
                  $("#orgInfo #orgName").val(data.orgName);
                  $("#orgInfo #orgFullname").val(data.orgFullname);
                  $("#orgInfo #orgCode").val(data.orgCode);
                  $("#orgInfo #engName").val(data.engName);
                  $("#orgInfo #i18nCode").val(data.i18nCode);
                  $("#orgInfo #descr").html(data.descr);
             }
        });
    }
    </script>
</body>
</html>