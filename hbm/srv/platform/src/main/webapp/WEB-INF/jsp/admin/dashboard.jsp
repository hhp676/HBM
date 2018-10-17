<%@ include file="/WEB-INF/jsp/admin/common/lib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-lg-4 col-xs-6">
        <!-- small box -->
        <div class="info-box bg-aqua">
            <span class="info-box-icon"><i class="ion fa fa-info-circle"></i></span>

            <div class="info-box-content">
                <span class="info-box-text">接口数量<small>(个)</small></span>
                <span class="info-box-number">${interfaceEnabledCount}/${interfaceEffectiveCount}</span>

                <div class="progress">
                    <div class="progress-bar" style="width: ${interfaceEnabledCount*100/interfaceEffectiveCount}%"></div>
                </div>
                <span class="progress-description">
                    可用数/接口总数
                  </span>
            </div>
            <!-- /.info-box-content -->
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-4 col-xs-6">
        <!-- small box -->
        <div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-bars"></i></span>

            <div class="info-box-content">
                <span class="info-box-text">调用次数</span>
                <span class="info-box-number">${callCount}<small></small></span>

                <div class="progress">
                    <div class="progress-bar" style="width: 100%"></div>
                </div>
                <span class="progress-description">
                    最近24小时接口调用次数
                  </span>
            </div>
            <!-- /.info-box-content -->
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-4 col-xs-6">
        <!-- small box -->
        <div class="info-box bg-red">
            <span class="info-box-icon"><i class="ion fa fa-clock-o"></i></span>

            <div class="info-box-content">
                <span class="info-box-text">平均耗时</span>
                <span class="info-box-number">${avgProcessTime}<small>(ms)</small></span>

                <div class="progress">
                    <div class="progress-bar" style="width: 100%"></div>
                </div>
                <span class="progress-description">
                    最近24小时接口调用平均耗时
                  </span>
            </div>
            <!-- /.info-box-content -->
        </div>
    </div>
    <!-- ./col -->
</div>

<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">近30日调用统计报表</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-8">
                        <div id="indexStatResultLine" style="height: 360px;"></div>
                    </div>
                    <div class="col-md-4">
                        <div id="indexStatResultPie" style="height: 360px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/js/srv/dashboard.js?jsTimer=${jsTimer}"></script>