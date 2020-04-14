package com.great.entity;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DateTable {//数据列表
    private  int code;//代码返回code返回0表示成功返回其他值则失败，前端jsp的table根据它来加载数据控件
    private String msg = "";//描述msg：success或者error
    private  int count;//返回记录条数
    private List<?> data;//泛型数据集，把返回超级链接的数据集控件给它

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }
}
