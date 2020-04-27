package com.great.utils;

import com.great.entity.Coach;
import com.great.entity.CoachCar;
import com.great.entity.SchoolAdmin;
import org.apache.poi.ss.usermodel.*;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/*
 * 把Excel中的数据导入数据库
 * */
public class CoachExcelImport {

    public static List<Coach> excelToShopIdList(InputStream inputStream, HttpServletRequest request) {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<Coach> list = new ArrayList<>();

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
//            System.out.println("总列数有多少列" + colLength);
            //得到指定的单元格
            Cell cell = row.getCell(0);
            if (10==colLength){
                for (int i = 1; i <= rowLength; i++) {
                    Coach coach = new Coach();
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
                                coach.setAccount(data);
                            } else if (j == 2) {
                                coach.setPwd(MD5Utils.md5(data));
                            } else if (j == 3) {
                                coach.setName(data);
                            }
                            else if (j == 4) {
                                coach.setSex(data);
                            }
                            else if (j == 5) {
                                coach.setAge(data);
                            }
                            else if (j == 6) {
                                coach.setIdnumber(data);
                            }
                            else if (j == 7) {
                                coach.setPhone(data);
                            }
                            else if (j == 8) {
                                coach.setCoach_state_id(5);
                            }
                            else if (j == 9) {
                                coach.setSchool_id(schoolAdmin.getSchool_id());
                            }
                        }
                    }
                    list.add(coach);
                    if (10!=q){
                        System.out.println(1);
                        list.clear();
                    }
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
}
