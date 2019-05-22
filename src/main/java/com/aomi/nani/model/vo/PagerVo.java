package com.aomi.nani.model.vo;

import lombok.Data;

import java.util.Collections;
import java.util.List;


@Data
public class PagerVo<T> {

    /**
     * 原集合
     */
    private List<T> data;

    /**
     * 上一页页码
     */
    private int prePage;

    /**
     * 是否有上一页
     */
    private boolean hasPrevious;

    /**
     * 当前页
     */
    private int nowPage;

    /**
     * 下一页页码
     */
    private int nextPage;

    /**
     * 是否有下一页
     */
    private boolean hasNext;

    /**
     * 每页条数
     */
    private int pageSize;

    /**
     * 总页数
     */
    private int totalPage;

    /**
     * 总数据条数
     */
    private int totalCount;

    public PagerVo(List<T> data, int nowPage, int pageSize) {
        this.data = data;
        this.pageSize = pageSize;
        this.nowPage = nowPage;
        this.totalCount = data.size();
        this.totalPage = (totalCount + pageSize - 1) / pageSize;
        this.prePage = nowPage - 1 > 1 ? nowPage - 1 : 1;
        this.nextPage = nowPage >= totalPage ? totalPage : nowPage + 1;
        this.hasPrevious = nowPage != prePage;
        this.hasNext = nowPage != nextPage;
    }

    public PagerVo(List<T> data, int nowPage, int pageSize,int totalCount) {
        this.data = data;
        this.pageSize = pageSize;
        this.nowPage = nowPage;
        this.totalCount = totalCount;
        this.totalPage = (totalCount + pageSize - 1) / pageSize;
        this.prePage = nowPage - 1 > 1 ? nowPage - 1 : 1;
        this.nextPage = nowPage >= totalPage ? totalPage : nowPage + 1;
        this.hasPrevious = nowPage != prePage;
        this.hasNext = nowPage != nextPage;
    }

    /**
     * 当前页数据
     *
     * @return List
     */
    public List<T> getPageList() {
        int fromIndex = (nowPage - 1) * pageSize;
        if (fromIndex >= data.size()) {
            return Collections.emptyList();
        }
        if (fromIndex < 0) {
            return Collections.emptyList();
        }
        int toIndex = nowPage * pageSize;
        if (toIndex >= data.size()) {
            toIndex = data.size();
        }
        return data.subList(fromIndex, toIndex);
    }

}
