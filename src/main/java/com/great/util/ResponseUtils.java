package com.great.util;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ResponseUtils {

    public static void outJson(HttpServletResponse response,
                               Object responseObject) {
        //将实体对象转换为JSON Object转换
        Gson gson = new Gson();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.write(gson.toJson(responseObject));
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();

            System.out.println("将对象转为json，生成响应出错:" + e.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    public static void outJson(HttpServletResponse response,
                               String json) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.write(json);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("生成json响应出错:" + e.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    public static void outHtml(HttpServletResponse response,
                               String html) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.write(html);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("生成HTML响应出错:" + e.getMessage());
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}
