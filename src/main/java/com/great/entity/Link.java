package com.great.entity;

public class Link {
    private Integer linkId;
    private String linkName;
    private String linkUrl;
    private String linkSort;

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
        return "Link{" +
                "linkId=" + linkId +
                ", linkName='" + linkName + '\'' +
                ", linkUrl='" + linkUrl + '\'' +
                ", linkSort='" + linkSort + '\'' +
                '}';
    }
}
