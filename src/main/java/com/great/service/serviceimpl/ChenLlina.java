package com.great.service.serviceimpl;

import org.springframework.stereotype.Component;

@Component("lina")
public class ChenLlina implements Sleepable
{


    @Override
    public void sleep() {
        System.out.println("开始睡觉！");
    }
}
