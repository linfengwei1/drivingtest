package com.great.aoplog;


import com.great.service.serviceimpl.Sleepable;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test
{

	public void test01() {
		ApplicationContext ct = new ClassPathXmlApplicationContext(
				"applicationContext_aop01.xml");

		Sleepable sleeper = (Sleepable) ct.getBean("linaProxy");

		sleeper.sleep();
	}

	public void test02() {
		ApplicationContext ct = new ClassPathXmlApplicationContext(
				"applicationContext_aop02.xml");

		Sleepable sleeper = (Sleepable) ct.getBean("lina");

		sleeper.sleep();
	}

	public void test03() {
		ApplicationContext ct = new ClassPathXmlApplicationContext(
				"applicationContext_aop03.xml");

		Sleepable sleeper = (Sleepable) ct.getBean("lina");

		sleeper.sleep();
	}

	public void test04() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");

		Sleepable sleeper = (Sleepable) ac.getBean("lina");

		sleeper.sleep();
	}
	
	public static void main(String[] args) {
		Test test =new Test();
		test.test04();
	}
	
	
}
