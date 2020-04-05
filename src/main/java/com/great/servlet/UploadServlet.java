package com.great.servlet;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;

@WebServlet(name = "UploadServlet", urlPatterns = "/UploadServlet")
public class UploadServlet extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        upload(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        upload(request, response);
    }

    protected void upload(HttpServletRequest request, HttpServletResponse response){
        //判断是否文件上传还是普通表单提交
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);//multipart/form-data


        //拿到io流文件 --》文件名、文件类型、文件内容、文件长度 --》 封装成一个对象 ---》 new

        //上传多个文件 --》按多文件处理---》list《文件对象》

        //

        if(isMultipart){
            //创建一个解析器工厂
            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            //处理上传的文件数据，并将表单中每个输入项封装成一个FileItem 对象
            ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);

            upload.setHeaderEncoding("utf-8");
            try {
                //解析request,获取上传的文件项，并放进迭代器
                List<FileItem> items = upload.parseRequest(request);
                for(FileItem item : items){
                    if(item.isFormField()){
                        String name = item.getFieldName();
                        String value = item.getString("utf-8");
                        System.out.println(name + ":" + value);
                    }else{
                        //处理文件上传
                        String name = item.getName();
                        System.out.println(name);
                        item.write(new File("D:\\upload\\" + name));
                    }
                }

                response.setContentType("application/json; charset=utf-8");
                response.getWriter().write("{\"code\":0, \"msg\":\"\", \"data\":{}}");
                response.getWriter().flush();
                response.getWriter().close();

            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
