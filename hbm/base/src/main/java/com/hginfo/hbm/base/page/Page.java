package com.hginfo.hbm.base.page;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


/**
 * 分页实体。<br />
 * date: 2014-2-19 上午10:59:32 <br/>
 *
 * modified by qiujingde, at 2016-12-2 上午 11:12:40. <br />
 * 修改内容：删除组件相关属性。
 *
 * @author henry
 * @author qiujingde
 * @param <T>
 */
public class Page<T extends Serializable> implements Serializable {
    private static final long serialVersionUID = 7684759734644880355L;

    /**
     * 当前页数据。
     */
    private List<T> result;
    
    /**
     * 每页条数。
     */
    private int pageSize;
    
    /**
     * 页码。
     */
    private int pageNumber;
    
    /**
     * 合计条数。
     */
    private int totalCount = 0;

    /**
     * 视图标识号。
     */
    private int draw;

    /**
     * Creates a new instance of Page.
     */
    public Page() {
        // 创建一个默认对象。
    }
    /**
     * @param p 分页封装request
     * @param totalCount 合计条数
     */
    public Page(BasePage p, int totalCount) {
        this(p.getPage(), p.getRows(), totalCount);
    }

    /**
     * @param pageNumber  页码
     * @param pageSize    每页条数
     * @param totalCount  总条数
     */
    public Page(int pageNumber, int pageSize, int totalCount) {
        this(pageNumber, pageSize, totalCount, new ArrayList<>(0));
    }

    /**
     * @param pageNumber  页码
     * @param pageSize    每页条数
     * @param totalCount  总条数
     * @param result      当页数据
     */
    public Page(int pageNumber, int pageSize, int totalCount, List<T> result) {
        if (pageSize <= 0) {
            throw new IllegalArgumentException("[pageSize] must great than zero");
        }
        this.pageSize = pageSize;
        this.pageNumber = PageUtils.computePageNumber(pageNumber, pageSize, totalCount);
        this.totalCount = totalCount;
        setResult(result);
    }

    /**
     * 设置当页数据。
     * @param result 当页数据
     */
    public void setResult(List<T> result) {
        if (result == null) {
            throw new IllegalArgumentException("'result' must be not null");
        }
        this.result = result;
    }

    public List<T> getResult() {
        return this.result;
    }

    public int getTotalCount() {
        return this.totalCount;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public int getThisPageNumber() {
        return this.pageNumber;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }
}
