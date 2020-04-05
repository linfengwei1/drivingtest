package com.great.test;

public class Test {

    private String name;

    public Test()
    {
    }
    public Test(String name)
    {
        this.name = name;
    }


    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public static void main(String[] args) throws Exception {
        Test t = new Test();
        System.out.println(t.getName());
    }


}
