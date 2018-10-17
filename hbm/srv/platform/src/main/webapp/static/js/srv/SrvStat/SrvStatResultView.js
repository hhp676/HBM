var statResultChart = echarts.init($('#statResultChart').get(0));
var statResult ={};

statResult.initstatResultChart = function(reqData) {
    statResultChart.showLoading({text: '读取数据中...'});
    HgUtil.getJson("/SrvStat/resultDataList",reqData,
        function(data){
            var newHeight = 150+ data.data.yAxis[0].data.length*30;
            $('#statResultChart').css("height",newHeight+"px");
            statResultChart.clear()
            statResultChart = echarts.init($('#statResultChart').get(0));
            statResultChart.hideLoading();
            statResultChart.setOption(data.data);
        }
    );
}

$('#statResultTimeInput').daterangepicker(statCommParameters, function(start, end, label) {
    var filterTime = start.format('YYYY-MM-DD  HH:mm:ss') + ' - ' + end.format('YYYY-MM-DD  HH:mm:ss') ;
    statResult.initstatResultChart({"bo.filterTime":filterTime});
});

statResult.initstatResultChart({"bo.filterTime":$('#statResultTimeInput').val()});