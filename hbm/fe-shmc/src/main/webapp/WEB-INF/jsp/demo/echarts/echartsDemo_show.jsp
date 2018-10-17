<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>echarts相关demo</title>
</head>
<body>
    <div class="easyui-layout" style="height: 1100px;">
        <div data-options="region:'center',title:'echarts柱状图,折线图',border:false" style="padding: 0px; ">
            <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>echart报表(当前后台封装部分只提供最常见的折线,柱状,饼图.其它类型还请自行书写js代码),1.前台代码,请求 2.后台模拟数据格式封装,格式化为json传递回前台<br/>
              <strong>适 用 场 景：</strong>报表展示功能<br/>
              <strong>使 用 说 明：</strong>页面上方报表为柱状图以及折线图混合,页面下方为柱状图报表<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
            </div>
            <div id="barLineChar" style="height:450px;"></div>
            <hr>
            <div id="pieChar" style="height:450px;"></div>
        </div>
    </div>
    <script type="text/javascript">
    //图表  
    var barLineChar = echarts.init($('#barLineChar').get(0));  
    var pieChar = echarts.init($('#pieChar').get(0));  
    //查询  
    function loadbarLineChar() { 
    	//清空echart
        barLineChar.clear();  
        barLineChar.showLoading({text: '读取数据中...'});
        HgUtil.post("/common/demo/echart/getEchartBar", {}, function (data) {  
        	barLineChar.hideLoading();  
            if (data.success) {
            	//设置echart数据
	            barLineChar.setOption(data.data);  
            } else {
            	HgUi.error("操作失败,请稍后再试!", function(){});
            }  
        }); 
    }  
    
    function loadPieChar(){
    	//清空echart
        pieChar.clear();  
        pieChar.showLoading({text: '读取数据中...'});
        HgUtil.post("/common/demo/echart/getEchartPie", {}, function (data) {  
        	pieChar.hideLoading();  
            if (data.success) {
                //设置echart数据
                pieChar.setOption(data.data);  
            } else {
                HgUi.error("操作失败,请稍后再试!", function(){});
            }  
        }); 
    }
    //双击事件绑定
    pieChar.on('dblclick', function (param) {
    	alert(param.name);
    });
    loadbarLineChar();
    loadPieChar();
    </script>
</body>
</html>