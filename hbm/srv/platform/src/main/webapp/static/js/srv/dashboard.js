/**
 * Created by licheng on 2017-6-20.
 */

var indexStatResultLineChart = echarts.init($('#indexStatResultLine').get(0));
indexStatResultLineChart.showLoading({text: '读取数据中...'});
HgUtil.getJson("/SrvMonitor/resultCountList",{"bo.recentDays":30},
    function(data){
        indexStatResultLineChart.hideLoading();
        indexStatResultLineChart.setOption(data.data);
    }
);


var indexStatResultPieChart = echarts.init($('#indexStatResultPie').get(0));
indexStatResultPieChart.showLoading({text: '读取数据中...'});
HgUtil.getJson("/SrvMonitor/resultTotalList",{"bo.recentDays":30},
    function(data){
        indexStatResultPieChart.hideLoading();
        indexStatResultPieChart.setOption(data.data);
    }
);


