package com.hginfo.hbm.base.service.sys.report;

import java.util.List;
import java.util.Map;

/**
 * 系统模块报表查询
 * ClassName: SysEmployeeOrgReportService .<br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
public interface SysEmployeeOrgReportService {
    /**
     * queryOrgUserTotal:(部门聚合查询人员信息,部门为递归向下查询). <br/>
     * @author yinyanzhen
     * @param orgCode orgCode
     * @return List<Map<String, Object>>
     * @since V1.0.0
     */
    List<Map<String, Object>> queryOrgUserTotal(String orgCode);
}
