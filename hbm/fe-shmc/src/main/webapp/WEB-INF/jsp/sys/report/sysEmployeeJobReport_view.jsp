<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>入职离职统计</title>
</head>
<body>
    <div class="easyui-layout" style="height: 550px;">
        <div data-options="region:'north',title:'入职离职统计',border:false" style="height: 70px; ">
            <form id="JobBarReportSearch">
                <table width="100%" style="margin-top: 10px;">
                    <tr>
                        <td width="40%" align="right"> 统计年份： </td>
                        <td width="60%">
				            <input id="year" name="year" type="text" class="Wdate" 
					            onfocus="WdatePicker({readOnly:true,isShowToday:false,dateFmt:'yyyy',maxDate:'%y'})"
					            value="${year}" style="width: 140px; padding:0px 10px" />
                            <a href="javascript:void(0)" class="easyui-linkbutton"
                                iconCls="icon-search" onclick="loadSysEmployeeJobBarReport();">查询</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div data-options="region:'center',border:false" style="padding: 0px; ">
            <div id="sysEmployeeJobBarReport" style="height:450px;"></div>
        </div>
    </div>
    <script type="text/javascript">
    //图表  
    var sysEmployeeJobBarReport = echarts.init($('#sysEmployeeJobBarReport').get(0));  
  
    //查询  
    function loadSysEmployeeJobBarReport() { 
    	var year=$("#JobBarReportSearch #year").val();
    	if(year==''){
    		HgUi.error("请先选择年份!", function(){});
    		return false;
    	}
        //清空echart
        sysEmployeeJobBarReport.clear();  
        sysEmployeeJobBarReport.showLoading({text: '读取数据中...'});
        HgUtil.post("/sys/report/sysEmployeeJobReport/getUserInOutJobBar", 
        		$("#JobBarReportSearch").serialize(), function (data) {  
        	sysEmployeeJobBarReport.hideLoading();  
            if (data.success) {
                //设置echart数据
                sysEmployeeJobBarReport.setOption(data.data);  
            } else {
                HgUi.error("操作失败,请稍后再试!", function(){});
            }  
        });  
    }  
    //载入图表  
    loadSysEmployeeJobBarReport();  
    </script>
</body>
</html>