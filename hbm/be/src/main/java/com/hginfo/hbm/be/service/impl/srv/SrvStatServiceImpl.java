package com.hginfo.hbm.be.service.impl.srv;

import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.service.srv.SrvStatService;
import com.hginfo.hbm.be.dao.srv.SrvLogDao;
import com.hginfo.hdubbo.annotation.HService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * service impl 层 <br />.
 */
@HService
public class SrvStatServiceImpl implements SrvStatService {

    @Autowired
    private SrvLogDao srvLogDao;

    @Override
    public int getCallCount(SrvLog filter) {
        return srvLogDao.getListCount(filter);
    }

    @Override
    public int getAvgProcessTime(SrvLog filter) {
        int result = srvLogDao.selectResult("getAvgProcessTime",filter);
        return result;
    }

    @Override
    public List<Map> getCallCountGroupByDay(SrvLog filter) {
        return srvLogDao.selectResultList("getCallCountGroupByDay",filter);
    }

    @Override
    public List<Map> getAvgProcessTimeGroupByDay(SrvLog filter) {
        return srvLogDao.selectResultList("getAvgProcessTimeGroupByDay",filter);
    }

    @Override
    public List<Map> getResultGroupByDay(SrvLog filter) {
        return srvLogDao.selectResultList("getResultGroupByDay",filter);
    }

    @Override
    public List<Map> getCallCountGroupByInterface(SrvLog filter) {
        return srvLogDao.selectResultList("getCallCountGroupByInterface",filter);
    }

    @Override
    public List<Map> getAvgProcessTimeGroupByInterface(SrvLog filter) {
        return srvLogDao.selectResultList("getAvgProcessTimeGroupByInterface",filter);
    }

    @Override
    public List<Map> getResultGroupByInterface(SrvLog filter) {
        return srvLogDao.selectResultList("getResultGroupByInterface",filter);
    }
}
