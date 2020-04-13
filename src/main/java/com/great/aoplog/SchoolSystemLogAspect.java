package com.great.aoplog;


import com.great.entity.SchoolAdmin;
import com.great.entity.TbLog;
import com.great.service.SchoolManageService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * @author zx
 * @desc 切点类 
 */

@Aspect
@Component
public class SchoolSystemLogAspect {

    //注入Service用于把日志保存数据库  
//    @Resource  //这里我用resource注解
    @Autowired
    private SchoolManageService service;
    
    
  //这里的zxtest要和log4j.properties里的配置一致，否则写不到文件中
	private static Logger logger = Logger.getLogger("zxtest");

    //Controller层切点通过&& @annotation(com.great.aoplog.Log)来加条件,只能拦截有注解log的方法
    @Pointcut("execution (* com.great.controller..*.*(..))&& @annotation(com.great.aoplog.Log)")
    public  void controllerAspect() {  
    }  
    
    /** 
     * 前置通知 用于拦截Controller层记录用户的操作 
     * 
     * @param joinPoint 切点
     */ 
//    @Before("controllerAspect()")
//    //joinPoint 封装了代理方法信息的对象,若用不到则可以忽略不写
//    public void doBefore(JoinPoint joinPoint) {
//        System.out.println("==========执行controller前置通知===============");
//        //这个判断是为了提高新能？在高并发和复杂log信息拼接的情况下，使用这种标准的方法输出log能够省去不小的系统开销
//        //ERROR及其以上级别的log信息是一定会被输出的，所以只有logger.isDebugEnabled和logger.isInfoEnabled方法，而没有logger.isErrorEnabled方法。
//        if(logger.isInfoEnabled()){
//            logger.info("before " + joinPoint);
//            //输出到文件中
//        }
//    }
    
    //配置controller环绕通知,使用在方法aspect()上注册的切入点
//      @Around("controllerAspect()")
//      //joinPoint 封装了代理方法信息的对象,若用不到则可以忽略不写
//      public Object around(JoinPoint joinPoint){
//          System.out.println("==========开始执行controller环绕通知===============");
//          long start = System.currentTimeMillis();//获取程序运行开始的时间
//          //(signature是信号,标识的意思):获取被增强的方法相关信息.其后续方法有两个
//          //getDeclaringTypeName: 返回方法所在的包名和类名
//          //getname(): 返回方法名
//          String methodName = joinPoint.getSignature().getName();
//
//          try {
//              //ProceedingJoinPoint 执行proceed方法的作用是让目标方法执行
//             Object obj =  ((ProceedingJoinPoint) joinPoint).proceed();
//              long end = System.currentTimeMillis();//获取程序运行结束的时间
//              if(logger.isInfoEnabled()){//提高输出效率
//                  logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms!");
//              }
////              System.out.println("==========结束执行controller环绕通知===============");
//              return obj;
//          } catch (Throwable e) {
////        	  System.out.println("环绕通知中的异常--------------------------------"+methodName+"-------"+e.getMessage());
//              long end = System.currentTimeMillis();
//              if(logger.isInfoEnabled()){
//                  logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms with exception : " + e.getMessage());
//              }
//          }
//
//          return null;
//      }
    
    /** 
     * 后置通知 用于拦截Controller层记录用户的操作 
     * 
     * @param joinPoint 切点 
     */  
    @After("controllerAspect()")  
    public  void after(JoinPoint joinPoint) throws Throwable {
  
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        //读取session中的用户
      SchoolAdmin schoolAdmin = (SchoolAdmin) session.getAttribute("SchoolAdmin");
        //请求的IP
        String ip = request.getRemoteAddr();
         try {
             //拿到类名
             String targetName = joinPoint.getTarget().getClass().getName();
             //拿到方法名
             String methodName = joinPoint.getSignature().getName();
             //获取方法参数
             Object[] arguments = joinPoint.getArgs();
             //实例化类
             Class targetClass = Class.forName(targetName);
             //拿到实例化类的公共方法
             Method[] methods = targetClass.getMethods();
            String operationType = "";
            String operationName = "";
             for (Method method : methods) {
                 //判断方法名是否一致
                 if (method.getName().equals(methodName)) {  
                    Class[] clazzs = method.getParameterTypes();
                     //判断传入的参数是否一致
                     if (clazzs.length == arguments.length) {
                             operationType = method.getAnnotation(Log.class).operationType();
                             operationName = method.getAnnotation(Log.class).operationName();
                         break;  
                    }  
                }  
            }
            //*========控制台输出=========*//  
//            System.out.println("=====controller后置通知开始=====");
//            System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);
//            System.out.println("方法描述:" + operationName);
//            System.out.println("请求人:" + user.getName());
//            System.out.println("请求IP:" + ip);
            //*========数据库日志=========*//  
            TbLog log = new TbLog();
            log.setName(schoolAdmin.getName());//操作用户
            log.setType(operationType);//操作类型
            log.setContent(operationName);//操作内容
//             log.setOperationresult("正常");
//             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间格式
//             String rtime = sdf.format(new Date());//操作时间
             Timestamp d = new Timestamp(System.currentTimeMillis());
             log.setDatetime(d);//操作日期
             log.setIp(ip);
             log.setSchool_id(schoolAdmin.getSchool_id());
//            log.setId(UUID.randomUUID().toString());
//            log.setDescription(operationName);
//            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);
//            log.setLogType((long)0);
//            log.setRequestIp(ip);
//            log.setExceptioncode( null);
//            log.setExceptionDetail( null);
//            log.setParams( null);
//            log.setCreateBy(user.getName());
//            log.setCreateDate(new Date());
            //保存数据库
             service.addLog(log);
//            System.out.println("=====controller后置通知结束=====");
        }  catch (Exception e) {
            //记录本地异常日志  
            logger.error("==后置通知异常==");  
            logger.error("异常信息:{}------"+ e.getMessage());  
            
            
            throw e;
        }  
    } 
    
    //配置后置返回通知,使用在方法aspect()上注册的切入点
//      @AfterReturning("controllerAspect()")
//      public void afterReturn(JoinPoint joinPoint){
//          System.out.println("=====执行controller后置返回通知=====----");  
//              if(logger.isInfoEnabled()){
//                  logger.info("afterReturn " + joinPoint);
//              }
//      }
    
    /** 
     * 异常通知 用于拦截记录异常日志 
     * 
     * @param joinPoint 
     * @param e 
     */ 
//     @AfterThrowing(pointcut = "controllerAspect()", throwing="e")
//     public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) throws Throwable {
//         HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
//         HttpSession session = request.getSession();
//         //读取session中的用户
//         com.great.entity.User user = (com.great.entity.User) session.getAttribute("user");
//         //请求的IP
//         String ip = request.getRemoteAddr();
        //获取用户请求方法的参数并序列化为JSON格式字符串
//        System.out.println("异常通知开始------------------------------------------");
//        com.great.aoplog.User user = new com.great.aoplog.User();
//        user.setId(1);
//        user.setName("张三");
//        String ip = "127.0.0.1";

//        String params = "";
//         if (joinPoint.getArgs() !=  null && joinPoint.getArgs().length > 0) {
//             for ( int i = 0; i < joinPoint.getArgs().length; i++) {
//                params += JsonUtil.getJsonStr(joinPoint.getArgs()[i]) + ";";
//            	 params += joinPoint.getArgs()[i] + ";";
//            }
//        }
//         try {
//
//             String targetName = joinPoint.getTarget().getClass().getName();
//             String methodName = joinPoint.getSignature().getName();
//             Object[] arguments = joinPoint.getArgs();
//             Class targetClass = Class.forName(targetName);
//             Method[] methods = targetClass.getMethods();
//             String operationType = "";
//             String operationName = "";
//              for (Method method : methods) {
//                  if (method.getName().equals(methodName)) {
//                     Class[] clazzs = method.getParameterTypes();
//                      if (clazzs.length == arguments.length) {
//                          operationType = method.getAnnotation(Log.class).operationType();
//                          operationName = method.getAnnotation(Log.class).operationName();
//                          break;
//                     }
//                 }
//             }

             /*========控制台输出=========*/
//            System.out.println("=====异常通知开始=====");
//            System.out.println("异常代码:" + e.getClass().getName());
//            System.out.println("异常信息:" + e.getMessage());
//            System.out.println("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);
//            System.out.println("方法描述:" + operationName);
//            System.out.println("请求人:" + user.getName());
//            System.out.println("请求IP:" + ip);
//            System.out.println("请求参数:" + params);
               /*==========数据库日志=========*/
//            SystemLog log = new SystemLog();
//             log.setOperationUser(user.getName());//操作用户
//             log.setOperationType(operationType);//操作类型
//             log.setOperationName(operationName);//操作内容
//             log.setOperationresult("异常");
//             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置时间格式
//             String rtime = sdf.format(new Date());//操作时间
//             log.setOperationdate(rtime);//操作日期
//             log.setOperationIp(ip);
            //保存数据库
//             myService.addLog(log);
//            System.out.println("=====异常通知结束=====");
//        }  catch (Exception ex) {
//            //记录本地异常日志
//            logger.error("==异常通知异常==");
//            logger.error("异常信息:{}------"+ ex.getMessage());
//        }
         /*==========记录本地异常日志==========*/  
//        logger.error("异常方法:{}异常代码:{}异常信息:{}参数:{}-----"+joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName(), e.getClass().getName(), e.getMessage(), params);  
  
//    }

}