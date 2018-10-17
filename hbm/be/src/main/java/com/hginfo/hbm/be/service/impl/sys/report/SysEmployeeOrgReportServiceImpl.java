package com.hginfo.hbm.be.service.impl.sys.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.base.service.sys.SysOrganizationService;
import com.hginfo.hbm.base.service.sys.report.SysEmployeeOrgReportService;
import com.hginfo.hbm.be.dao.sys.SysOrganizationDao;
import com.hginfo.hbm.be.service.impl.sys.SysOrganizationServiceImpl;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.StringUtil;

/**
 * ClassName: SysEmployeeOrgReportServiceImpl .<br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
@HService
public class SysEmployeeOrgReportServiceImpl implements SysEmployeeOrgReportService {
    /**
     */
    @Autowired
    private SysOrganizationService orgService;

    @Override
    public List<Map<String, Object>> queryOrgUserTotal(String orgCode) {
        SysOrganization org = new SysOrganization();
        //部门ID为空时,取顶级部门ID,默认为1
        if (StringUtil.isBlank(orgCode)) {
            org = orgService.getById(1L);
        } else {
            org.setOrgCode(orgCode);
            org.setIsDelete(0);
            org = orgService.getList(org).get(0);
        }
        //子部门列表
        List<SysOrganization> chilrenList = orgService.getChildren(org.getOrgId());
        
        //获取统计信息列表
        List<Map<String, Object>> orgUserList = orgService.queryOrgUserList();
        
        //需要返回的结果List
        List<Map<String, Object>> returnList = new ArrayList<>(); 
        //直属部门人员统计
        int directlyCount = 0;
        for (Map<String, Object> orgUser : orgUserList) {
            if (org.getOrgId().equals(Long.parseLong(String.valueOf(orgUser.get("ORG_ID_"))))) {
                directlyCount++;
            }
        }
        Map<String, Object> pieMap = new HashMap<>();
        pieMap.put("name", org.getOrgName() + "直属");
        pieMap.put("total", directlyCount);
        returnList.add(pieMap);
        
        //子部门人员统计
        for (SysOrganization chilren : chilrenList) {
            Set<String> userIds = new HashSet<>(); 
            //遍历人员,累加子部门内人员
            for (Map<String, Object> orgUser : orgUserList) {
                if (chilren.getOrgId().equals(Long.parseLong(String.valueOf(orgUser.get("ORG_ID_"))))) {
                    userIds.add(String.valueOf(orgUser.get("USER_ID_")));
                }
            }
            //累加子部门下子部门内人员(使用hashset,保证不重复)
            userIds = treeOrgUserTotal(orgUserList, chilren.getOrgId(), userIds);
            pieMap = new HashMap<>();
            pieMap.put("name", chilren.getOrgName() + "(" + chilren.getOrgCode() + ")");
            pieMap.put("total", userIds.size());
            returnList.add(pieMap);
        }
        return returnList;
    }
    
    /**
     * treeOrgUserTotal:(递归部门人员统计,累加数量). <br/>
     * @author yinyanzhen
     * @param queryList queryList
     * @param orgID orgID
     * @param userIds userIds
     * @return Set<String> Set<String>
     * @since V1.0.0
     */
    private Set<String> treeOrgUserTotal(List<Map<String, Object>> queryList, Long orgID, Set<String> userIds) {
        for (Map<String, Object> map : queryList) {
            if (map.get("FID_") != null && orgID == Long.parseLong(map.get("FID_").toString())) {
                userIds.add(String.valueOf(map.get("USER_ID_")));
                //递归
                userIds = treeOrgUserTotal(queryList, Long.parseLong(map.get("ORG_ID_").toString()), userIds);
            }
        }
        return userIds;
    }
    
}
