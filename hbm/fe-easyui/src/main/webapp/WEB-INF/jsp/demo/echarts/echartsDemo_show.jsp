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
    <div class="easyui-layout" fit=true>
        <div data-options="region:'center',title:'echarts柱状图,折线图',border:false" style="padding: 0px; ">
            <div style="width: 900px;margin: 10px;border: 1px solid;">
              <strong>demo内容：</strong>echart报表(当前后台封装部分只提供最常见的折线,柱状,饼图.其它类型还请自行书写js代码),1.前台代码,请求 2.后台模拟数据格式封装,格式化为json传递回前台<br/>
              <strong>适 用 场 景：</strong>报表展示功能<br/>
              <strong>使 用 说 明：</strong>页面上方报表为柱状图以及折线图混合,页面下方为柱状图报表<br/>
              <strong>注 意 事 项：</strong>详见开发手册及代码
            </div>
            <div id="barLineChar" style="height:450px;"></div>
            <hr>
            <div id="pieChar" style="height:450px;width: 90%;float: right;"></div>
            <div id="forceChar" style="height:450px;width: 5%;float: right;"></div>
        </div>
    </div>
    <script type="text/javascript">
    //图表  
    var barLineChar = echarts.init($('#barLineChar').get(0));
    var pieChar = echarts.init($('#pieChar').get(0));  
    var forceChar = echarts.init($('#forceChar').get(0));  
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
    pieChar.on('click', function (param) {
    	alert(param.name);
     var forceCharOption = {
	    legend: [{
	        data: ['刘备2239', '诸葛亮1892', '曹操979', '关羽948', '张飞408', '赵云393', '孙权390', '吕布384', '周瑜328', '魏延327']
	    }],
	    animationDuration: 1000,
	    animationEasingUpdate: 'quinticInOut',
	    series: [{
	        name: '三国演义',
	        type: 'graph',
	        layout: 'force',
	        force: {
	            repulsion: 300
	        },
	        data: [{
	            "name": "三国演义",
	            // "x": 0,
	            // y: 0,
	            "symbolSize": 150,
	            "draggable": "true",
	            "value": 27

	        }, {
	            "name": "刘备2239",
	            "value": 15,
	            "symbolSize": 80,
	            "category": "刘备2239",
	            "draggable": "true"
	        }, {
	            "name": "使君70",
	            "symbolSize": 3,
	            "category": "刘备2239",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "玄德1770",
	            "symbolSize": 60,
	            "category": "刘备2239",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "皇叔112",
	            "symbolSize": 15,
	            "category": "刘备2239",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "诸葛亮1892",
	            "value": 60,
	            "symbolSize": 60,
	            "category": "诸葛亮1892",
	            "draggable": "true"
	        }, {
	            "name": "孔明1643",
	            "symbolSize": 50,
	            "category": "诸葛亮1892",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "卧龙40",
	            "symbolSize": 3,
	            "category": "诸葛亮1892",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "曹操979",
	            "value": 5,
	            "symbolSize": 40,
	            "category": "曹操979",
	            "draggable": "true"
	        }, {
	            "name": "孟德29",
	            "symbolSize": 3,
	            "category": "曹操979",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "曹公44",
	            "symbolSize": 7,
	            "category": "曹操979",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "关羽948",
	            "value": 40,
	            "symbolSize": 18,
	            "category": "关羽948",
	            "draggable": "true"
	        }, {
	            "name": "云长431",
	            "symbolSize": 20,
	            "category": "关羽948",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "关公508",
	            "symbolSize": 25,
	            "category": "关羽948",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "张飞408",
	            "value": 8,
	            "symbolSize": 25,
	            "category": "张飞408",
	            "draggable": "true"
	        }, {
	            "name": "翼德55",
	            "symbolSize": 5,
	            "category": "张飞408",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "赵云393",
	            "value": 5,
	            "symbolSize": 30,
	            "category": "赵云393",
	            "draggable": "true"
	        }, {
	            "name": "子龙95",
	            "symbolSize": 7,
	            "category": "赵云393",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "孙权390",
	            "value": 30,
	            "symbolSize": 30,
	            "category": "孙权390",
	            "draggable": "true"
	        }, {
	            "name": "仲谋10",
	            "symbolSize": 3,
	            "category": "孙权390",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "吴侯72",
	            "symbolSize": 10,
	            "category": "孙权390",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "吕布384",
	            "value": 20,
	            "symbolSize": 30,
	            "category": "吕布384",
	            "draggable": "true"
	        }, {
	            "name": "奉先15",
	            "symbolSize": 3,
	            "category": "吕布384",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "温侯12",
	            "symbolSize": 3,
	            "category": "吕布384",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "周瑜328",
	            "value": 6,
	            "symbolSize": 18,
	            "category": "周瑜328",
	            "draggable": "true"
	        }, {
	            "name": "公瑾60",
	            "symbolSize": 5,
	            "category": "周瑜328",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "周郎35",
	            "symbolSize": 3,
	            "category": "周瑜328",
	            "draggable": "true",
	            "value": 1
	        }, {
	            "name": "魏延327",
	            "value": 6,
	            "symbolSize": 18,
	            "category": "魏延327",
	            "draggable": "true"
	        }, {
	            "name": "文长12",
	            "symbolSize": 3,
	            "category": "魏延327",
	            "draggable": "true",
	            "value": 1

	        }],
	        links: [{
	            "source": "三国演义",
	            "target": "刘备2239"
	        }, {
	            "source": "刘备2239",
	            "target": "使君70"
	        }, {
	            "source": "刘备2239",
	            "target": "玄德1770"
	        }, {
	            "source": "刘备2239",
	            "target": "皇叔112"
	        }, {
	            "source": "三国演义",
	            "target": "诸葛亮1892"
	        }, {
	            "source": "诸葛亮1892",
	            "target": "孔明1643"
	        }, {
	            "source": "诸葛亮1892",
	            "target": "卧龙40"
	        }, {
	            "source": "三国演义",
	            "target": "曹操979"
	        }, {
	            "source": "曹操979",
	            "target": "孟德29"
	        }, {
	            "source": "曹操979",
	            "target": "曹公44"
	        }, {
	            "source": "三国演义",
	            "target": "关羽948"
	        }, {
	            "source": "关羽948",
	            "target": "云长431"
	        }, {
	            "source": "关羽948",
	            "target": "关公508"
	        }, {
	            "source": "三国演义",
	            "target": "张飞408"
	        }, {
	            "source": "张飞408",
	            "target": "翼德55"
	        }, {
	            "source": "三国演义",
	            "target": "赵云393"
	        }, {
	            "source": "赵云393",
	            "target": "子龙95"
	        }, {
	            "source": "三国演义",
	            "target": "孙权390"
	        }, {
	            "source": "孙权390",
	            "target": "仲谋10"
	        }, {
	            "source": "孙权390",
	            "target": "吴侯72"
	        }, {
	            "source": "三国演义",
	            "target": "吕布384"
	        }, {
	            "source": "吕布384",
	            "target": "奉先15"
	        }, {
	            "source": "吕布384",
	            "target": "温侯12"
	        }, {
	            "source": "三国演义",
	            "target": "周瑜328"
	        }, {
	            "source": "周瑜328",
	            "target": "公瑾60"
	        }, {
	            "source": "周瑜328",
	            "target": "周郎35"
	        }, {
	            "source": "三国演义",
	            "target": "魏延327"
	        }, {
	            "source": "魏延327",
	            "target": "文长12"
	        }, {
	            "source": "三国演义",
	            "target": "法学院"

	        }],
	        categories: [{
	            'name': '刘备2239'
	        }, {
	            'name': '诸葛亮1892'
	        }, {
	            'name': '曹操979'
	        }, {
	            'name': '关羽948'
	        }, {
	            'name': '张飞408'
	        }, {
	            'name': '赵云393'
	        }, {
	            'name': '孙权390'
	        }, {
	            'name': '吕布384'
	        }, {
	            'name': '周瑜328'
	        }, {
	            'name': '魏延327'
	        }, {

	        }],
	        focusNodeAdjacency: true,
	        roam: true,
	        label: {
	            normal: {
	                show: true,
	                position: 'top',
	            }
	        },
	        lineStyle: {
	            normal: {
	                color: 'source',
	                curveness: 0,
	                type: "solid"
	            }
	        }
	    }]
	};
    	forceChar.setOption(forceCharOption);
    });
    loadbarLineChar();
    loadPieChar();
    </script>
</body>
</html>