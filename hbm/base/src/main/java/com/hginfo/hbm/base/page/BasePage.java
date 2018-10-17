package com.hginfo.hbm.base.page;

import com.hginfo.hbm.base.BaseEntity;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.EncodeUtil;
import java.io.Serializable;

/**
 * 基础分页类。
 * date: 2014-2-19 上午11:26:12 <br/>
 *
 * @author henry
 * @param <E>
 * @since V1.0.0
 */
public class BasePage<E extends BaseEntity> implements Serializable {
    
    
    private static final long serialVersionUID = -360860474471966681L;
    
    /**
     */
    protected static final Log LOG = LogFactory.getLog(BasePage.class);
    
    
    /**
     * 默认每页20条。
     */
    public static final int DEFAULT_PAGE_SIZE = 20;

    static {
        LOG.debug("BaseQuery.DEFAULT_PAGE_SIZE=" + DEFAULT_PAGE_SIZE);
    }

    /**
     * 查询条件。
     */
    private E filters;
    
    /**
     * 开始位置。
     */
    private int posStart = 0;

    /**
     * jquery.datatable 开始位置。
     */
    private int start = 0;
    
    /**
     * 默认第一页。
     */
    private int page = 1;
    
    /**
     * 每页条数。
     */
    private int rows = DEFAULT_PAGE_SIZE;

    /**
     * jquery.datatable 每页条数。
     */
    private int length = DEFAULT_PAGE_SIZE;
    
    /**
     * 
     */
    private int linkResMenuId = 0;

    /**
     * 表头过滤条件。
     */
    private String filterRules;

    /**
     *
     */
    private String sort;

    /**
     *
     */
    private String order;

    /**
     * 视图标识号。
     */
    private int draw;

    /**
     * 创建一个默认对象。
     * 每页条数为{@code DEFAULT_PAGE_SIZE}
     */
    public BasePage() {
        // 创建一个默认对象。
    }
    /**
     * 创建一个每页条数为：{@code rows}的对象。
     *
     * @param rows 每页条数
     */
    public BasePage(int rows) {
      this.rows = rows;
    }

    /**
     * 把filterRules条件转换到filter中。
     * @param filter 过滤实体。
     */
    public void parseFilterRules(E filter) {
        String filterStr = FilterRuleParser.parse(filterRules, filter.getTableMeta());
        LOG.info("parsed filter rules: " + filterStr);
        filter.setFilterStr(filterStr);
    }

    /**
     * 把排序信息转换到过滤实体中。
     * @param filter 过滤实体
     */
    public void parseSortRule(E filter) {
        String orderStr = SortRuleParser.parse(sort, order, filter.getTableMeta());
        LOG.info("parsed sort rule: " + orderStr);
        filter.setOrderStr(orderStr);
    }

    public int getPosStart() {
        return posStart;
    }

    /**
     * 当前开始位置。
     * 
     * @param posStart 开始位置
     */
    public void setPosStart(int posStart) {
        this.posStart = posStart;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
        this.posStart = start;
    }

    public int getLinkResMenuId() {
        return linkResMenuId;
    }

    public void setLinkResMenuId(int linkResMenuId) {
        this.linkResMenuId = linkResMenuId;
    }

    public int getRows() {
        return rows;
    }

    /**
     * 设置每页数量，并同时设置每页的开始位置。
     *
     * @param rows 每页数量
     */
    public void setRows(int rows) {
        this.rows = rows;
        this.setPosStart((this.page - 1) * rows);
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
        this.rows = length;
    }

    public int getPage() {
        return page;
    }

    /**
     * 设置第几页。
     *
     * @param page 页码
     */
    public void setPage(int page) {
        this.page = page;
        this.setPosStart((page - 1) * this.getRows());
    }
    
    public E getFilters() {
        return filters;
    }
    
    /**
     * 设置查询条件。
     *
     * @param filters 查询条件
     */
    public void setFilters(E filters) {
        this.filters = filters;
    }

    public String getFilterRules() {
        return filterRules;
    }

    public void setFilterRules(String filterRules) {
        this.filterRules = EncodeUtil.unescapeHtml4(filterRules);
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }
}
