package com.great.entity;

public class LinkUtils {
    private String page;
    private Integer minLimit;
    private Integer maxLimit;
    private Integer linkId;
    private String linkName;
    private String linkUrl;
    private String linkSort;

    public LinkUtils() {
    }

    public LinkUtils(String page, Integer minLimit, Integer maxLimit, Integer linkId, String linkName, String linkUrl, String linkSort) {
        this.page = page;
        this.minLimit = minLimit;
        this.maxLimit = maxLimit;
        this.linkId = linkId;
        this.linkName = linkName;
        this.linkUrl = linkUrl;
        this.linkSort = linkSort;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public Integer getMinLimit() {
        return minLimit;
    }

    public void setMinLimit(Integer minLimit) {
        this.minLimit = minLimit;
    }

    public Integer getMaxLimit() {
        return maxLimit;
    }

    public void setMaxLimit(Integer maxLimit) {
        this.maxLimit = maxLimit;
    }

    public Integer getLinkId() {
        return linkId;
    }

    public void setLinkId(Integer linkId) {
        this.linkId = linkId;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getLinkSort() {
        return linkSort;
    }

    public void setLinkSort(String linkSort) {
        this.linkSort = linkSort;
    }

    @Override
    public String toString() {
        return "LinkUtils{" +
                "page='" + page + '\'' +
                ", minLimit=" + minLimit +
                ", maxLimit=" + maxLimit +
                ", linkId=" + linkId +
                ", linkName='" + linkName + '\'' +
                ", linkUrl='" + linkUrl + '\'' +
                ", linkSort='" + linkSort + '\'' +
                '}';
    }
}
