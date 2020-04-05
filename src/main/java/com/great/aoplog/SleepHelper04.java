package com.great.aoplog;

/**
 * 注入形式的Aspcet切面
 */
  
public class SleepHelper04
{
  public void after(){
    System.out.println("查询操作之后");
  }
  public void before(){
    System.out.println("查询操作之前");
  }
}