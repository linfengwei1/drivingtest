package com.great.service;


import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * 把从数据库导出Excel
 */
public class ExportExcelSeedBack {

    //显示的导出表的标题
    private String title;
    //导出表的列名
    private String[] rowName ;

    private List<Object[]>  dataList = new ArrayList<Object[]>();

    HttpServletResponse  response;


    //构造方法，传入要导出的数据
    public ExportExcelSeedBack(String title,String[] rowName,List<Object[]> dataList){
        this.dataList = dataList;
        this.rowName = rowName;
        this.title = title;
    }

    /*
     * 导出数据
     * */
    public void export(OutputStream out) throws Exception{
        try{
            HSSFWorkbook workbook = new HSSFWorkbook();                     // 创建工作簿对象
            HSSFSheet sheet = workbook.createSheet(title);                  // 创建工作表
            //sheet样式定义【getColumnTopStyle()/getStyle()均为自定义方法 - 在下面  - 可扩展】
            HSSFCellStyle columnTopStyle = this.getColumnTopStyle(workbook);//获取列头样式对象
            HSSFCellStyle style = this.getStyle(workbook);                  //单元格样式对象
            // 定义所需列数
            int columnNum = rowName.length;
            HSSFRow rowRowName = sheet.createRow(0);                // 在索引2的位置创建行(最顶端的行开始的第二行)

            // 将列头设置到sheet的单元格中
            for(int n=0;n<columnNum;n++){
                HSSFCell  cellRowName = rowRowName.createCell(n);               //创建列头对应个数的单元格
                cellRowName.setCellType(CellType.NUMERIC);             //设置列头单元格的数据类型
                HSSFRichTextString text = new HSSFRichTextString(rowName[n]);
                cellRowName.setCellValue(text);                                 //设置列头单元格的值
                cellRowName.setCellStyle(columnTopStyle);                       //设置列头单元格样式
            }

            //将查询出的数据设置到sheet对应的单元格中
            for(int i=0;i<dataList.size();i++){
                Object[] obj = dataList.get(i);//遍历每个对象
                HSSFRow row = sheet.createRow(i+1);//创建所需的行数（从第二行开始写数据）

                for(int j=0; j<obj.length; j++){
                    HSSFCell  cell = null;   //设置单元格的数据类型
                    if(j == 0){
                        cell = row.createCell(j,CellType.NUMERIC);
                        cell.setCellValue(i+1);
                    }else{
                        cell = row.createCell(j,CellType.NUMERIC);
                        if(!"".equals(obj[j]) && obj[j] != null){
                            cell.setCellValue(obj[j].toString());                       //设置单元格的值
                        }
                    }
                    cell.setCellStyle(style);                                   //设置单元格样式
                }
            }
            //让列宽随着导出的列长自动适应
            for (int colNum = 0; colNum < columnNum; colNum++) {
                int columnWidth = sheet.getColumnWidth(colNum) / 256;
                for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
                    HSSFRow currentRow;
                    //当前行未被使用过
                    if (sheet.getRow(rowNum) == null) {
                        currentRow = sheet.createRow(rowNum);
                    } else {
                        currentRow = sheet.getRow(rowNum);
                    }
                    if (currentRow.getCell(colNum) != null) {
                        HSSFCell currentCell = currentRow.getCell(colNum);
//                        if (currentCell.getCellType() == CellType.NUMERIC) {
//                            int length = 0;
//                            try {
//                                length = currentCell.getStringCellValue().getBytes().length;
//                            } catch (Exception e) {
//                                //e.printStackTrace();
//                            }
//                            if (columnWidth < length) {
//                                columnWidth = length;
//                            }
//                        }
                    }

                }
                if(colNum == 0){
                    sheet.setColumnWidth(colNum, (columnWidth-2) * 256);
                }else{
                    sheet.setColumnWidth(colNum, (columnWidth+4) * 256);
                }
            }
            if(workbook !=null){
                try{
                    workbook.write(out);
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            out.close();
        }
    }

    /*
     * 列头单元格样式
     */
    public HSSFCellStyle getColumnTopStyle(HSSFWorkbook workbook) {

        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        font.setFontHeightInPoints((short)11);
        //字体加粗
//        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //在样式用应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为居中对齐;
        style.setAlignment(HorizontalAlignment.CENTER);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(VerticalAlignment.CENTER);



        return style;

    }

    /*
     * 列数据信息单元格样式
     */
    public HSSFCellStyle getStyle(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
//        //设置底边框;
//        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
//        //设置底边框颜色;
//        style.setBottomBorderColor(HSSFColor.BLACK.index);
//        //设置左边框;
//        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
//        //设置左边框颜色;
//        style.setLeftBorderColor(HSSFColor.BLACK.index);
//        //设置右边框;
//        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
//        //设置右边框颜色;
//        style.setRightBorderColor(HSSFColor.BLACK.index);
//        //设置顶边框;
//        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
//        //设置顶边框颜色;
//        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式用应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为居中对齐;
        style.setAlignment(HorizontalAlignment.CENTER);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        return style;

    }



}
