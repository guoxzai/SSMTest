package com.gxz.test;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class ExportTest {
		public static void main(String[] args) {
			List<User> list = new ArrayList<>();
			for(int i=0;i<20;i++){
				list.add(new User(i+1, "张三"+i, "武汉"+i, new Date()));
			}

			export(list);
		}
		
		public static void export(List<User> users) {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("用户信息");
			sheet.setDefaultColumnWidth(50);
			
			CellRangeAddress region1 = new CellRangeAddress(0, 0, 0, 3);
			CellRangeAddress region2 = new CellRangeAddress(1, 1, 0, 3);
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
			row1_cell1.setCellValue("用户信息");
			
			row++;
			HSSFRow row2 = sheet.createRow(row);
			HSSFCell row2_cell1 = row2.createCell(0);
			row2_cell1.setCellStyle(secondTitleCellStyle);
			row2_cell1.setCellValue("总数20人  导出时间：2019年1月23日19:49:58");
			String[] tableHead = {"用户ID","用户姓名","用户地址","用户生日"};
			
			row++;
			HSSFRow row3 = sheet.createRow(row);
			for(int i=0;i<tableHead.length;i++){
				HSSFCell row3_cell = row3.createCell(i);
				row3_cell.setCellStyle(tableTitleCellStyle);
				row3_cell.setCellValue(tableHead[i]);
			}
			
			for(int i=0;i<users.size();i++){
				row++;
				User user = users.get(i);
				HSSFRow row4 = sheet.createRow(row);
				HSSFCell row4_cell1 = row4.createCell(0);
				row4_cell1.setCellStyle(tableBodyCellStyle);
				row4_cell1.setCellValue(user.getId());
				
				HSSFCell row4_cell2 = row4.createCell(1);
				row4_cell2.setCellStyle(tableBodyCellStyle);
				row4_cell2.setCellValue(user.getName());
				
				HSSFCell row4_cell3 = row4.createCell(2);
				row4_cell3.setCellStyle(tableBodyCellStyle);
				row4_cell3.setCellValue(user.getAddress());
				
				HSSFCell row4_cell4 = row4.createCell(3);
				row4_cell4.setCellStyle(tableBodyCellStyle);
				row4_cell4.setCellValue(user.getAddress());
			}
			
			File file = new File("D:\\Test\\user.xls");
			try {
				workbook.write(file);
				System.out.println("用户信息导出成功");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		private static HSSFCellStyle createBodyCellStyle(HSSFWorkbook workbook) {
			HSSFCellStyle style = workbook.createCellStyle();
			style.setAlignment(HorizontalAlignment.CENTER);
			style.setVerticalAlignment(VerticalAlignment.CENTER);
			
			HSSFFont font = workbook.createFont();
			font.setFontName("华文宋体");
			font.setFontHeightInPoints((short)18);
			font.setColor(HSSFColorPredefined.BLACK.getIndex());
			style.setFont(font);
			return style;
		}

		private static HSSFCellStyle createTableTitleCellStyle(HSSFWorkbook workbook) {
			HSSFCellStyle style = workbook.createCellStyle();
			style.setAlignment(HorizontalAlignment.CENTER);
			style.setVerticalAlignment(VerticalAlignment.CENTER);
			
			HSSFFont font = workbook.createFont();
			font.setFontHeightInPoints((short)18);
			font.setFontName("华文行楷");
			font.setColor(HSSFColorPredefined.BLACK.getIndex());
			style.setFont(font);
			return style;
		}

		private static HSSFCellStyle createSecondTitleCellStyle(
				HSSFWorkbook workbook) {
			HSSFCellStyle style = workbook.createCellStyle();
			style.setAlignment(HorizontalAlignment.CENTER);
			style.setVerticalAlignment(VerticalAlignment.CENTER);
			
			HSSFFont font = workbook.createFont();
			font.setFontHeightInPoints((short)22);
			font.setFontName("华文行楷");
			font.setColor(HSSFColorPredefined.BLUE.getIndex());
			style.setFont(font);
			return style;
		}

		private static HSSFCellStyle createTitleCellStyle(HSSFWorkbook workbook) {
			HSSFCellStyle style = workbook.createCellStyle();
			style.setAlignment(HorizontalAlignment.CENTER);
			style.setVerticalAlignment(VerticalAlignment.CENTER);
			
			HSSFFont font = workbook.createFont();
			font.setBold(true);
			font.setFontName("华文行楷");
			font.setFontHeightInPoints((short)30);
			font.setColor(HSSFColorPredefined.RED.getIndex());
			style.setFont(font);
			return style;
		}

	}

	class User {
		private Integer id;
		private String name;
		private String address;
		private Date birthday;

		public User(Integer id, String name, String address, Date birthday) {
			super();
			this.id = id;
			this.name = name;
			this.address = address;
			this.birthday = birthday;
		}

		public User() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public Date getBirthday() {
			return birthday;
		}

		public void setBirthday(Date birthday) {
			this.birthday = birthday;
		}

}
