package com.hginfo.hbm.base;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Transient;

import com.alibaba.fastjson.JSON;
import com.hginfo.hbm.annotation.IgnoreSqlFilter;
import com.hginfo.hbm.base.meta.TableMeta;
import com.hginfo.hutils.DateTimeUtil;



/**
 * 
 * 基础实体。<br />
 * ClassName: BaseEntity <br/>
 * date: 2014-2-19 上午11:25:57 <br/>
 *
 * 添加统一主键属性id.<br />
 * date: 2016-11-26
 *
 * @author henry
 * @author qiujingde
 * @since V1.0.0
 */
public abstract class BaseEntity implements Serializable {

    private static final long serialVersionUID = -7200095849148417467L;
    
    /**
     * 排序方式。
     */
    private String orderStr;

    /**
     * 开始时间。
     */
    private Date startTime;
    /**
     * 结束时间。
     */
    private Date endTime;
    /**
     * 开始时间。
     */
    private String startTimeStr;
    /**
     * 结束时间。
     */
    private String endTimeStr;

    /**
     * 列头下拉框。
     */
    private String distinctName;
    /**
     * 列头下拉框。
     */
    private String distinctValue;

    /**
     *
     */
    private String filterStr;

    @Transient
    public String getOrderStr() {
        return orderStr;
    }

    public void setOrderStr(String orderStr) {
        this.orderStr = orderStr;
    }

    @Transient
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
    /**
     * 
     * 设置startTime。
     * @param startTimeString startTime的String类型参数
     * @since V1.0.0
     */
    public void setStartTime(String startTimeString) {
        if (startTimeString != null && startTimeString.length() > 0) {
            this.startTime = DateTimeUtil.convertStringToDate(startTimeString, DateTimeUtil.DATETIME_PATTERN);
        }
    }

    @Transient
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
    /**
     * 
     * 设置endTime。
     *
     * @param endTimeString endTime的String类型参数
     * @since V1.0.0
     */
    public void setEndTime(String endTimeString) {
        if (endTimeString != null && endTimeString.length() > 0) {
            this.endTime = DateTimeUtil.convertStringToDate(endTimeString, DateTimeUtil.DATETIME_PATTERN);
        }
    }

    @Transient
    public String getStartTimeStr() {
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    @Transient
    public String getEndTimeStr() {
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    @Transient
    public String getDistinctName() {
        return distinctName;
    }

    public void setDistinctName(String distinctName) {
        this.distinctName = distinctName;
    }
    
    @Transient
    public String getDistinctValue() {
        return distinctValue;
    }

    public void setDistinctValue(String distinctValue) {
        this.distinctValue = distinctValue;
    }

    @Transient
    public String getFilterStr() {
        return filterStr;
    }

    public void setFilterStr(String filterStr) {
        this.filterStr = filterStr;
    }

    @Transient
    public TableMeta getTableMeta() {
        return null;
    }

    /**
     * 不允许重置tableMeta信息。<br />
     * 此方法仅为符合hibernate标准。<br />
     * @param tableMeta meta
     */
    public void setTableMeta(TableMeta tableMeta) {
    }

    /**
     * 统一使用json表示实体的toString（）返回值。
     * @return 实体的json表示
     */
    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }

}
 
