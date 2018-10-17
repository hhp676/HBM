package com.hginfo.hbm.base.service.srv;

import com.hginfo.hbm.base.entity.srv.SrvLog;

import java.util.List;
import java.util.Map;

/**
 * 统计服务。
 */
public interface SrvStatService {

    /**
     * 获取调用次数。
     * @param filter filter
     * @return 次数
     */
    int getCallCount(SrvLog filter);

    /**
     * 获取平均耗时。
     * @param filter filter
     * @return 时间
     */
    int getAvgProcessTime(SrvLog filter);

    /**
     * 获取每日调用次数。
     * @param filter filter
     * @return list
     */
    List<Map> getCallCountGroupByDay(SrvLog filter);

    /**
     * 获取每日平均耗时。
     * @param filter filter
     * @return list
     */
    List<Map> getAvgProcessTimeGroupByDay(SrvLog filter);

    /**
     * 获取每日调用结果。
     * @param filter filter
     * @return list
     */
    List<Map> getResultGroupByDay(SrvLog filter);

    /**
     * 获取每个接口调用次数。
     * @param filter filter
     * @return list
     */
    List<Map> getCallCountGroupByInterface(SrvLog filter);

    /**
     * 获取每个接口平均耗时。
     * @param filter filter
     * @return list
     */
    List<Map> getAvgProcessTimeGroupByInterface(SrvLog filter);

    /**
     * 获取每个接口调用结果。
     * @param filter filter
     * @return list
     */
    List<Map> getResultGroupByInterface(SrvLog filter);
}
