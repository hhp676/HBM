var statProcessTimeChart = echarts.init($('#statProcessTimeChart').get(0));
var statProcessTime ={};

statProcessTime.initstatProcessTimeChart = function(reqData) {
    statProcessTimeChart.showLoading({text: '读取数据中...'});
    HgUtil.getJson("/SrvStat/processTimeDataList",reqData,
        function(data){
            var newHeight = 150+ data.data.yAxis[0].data.length*30;
            $('#statProcessTimeChart').css("height",newHeight+"px");
            statProcessTimeChart.clear()
            statProcessTimeChart = echarts.init($('#statProcessTimeChart').get(0));
            statProcessTimeChart.hideLoading();
            statProcessTimeChart.setOption(data.data);
        }
    );
}

$('#statProcessTimeTimeInput').daterangepicker(statCommParameters, function(start, end, label) {
    var filterTime = start.format('YYYY-MM-DD  HH:mm:ss') + ' - ' + end.format('YYYY-MM-DD  HH:mm:ss') ;
    statProcessTime.initstatProcessTimeChart({"bo.filterTime":filterTime});
});

statProcessTime.initstatProcessTimeChart({"bo.filterTime":$('#statProcessTimeTimeInput').val()});