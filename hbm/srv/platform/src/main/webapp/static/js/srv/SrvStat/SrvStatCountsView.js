var statCountsChart = echarts.init($('#statCountsChart').get(0));
var statCounts ={};

statCounts.initStatCountsChart = function(reqData) {
    statCountsChart.showLoading({text: '读取数据中...'});
    HgUtil.getJson("/SrvStat/countsDataList",reqData,
        function(data){
            var newHeight = 150+ data.data.yAxis[0].data.length*30;
            $('#statCountsChart').css("height",newHeight+"px");
            statCountsChart.clear()
            statCountsChart = echarts.init($('#statCountsChart').get(0));
            statCountsChart.hideLoading();
            statCountsChart.setOption(data.data);
        }
    );
}

$('#statCountsTimeInput').daterangepicker(statCommParameters, function(start, end, label) {
    var filterTime = start.format('YYYY-MM-DD  HH:mm:ss') + ' - ' + end.format('YYYY-MM-DD  HH:mm:ss') ;
    statCounts.initStatCountsChart({"bo.filterTime":filterTime});
});

statCounts.initStatCountsChart({"bo.filterTime":$('#statCountsTimeInput').val()});