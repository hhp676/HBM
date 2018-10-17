var monitorCallCountLineChart = echarts.init($('#monitorCallCountLine').get(0));
var monitorResultLineChart = echarts.init($('#monitorResultLine').get(0));
var monitorAvgProcessTimeLineChart = echarts.init($('#monitorAvgProcessTimeLine').get(0));

var commParameters = {
    autoApply: false,
    singleDatePicker: false,
    showDropdowns: false,        // 是否显示年月选择条件
    timePicker: false, 			// 是否显示小时和分钟选择条件
    timePickerIncrement: 10, 	// 时间的增量，单位为分钟
    timePicker24Hour: true,
    opens: 'left', //日期选择框的弹出位置
    startDate:moment().subtract(29, 'days'),
    endDate: moment().endOf('day'),
    maxDate:moment(),
    ranges: {
        '最近7日': [moment().subtract(6, 'days'), moment()],
        '最近30日': [moment().subtract(29, 'days'), moment()],
        '本月': [moment().startOf('month'), moment().endOf('month')],
        '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
    },
    locale: {
        format: 'YYYY-MM-DD HH:mm:ss',
        separator: ' - ',
        customRangeLabel: '自定义',
        applyLabel: '确定',
        cancelLabel: '取消',
        fromLabel: '起始时间',
        toLabel: '结束时间',
        daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
        firstDay: 1
    },
};

$('#monitorCallCountFilterTime').daterangepicker(commParameters, function(start, end, label) {
    var filterTime = start.format('YYYY-MM-DD  HH:mm:ss') + ' - ' + end.format('YYYY-MM-DD  HH:mm:ss') ;
    initMonitorCallCountLineChart({"bo.filterTime":filterTime});
});

$('#monitorResultFilterTime').daterangepicker(commParameters, function(start, end, label) {
    var filterTime = start.format('YYYY-MM-DD  HH:mm:ss') + ' - ' + end.format('YYYY-MM-DD  HH:mm:ss') ;
    initMonitorResultLineChart({"bo.filterTime":filterTime});
});

$('#monitorAvgProcessTimeFilterTime').daterangepicker(commParameters, function(start, end, label) {
    var filterTime = start.format('YYYY-MM-DD  HH:mm:ss') + ' - ' + end.format('YYYY-MM-DD  HH:mm:ss') ;
    initMonitorAvgProcessTimeLineChart({"bo.filterTime":filterTime});
});

function initMonitorCallCountLineChart(reqData) {
    monitorCallCountLineChart.showLoading({text: '读取数据中...'});
    HgUtil.getJson("/SrvMonitor/callCountList",reqData,
        function(data){
            monitorCallCountLineChart.clear()
            monitorCallCountLineChart.hideLoading();
            monitorCallCountLineChart.setOption(data.data);
        }
    );
}

function initMonitorResultLineChart(reqData) {
    monitorResultLineChart.showLoading({text: '读取数据中...'});
    HgUtil.getJson("/SrvMonitor/resultCountList",reqData,
        function(data){
            monitorResultLineChart.clear()
            monitorResultLineChart.hideLoading();
            monitorResultLineChart.setOption(data.data);
        }
    );
}

function initMonitorAvgProcessTimeLineChart(reqData) {
    monitorAvgProcessTimeLineChart.showLoading({text: '读取数据中...'});
    HgUtil.getJson("/SrvMonitor/processTimeList",reqData,
        function(data){
            monitorAvgProcessTimeLineChart.clear()
            monitorAvgProcessTimeLineChart.hideLoading();
            monitorAvgProcessTimeLineChart.setOption(data.data);
        }
    );
}

initMonitorCallCountLineChart({"bo.filterTime":$('#monitorCallCountFilterTime').val()});
initMonitorResultLineChart({"bo.filterTime":$('#monitorResultFilterTime').val()});
initMonitorAvgProcessTimeLineChart({"bo.filterTime":$('#monitorAvgProcessTimeFilterTime').val()});

