package com.great.utils;

import com.great.entity.TestScore;
import org.apache.poi.ss.usermodel.*;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/*
 * 把Excel中的数据导入数据库
 * */
public class ScoreExcelImport
{

    public static List<TestScore> excelToShopIdList(InputStream inputStream, HttpServletRequest request) {
        List<TestScore> list = new ArrayList<>();

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
//            System.out.println("总列数有多少列" + colLength);
            //得到指定的单元格
            Cell cell = row.getCell(0);
            for (int i = 1; i <= rowLength; i++) {
                TestScore testScore = new TestScore();
                row = sheet.getRow(i);
                for (int j = 0; j < colLength; j++) {
                    //列：  1考试编号 2学生ID 3科目ID 4成绩
                    cell = row.getCell(j);
//                    System.out.print(cell + ",");
                    if (cell != null) {
                        cell.setCellType(CellType.STRING);//设置字段的数据为字符串
                        String data = cell.getStringCellValue();
                        data = data.trim();
//                        if (j == 0) {
//                            student.setId(Integer.parseInt(data));
//                        }
                    if (j == 1) {
                            testScore.setTestId(Integer.parseInt(data));
                        } else if (j == 2) {
                            testScore.setStudentId(Integer.parseInt(data));
                        } else if (j == 3) {
                            testScore.setSubjectId(Integer.parseInt(data));
                        }else if (j == 4) {
                            testScore.setScore(Integer.parseInt(data));
                        }
                    }
                }
                list.add(testScore);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
