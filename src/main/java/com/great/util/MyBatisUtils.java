package com.great.util;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

public class MyBatisUtils {

    private static String resource = "SqlMapConfig.xml";
    private static SqlSessionFactory sqlSessionFactory;

    static{
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static SqlSession getSession(){
        return sqlSessionFactory.openSession();
    }


    public static void main(String[] args) throws SQLException
    {



//        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ConfigTest.class);
//        System.out.println("#################################");
//        context.close();











//        SqlSession sqlSession = MyBatisUtils.getSession();
//        IUserDao userDao = sqlSession.getMapper(IUserDao.class);//获得代理对象
//        List<TreeData> treeData = userDao.findAllRecursion(1);
//        sqlSession.close();
//        for (TreeData t:treeData)
//        {
//            System.out.println(t);
//        }



//        User user = new User();
//        user.setUname("插入语句");
//        user.setPwd("11f");
//        sqlSession.insert("UserSqlMap.addUser",user);
//        sqlSession.commit();




//        User user = new User();
//        user.setUname("更新语句");
//        user.setuid(1);
//        user.setPwd("11f");
//        sqlSession.update("UserSqlMap.updateUser",user);
//        sqlSession.commit();

//        HashMap<String,String> map = new HashMap<>();
//        map.put("uname","张三");
//        map.put("pwd", null);
//        User u = sqlSession.selectOne("UserSqlMap.login",map);

    }
}
