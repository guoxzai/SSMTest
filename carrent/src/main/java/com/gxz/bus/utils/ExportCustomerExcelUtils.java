package com.gxz.bus.utils;

import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

import com.gxz.bus.domain.Customer;

import static com.gxz.bus.utils.ExcelCellStyleUtils.*;

public class ExportCustomerExcelUtils {

	public static void exportCustomer(String fileName, String sheetName,
			List<Customer> customerList, HttpServletResponse response) {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet(sheetName);
		sheet.setDefaultColumnWidth(50);
		
		CellRangeAddress region1 = new CellRangeAddress(0, 0, 0, 5);
		CellRangeAddress region2 = new CellRangeAddress(1, 1, 0, 5);
		
		sheet.addMergedRegion(region1);
		sheet.addMergedRegion(region2);
		
		HSSFCellStyle titleCellStyle = createTitleCellStyle(workbook);
		HSSFCellStyle secondTitleCellStyle = createSecondTitleCellStyle(workbook);
		HSSFCellStyle tableTitleCellStyle = createTableTitleCellStyle(workbook);
		HSSFCellStyle tableBodyCellStyle = createBodyCellStyle(workbook);
		
		int row = 0;
		HSSFRow row1 = sheet.createRow(row);
		HSSFCell row1_cell1 = row1.createCell(0);
		row1_cell1.setCellStyle(titleCellStyle);
		row1_cell1.setCellValue(sheetName);
		
		row++;
		HSSFRow row2 = sheet.createRow(row);
		HSSFCell row2_cell1 = row2.createCell(0);
		row2_cell1.setCellStyle(secondTitleCellStyle);
		row2_cell1.setCellValue("总数:"+customerList.size()+"  导出时间:"+new Date().toLocaleString());
		
		row++;
		String[] tableHead = {"身份证号","客户姓名","客户地址","客户电话","客户性别","客户职位"};
		HSSFRow row3 = sheet.createRow(row);
		for(int i=0;i<tableHead.length;i++){
			HSSFCell cell = row3.createCell(i);
			cell.setCellStyle(tableTitleCellStyle);
			cell.setCellValue(tableHead[i]);
		}
		
		for(int i=0;i<customerList.size();i++){
			row++;
			Customer customer = customerList.get(i);
			HSSFRow row4 = sheet.createRow(row);
			HSSFCell row4_cell1 = row4.createCell(0);
			row4_cell1.setCellStyle(tableBodyCellStyle);
			row4_cell1.setCellValue(customer.getIdentity());
			
			HSSFCell row4_cell2 = row4.createCell(1);
			row4_cell2.setCellStyle(tableBodyCellStyle);
			row4_cell2.setCellValue(customer.getCustname());
			
			HSSFCell row4_cell3 = row4.createCell(2);
			row4_cell3.setCellStyle(tableBodyCellStyle);
			row4_cell3.setCellValue(customer.getAddress());
			
			HSSFCell row4_cell4 = row4.createCell(3);
			row4_cell4.setCellStyle(tableBodyCellStyle);
			row4_cell4.setCellValue(customer.getPhone());
			
			HSSFCell row4_cell5 = row4.createCell(4);
			row4_cell5.setCellStyle(tableBodyCellStyle);
			row4_cell5.setCellValue(customer.getSex()==1?"男":"女");
			
			HSSFCell row4_cell6 = row4.createCell(5);
			row4_cell6.setCellStyle(tableBodyCellStyle);
			row4_cell6.setCellValue(customer.getCareer());
		}
		
		try {
			response.reset();
			fileName = URLEncoder.encode(fileName, "UTF-8");//处理文件下载名的乱码问题
			response.setContentType("application/x-msdownload");
			response.addHeader("Content-Disposition", "attachment; filename=\"" +fileName + "\"");
			ServletOutputStream stream = response.getOutputStream();
			workbook.write(stream);
			stream.flush();
		    stream.close();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		};

		
	}
	
}
