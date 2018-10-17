package com.hginfo.hbm.base.page;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页工具类。
 * date: 2014-2-19 上午11:01:10 <br/>
 *
 * @author henry
 */
public final class PageUtils {
    
    /**
     */
    private PageUtils() {
        
    }
    /**
     * @param pageNumber 
     * @param pageSize 
     * @return int
     */
    public static int getFirstResult(int pageNumber, int pageSize) {
        if (pageSize <= 0) {
            throw new IllegalArgumentException("[pageSize] must great than zero");
        }
        return (pageNumber - 1) * pageSize;
    }

    /**
     * @param currentPageNumber 
     * @param lastPageNumber  
     * @param count 
     * @return Integer[]
     */
    public static Integer[] generateLinkPageNumbers(int currentPageNumber, int lastPageNumber, int count) {
        int avg = count / 2;

        int startPageNumber = currentPageNumber - avg;
        if (startPageNumber <= 0) {
            startPageNumber = 1;
        }

        int endPageNumber = startPageNumber + count - 1;
        if (endPageNumber > lastPageNumber) {
            endPageNumber = lastPageNumber;
        }

        if (endPageNumber - startPageNumber < count) {
            startPageNumber = endPageNumber - count;
            if (startPageNumber <= 0) {
                startPageNumber = 1;
            }
        }

        List result = new ArrayList();
        for (int i = startPageNumber; i <= endPageNumber; i++) {
            result.add(new Integer(i));
        }
        return (Integer[]) result.toArray(new Integer[result.size()]);
    }

    /**
     * @param totalElements 
     * @param pageSize 
     * @return int
     */
    public static int computeLastPageNumber(int totalElements, int pageSize) {
        int result = totalElements % pageSize == 0 ? totalElements / pageSize : totalElements / pageSize + 1;

        if (result <= 1) {
            result = 1;
        }
        return result;
    }

    /**
     * @param pageNumber 
     * @param pageSize 
     * @param totalElements 
     * @return int
     */
    public static int computePageNumber(int pageNumber, int pageSize, int totalElements) {
        if (pageNumber <= 1) {
            return 1;
        }
        if ((Integer.MAX_VALUE == pageNumber) || (pageNumber > computeLastPageNumber(totalElements, pageSize))) {
            return computeLastPageNumber(totalElements, pageSize);
        }
        return pageNumber;
    }
}
