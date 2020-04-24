package com.great.aoplog;

import java.lang.annotation.*;

/**
 * 元注解：元注解是指注解的注解,包括  @Retention @Target @Document @Inherited四种。
 * @Retention: 定义注解的保留策略
	@Retention(RetentionPolicy.SOURCE)   //注解仅存在于源码中，在class字节码文件中不包含
	@Retention(RetentionPolicy.CLASS)     // 默认的保留策略，注解会在class字节码文件中存在，但运行时无法获得，
	@Retention(RetentionPolicy.RUNTIME)  // 注解会在class字节码文件中存在，在运行时可以通过反射获取到
 * @Target：定义注解的作用目标
 * @Target(ElementType.TYPE)   //接口、类、枚举、注解
	@Target(ElementType.FIELD) //字段、枚举的常量
	@Target(ElementType.METHOD) //方法
	@Target(ElementType.PARAMETER) //方法参数
	@Target(ElementType.CONSTRUCTOR)  //构造函数
	@Target(ElementType.LOCAL_VARIABLE)//局部变量
	@Target(ElementType.ANNOTATION_TYPE)//注解
	@Target(ElementType.PACKAGE) ///包   
	 由以上的源码可以知道，他的elementType 可以有多个，一个注解可以为类的，方法的，字段的等等
 * @Document：说明该注解将被包含在javadoc中
 * @Inherited：说明子类可以继承父类中的该注解
 * @author zx
 *
 */


@Target({ElementType.PARAMETER, ElementType.METHOD})  //表示注解只能用在方法前面
@Retention(RetentionPolicy.RUNTIME)  
@Documented  
public @interface Log {

    /** 要执行的操作类型  比如：增加操作 **/  
    public String operationType() default "";  
     
    /** 要执行的具体操作  比如：添加用户 **/  
    public String operationName() default "";
    
    public String abc() default "";
}
