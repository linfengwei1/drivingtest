package com.great.entity;

import java.util.List;

/**
 * ClassName: ObjectResult <br/>
 * Description: <br/>
 * date: 2020/3/10 10:21<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
public class ObjectResult {
    private Integer code;
    private Integer count;
    private List<?> data;

    public ObjectResult() {
    }

    public ObjectResult(Integer code, Integer count, List<?> data) {
        this.code = code;
        this.count = count;
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ObjectResult{" +
                "code=" + code +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}
