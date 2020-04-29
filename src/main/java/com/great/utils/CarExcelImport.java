package com.great.utils;

import com.great.entity.CoachCar;
import com.great.entity.SchoolAdmin;
import com.great.entity.Student;
import org.apache.poi.ss.usermodel.*;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/*
 * 把Excel中的数据导入数据库
 * */
public class CarExcelImport {

    public static List<CoachCar> excelToShopIdList(InputStream inputStream, HttpServletRequest request) {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<CoachCar> list = new ArrayList<>();

        Workbook workbook = null;
        try {
            workbook = WorkbookFactory.create(inputStream);
//            System.out.println("workbook="+workbook);
            inputStream.close();
            //工作表对象
            Sheet sheet = workbook.getSheetAt(0);
            //总行数
            int rowLength = sheet.getLastRowNum();
//                        System.out.println("总行数有多少行" + rowLength);
            //工作表的列
            Row row = sheet.getRow(0);

            //总列数
            int colLength = row.getLastCellNum();
            int q =0;
//            System.out.println("总列数有多少列" + colLength);
            //得到指定的单元格
            Cell cell = row.getCell(0);
            if (5==colLength){
                for (int i = 1; i <= rowLength; i++) {
                    CoachCar coachCar = new CoachCar();
                    row = sheet.getRow(i);
                    for (int j = 0; j < colLength; j++) {
                        //列：0id   1车牌号 2学校id 3教练id 4状态
                        cell = row.getCell(j);
//                    System.out.print(cell + ",");
                        if (cell != null) {
                            cell.setCellType(CellType.STRING);//设置字段的数据为字符串
                            String data = cell.getStringCellValue();//获取值
                            data = data.trim();
                            q++;
                            if (j == 1) {
                                coachCar.setCarNumber(data);
                            } else if (j == 2) {
                                coachCar.setSchool_id(schoolAdmin.getSchool_id());
                            } else if (j == 3) {
                                coachCar.setCoach_id(Integer.parseInt(data));
                            }
                            else if (j == 4) {
                                coachCar.setCarState("信息不完整");
                            }
                        }
                    }
                    list.add(coachCar);
                    if (5!=q){
                        list.clear();
                    }if (q==5){
                        q=0;
                    }
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
}
