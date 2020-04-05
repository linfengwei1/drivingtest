package com.great.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ReflectUtils {






    private String str = "1";
    public String is = "2";

    public void a(){}

    private void b(){}


    public static Object newInstanceByClassName(String clazzName){//全路径名称
        try {
            //根据类名加载类
            Class clazz = Class.forName(clazzName);
            return newInstanceByClass(clazz);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Object newInstanceByClass(Class clazz){//User.class
        try {
            //实例化一个类
            return clazz.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Object newInstanceByNoParamsConstructor(Class clazz){
        try {
            Constructor constructor = clazz.getConstructor();
            return constructor.newInstance();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Object newInstanceByConstructor(Class clazz,Class[] paramType, Object[] paramValue){
        try {
            //Class[]{String.class, Integer.class, int.class}
            Constructor constructor = clazz.getConstructor(paramType);
            return constructor.newInstance(paramValue);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Field[] getFields(Class clazz){//获取javabean的属性
        return clazz.getFields();
    }

    public static Field[] getDeclaredFields(Class clazz){
        return clazz.getDeclaredFields();
    }

    public static Field getField(Class clazz, String fieldName){
        try {
            return clazz.getField(fieldName);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Field getDeclaredField(Class clazz, String fieldName){
        try {
            return clazz.getDeclaredField(fieldName);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Method[] getMethods(Class clazz){//获取javabean的方法
        return clazz.getMethods();
    }

    public static Method[] getDeclaredMethods(Class clazz){
        return clazz.getDeclaredMethods();
    }

    public static Method getMethod(Class clazz, String methodName){
        try {
            return clazz.getMethod(methodName);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Method getDeclaredMethod(Class clazz, String methodName){
        try {
            return clazz.getDeclaredMethod(methodName);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Object invoke(Class clazz, Method method, Object[] paramValue){
        return invoke(newInstanceByClass(clazz), method, paramValue);
    }

    public static Object invoke(Object obj, Method method, Object[] paramValue){
        try {
            return method.invoke(obj, paramValue);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 获取obj对象fieldName的Field
     * @param obj
     * @param fieldName
     * @return
     */
    public static Field getFieldByFieldName(Object obj, String fieldName) {
        for (Class superClass = obj.getClass(); superClass != Object.class; superClass = superClass
                .getSuperclass()) {
            try {
                return superClass.getDeclaredField(fieldName);
            } catch (NoSuchFieldException e) {
            }
        }
        return null;
    }

    /**
     * 获取obj对象fieldName的属性值
     * @param obj
     * @param fieldName
     * @return
     * @throws SecurityException
     * @throws NoSuchFieldException
     * @throws IllegalArgumentException
     * @throws IllegalAccessException
     */
    public static Object getValueByFieldName(Object obj, String fieldName)
            throws SecurityException, NoSuchFieldException,
            IllegalArgumentException, IllegalAccessException {
        Field field = getFieldByFieldName(obj, fieldName);
        Object value = null;
        if(field!=null){
            if (field.isAccessible()) {
                value = field.get(obj);
            } else {
                field.setAccessible(true);
                value = field.get(obj);
                field.setAccessible(false);
            }
        }
        return value;
    }

    /**
     * 设置obj对象fieldName的属性值
     * @param obj
     * @param fieldName
     * @param value
     * @throws SecurityException
     * @throws NoSuchFieldException
     * @throws IllegalArgumentException
     * @throws IllegalAccessException
     */
    public static void setValueByFieldName(Object obj, String fieldName,
                                           Object value) throws SecurityException, NoSuchFieldException,
            IllegalArgumentException, IllegalAccessException {
        Field field = obj.getClass().getDeclaredField(fieldName);
        if (field.isAccessible()) {
            field.set(obj, value);
        } else {
            field.setAccessible(true);
            field.set(obj, value);
            field.setAccessible(false);
        }
    }

    public static void main(String...args){
        Field[] fields = ReflectUtils.getDeclaredFields(ReflectUtils.class);
        for(Field field : fields){
            System.out.println(field.getName());
        }

        fields = ReflectUtils.getFields(ReflectUtils.class);
        for(Field field : fields){
            System.out.println("f:" + field.getName());
        }

        Object s = ReflectUtils.newInstanceByClass(ReflectUtils.class);
        System.out.println("s:" + s);
    }
}
