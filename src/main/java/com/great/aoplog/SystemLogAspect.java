package com.great.aoplog;


import com.great.entity.User;
import com.great.service.SystemLogService;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.Date;

@Aspect
@Component
public class SystemLogAspect  implements Ordered
{

//    private Logger logger = Logger.getLogger("zxtest");
    @Resource  //这里我用resource注解
    private SystemLogService systemLogService;
    //这里的zxtest要和log4j.properties里的配置一致，否则写不到文件中
    private static Logger logger = Logger.getLogger("zxtest");
    @Pointcut("execution(* com.great.service.serviceimpl.StudentManageServiceImpl.*(..))")//切入点
    public void logPointcut(){

    }

//    //配置controller环绕通知,使用在方法aspect()上注册的切入点
//    @Around("logPointcut()")
//    public void around(JoinPoint joinPoint){
//        System.out.println("==========开始执行controller环绕通知===============");
//        long start = System.currentTimeMillis();
//        //(signature是信号,标识的意思):获取被增强的方法相关信息.其后续方法有两个
//        //getDeclaringTypeName: 返回方法所在的包名和类名
//        //getname(): 返回方法名
//        String methodName = joinPoint.getSignature().getName();
//
//        try {
//            //ProceedingJoinPoint 执行proceed方法的作用是让目标方法执行
//            ((ProceedingJoinPoint) joinPoint).proceed();
//            long end = System.currentTimeMillis();
//
//
//            System.out.println("==========结束执行controller环绕通知===============");
//        } catch (Throwable e) {
//            System.out.println("环绕通知中的异常--------------------------------"+methodName+"-------"+e.getMessage());
//            long end = System.currentTimeMillis();
//        }
//
//    }


    @Around("logPointcut()")//环绕通知
    public Object after(JoinPoint joinPoint) throws Exception {
        String params = "";
        if (joinPoint.getArgs() !=  null && joinPoint.getArgs().length > 0) {
            for ( int i = 0; i < joinPoint.getArgs().length; i++) {
                //                params += JsonUtil.getJsonStr(joinPoint.getArgs()[i]) + ";";
                params += joinPoint.getArgs()[i] + ";";
            }
        }
        Object result = null;
        //自定义注解的处理
        //获取目标对象的类名
        String targetClassName = joinPoint.getTarget().getClass().getName();
        //获取方法名称
        String methodName = joinPoint.getSignature().getName();
        //获取参数值
        Object[] args = joinPoint.getArgs();
//        int c = args.length;
        Class targetClass = Class.forName(targetClassName);
        Method[] methods = targetClass.getMethods();
        boolean isMatch = true;
        String operationType = null;
        String operationName = null;
        for(Method method : methods)
        {
            if(method.getName().equals(methodName))
            {
                Class[] argCls = method.getParameterTypes();
                if(argCls.length == args.length)
                {
                    for(int i = 0; i < args.length; i ++)
                    {
                        if(args[i] instanceof HttpServletRequest
                                && argCls[i] == HttpServletRequest.class )
                        {
                            continue;
                        }
                        if(args[i] instanceof HttpServletResponse
                                && argCls[i] == HttpServletResponse.class )
                        {
                            continue;
                        }
                        if(argCls[i].isInstance(args[i]))
                        {
                            continue;
                        }
                        if(args[i] == null)
                        {
                            continue;
                        }

                        isMatch = false;
                        break;
                    }
                    if(!isMatch)
                    {
                        continue;
                    }
                    operationType = method.getAnnotation(Log.class).operationType();
                    operationName = method.getAnnotation(Log.class).operationName();
                }

            }
        }

        try {
            long start = System.currentTimeMillis();
            //方法执行之前  前置通知
            result = ((ProceedingJoinPoint) joinPoint).proceed();
            //后置通知，在返回值 之前执行
            System.out.println("正常执行日志："+operationType+"------"+operationName);
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String ip = request.getRemoteAddr();
            if(user == null)
            {
                user = (User)result;
            }
            System.out.println("得到了用户信息"+user.getUname());
            SystemLog log = new SystemLog();
            log.setDescription(operationName);
            log.setLogType((long)1);
            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            log.setParams(params);
            log.setCreateBy(user.getUname());
            log.setCreateDate(new Date());
            log.setRequestIp(ip);
            systemLogService.insertLog(log);
            long end = System.currentTimeMillis();
            if(logger.isInfoEnabled()){
                logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms!");
            }
        } catch (Exception ex) {
            //异常通知
            System.out.println("异常执行日志："+operationType+"------"+operationName);
            if(logger.isInfoEnabled()){//判断级别 再拼接字符串，提升性能
                logger.info("around " + joinPoint + "  with exception : " + ex.getMessage());
            }
            result = "error";
            throw new RuntimeException(ex);
        }finally
        {
            //最终通知
            return result;
        }

    }

    @Override
    public int getOrder() {
        // TODO Auto-generated method stub
        return 1;
    }
}
