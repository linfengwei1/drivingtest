package com.great.utils;

import com.great.entity.SchoolAdmin;
import com.great.entity.Student;
import com.great.entity.User;
import org.apache.poi.ss.usermodel.*;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/*
 * 把Excel中的数据导入数据库
 * */
public class StudentExcelImport {

    public static List<Student> excelToShopIdList(InputStream inputStream, HttpServletRequest request) {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<Student> list = new ArrayList<>();

        Workbook workbook = null;
        try {
            workbook = WorkbookFactory.create(inputStream);
//            System.out.println("workbook="+workbook);
            inputStream.close();
            //工作表对象
            Sheet sheet = workbook.getSheetAt(0);
            //总行数
            int rowLength = sheet.getLastRowNum();
                        System.out.println("总行数有多少行" + rowLength);
            //工作表的列
            Row row = sheet.getRow(0);

            //总列数
            int colLength = row.getLastCellNum();
            int q =0;
            //得到指定的单元格
            Cell cell = row.getCell(0);
            if(colLength==11){
                for (int i = 1; i <= rowLength; i++) {
                    Student student = new Student();
                    row = sheet.getRow(i);
                    for (int j = 0; j < colLength; j++) {
                        //列：0学号  1账号 2密码 3姓名 4年龄 5身份证号码 6电话 7待审核状态(默认状态) 8驾校id 10教练id
                        cell = row.getCell(j);
//                    System.out.print(cell + ",");
                        if (cell != null) {
                            cell.setCellType(CellType.STRING);//设置字段的数据为字符串
                            String data = cell.getStringCellValue();
                            data = data.trim();
                            q++;
                            System.out.println("q=="+q);
                            if (j == 1) {
                                student.setAccount(data);
                            } else if (j == 2) {
                                student.setPwd(MD5Utils.md5(data));
                            } else if (j == 3) {
                                student.setName(data);
                            }else if (j == 4) {
                                student.setAge(data);
                            }else if (j == 5) {
                                student.setSex(data);
                            }else if (j == 6) {
                                student.setIdNumber(data);
                            }else if (j == 7) {
                                student.setPhone(data);
                            }else if (j == 8) {
                                student.setStudent_state_id(8);
                            }else if (j == 9) {
                                student.setSchool_id(schoolAdmin.getSchool_id());
                            }else if (j == 10) {
                                student.setCoach_id(Integer.parseInt(data));
                            }
                        }
                    }
                    list.add(student);
                    if (11!=q){
                        list.clear();
                    }if (q==11){
                        q=0;
                    }
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
}
