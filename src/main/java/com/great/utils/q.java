package com.great.utils;//package com.great.utils;
//
//import com.great.entity.Coach;
//import org.apache.poi.hssf.usermodel.*;
//
//public class q {
//    HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
//
//    HSSFSheet hssfSheet = hssfWorkbook.createSheet("sheet");
//
//    HSSFRow row = hssfSheet.createRow(0);
//
//    HSSFCell cell = row.createCell(0);
//			cell.setCellValue("教练ID");
//
//    cell = row.createCell(1);
//			cell.setCellValue("账号");
//
//    cell = row.createCell(2);
//			cell.setCellValue("密码");
//
//    cell = row.createCell(3);
//			cell.setCellValue("姓名");
//
//    cell = row.createCell(4);
//			cell.setCellValue("性别");
//
//    cell = row.createCell(5);
//			cell.setCellValue("年龄");
//
//    cell = row.createCell(6);
//			cell.setCellValue("身份证号码");
//
//    cell = row.createCell(7);
//			cell.setCellValue("电话");
//
////			cell = row.createCell(8);
////			cell.setCellValue("热度");
//
//			for (int i = 0; i < list.size(); i++) {
//        Coach coach= list.get(i);
//        row = hssfSheet.createRow(i + 1);
//
//        int r = 0;
//        cell = row.createCell(r++);// ID
//        cell.setCellValue(coach.getId());
//
//        cell = row.createCell(r++);// 账号
//        cell.setCellValue(coach.getAccount());
//
//        cell = row.createCell(r++);// 密码
//        cell.setCellValue(coach.getPwd());
//
//        cell = row.createCell(r++);// 姓名
//        cell.setCellValue(coach.getName());
//
//        cell = row.createCell(r++);// 性别
//        cell.setCellValue(coach.getSex());
//
//        cell = row.createCell(r++);// 年龄
//        cell.setCellValue(coach.getAge());
//
//        cell = row.createCell(r++);// 电话
//        cell.setCellValue(coach.getPhone());
//
////			    cell = row.createCell(r++);// 类型
////			    cell.setCellValue(coach.getId());
//
////			    cell = row.createCell(r++);// 热度
////			    cell.setCellValue(tbmusic.getHeat());
//
//    }
//
//​//在服务器中创建一个目录用于保存导出的excel（也可以将路径创建在本地磁盘中）
//
//    File pathServer=new File(request.getSession().getServletContext().getRealPath("/")+"excel");
//
//    //如果目录不存在则创建
//
//        if(!pathServer.exists()){
//
//        pathServer.mkdirs();
//
//    }
//
//    //将excel文件保存到服务器中
//
//    FileOutputStream fout = new FileOutputStream(pathServer+"/"+"product.xls");
//
//            wb.write(fout);
//
//            fout.close();
//
//​​//弹出下载框部分
//
//    ServletContext context = request.getSession().getServletContext();
//
//    //弹出下载框里的默认名称
//
//    String path = context.getRealPath("/产品管理表.xls");
//
//    //获取文件名
//
//    String filename = path.substring(path.lastIndexOf("\\")+1);
//
//    //将文件名进行URL编码
//
//    filename = URLEncoder.encode(filename,"utf-8");
//
//    //设置响应头，让浏览器打开下载窗口
//
//   response.setHeader("content-disposition", "attachment;filename="+filename);
//
//    //从下面这个路径读取要下载的文件
//
//    @SuppressWarnings("resource")
//
////读取上面保存到服务器的文件​
//
//            InputStream is = new FileInputStream(pathServer+"/"+"product.xls");
//
//    OutputStream out = response.getOutputStream();
//
//    byte[] bys = new byte[1024];
//
//    int len = 0;
//
//   while((len=is.read(bys))!=-1){
//
//        out.write(bys, 0, len);
//
//    }
//
//}
//}
