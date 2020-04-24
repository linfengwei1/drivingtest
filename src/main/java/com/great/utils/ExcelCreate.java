package com.great.utils;

import java.io.*;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.great.entity.Coach;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


/**
 * 把从数据库导出Excel
 */
public class ExcelCreate
{
	 public static Boolean ExcelCreate(List<Coach> list, HttpServletResponse response) {

			HSSFWorkbook hssfWorkbook = new HSSFWorkbook();

			HSSFSheet hssfSheet = hssfWorkbook.createSheet("sheet");

			HSSFRow row = hssfSheet.createRow(0);

			HSSFCell cell = row.createCell(0);
			cell.setCellValue("教练ID");

			cell = row.createCell(1);
			cell.setCellValue("账号");

			cell = row.createCell(2);
			cell.setCellValue("密码");

			cell = row.createCell(3);
			cell.setCellValue("姓名");

			cell = row.createCell(4);
			cell.setCellValue("性别");

			cell = row.createCell(5);
			cell.setCellValue("年龄");

			cell = row.createCell(6);
			cell.setCellValue("身份证号码");

			cell = row.createCell(7);
			cell.setCellValue("电话");

//			cell = row.createCell(8);
//			cell.setCellValue("热度");

			for (int i = 0; i < list.size(); i++) {
				Coach coach= list.get(i);
			    row = hssfSheet.createRow(i + 1);

			    int r = 0;
			    cell = row.createCell(r++);// ID
			    cell.setCellValue(coach.getId());

			    cell = row.createCell(r++);// 账号
			    cell.setCellValue(coach.getAccount());

			    cell = row.createCell(r++);// 密码
			    cell.setCellValue(coach.getPwd());

			    cell = row.createCell(r++);// 姓名
			    cell.setCellValue(coach.getName());

			    cell = row.createCell(r++);// 性别
			    cell.setCellValue(coach.getSex());

			    cell = row.createCell(r++);// 年龄
			    cell.setCellValue(coach.getAge());

			    cell = row.createCell(r++);// 电话
			    cell.setCellValue(coach.getPhone());

//			    cell = row.createCell(r++);// 类型
//			    cell.setCellValue(coach.getId());

//			    cell = row.createCell(r++);// 热度
//			    cell.setCellValue(tbmusic.getHeat());

			}


			try {
//			    FileOutputStream out = new FileOutputStream(UI.strr + "Excel\\excel.xls");
                FileOutputStream out = new FileOutputStream(  "D:\\test\\excel.xls");
//				OutputStream outputStream =response.getOutputStream();
			    hssfWorkbook.write(out);
				out.flush();
				out.close();
			    return true;

			} catch (FileNotFoundException e1) {
			    // TODO Auto-generated catch block
			    e1.printStackTrace();
				return false;
			} catch (IOException e) {
			    // TODO Auto-generated catch block
			    e.printStackTrace();
				return false;
			}
	}

}
