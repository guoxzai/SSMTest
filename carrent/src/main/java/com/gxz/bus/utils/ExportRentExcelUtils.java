package com.gxz.bus.utils;

import static com.gxz.bus.utils.ExcelCellStyleUtils.createBodyCellStyle;
import static com.gxz.bus.utils.ExcelCellStyleUtils.createTitleCellStyle;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.util.CellRangeAddress;

import com.gxz.bus.domain.Customer;
import com.gxz.bus.domain.Rent;

public class ExportRentExcelUtils {

	public static void exportRent(Rent rent, Customer customer,
			String fileName, String titleName, HttpServletResponse response) {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet(titleName);
		sheet.setDefaultColumnWidth(30);
		sheet.setColumnWidth(1, 256*50);
		
		CellRangeAddress region = new CellRangeAddress(0,0,0,3);
		sheet.addMergedRegion(region);
		
		HSSFCellStyle titleCellStyle = createTitleCellStyle(workbook);
		HSSFCellStyle tableBodyCellStyle = createBodyCellStyle(workbook);
		
		int row = 0;
		HSSFRow row1 = sheet.createRow(row);
		HSSFCell row1_cell1 = row1.createCell(0);
		row1_cell1.setCellStyle(titleCellStyle);
		row1_cell1.setCellValue(titleName);
		
		row++;
		HSSFRow row2 = sheet.createRow(row);
		row2.setHeight((short)(150*20));
		
		HSSFCell row2_cell1 = row2.createCell(0);
		row2_cell1.setCellStyle(tableBodyCellStyle);
		row2_cell1.setCellValue("出租单号");
		
		HSSFCell row2_cell2 = row2.createCell(1);
		row2_cell2.setCellStyle(tableBodyCellStyle);
		row2_cell2.setCellValue(rent.getRentid());

		HSSFCell row2_cell3 = row2.createCell(2);
		row2_cell3.setCellStyle(tableBodyCellStyle);
		row2_cell3.setCellValue("二维码");
		
		/*HSSFCell row2_cell4 = row2.createCell(3);
		row2_cell4.setCellStyle(tableBodyCellStyle);
		row2_cell4.setCellValue("");*/
		InputStream logoStream = ExportRentExcelUtils.class.getClassLoader()
				.getResourceAsStream("rt.jpg");
		System.out.println(logoStream);
		
		String Content = "出租单号:"+rent.getRentid()+"\r\n客户姓名:"+customer.getCustname()+"\n客户身份证号:"+customer.getIdentity()
					+"\n起租时间:"+rent.getBegindate().toLocaleString()+"\n还车时间:"+rent.getReturndate().toLocaleString()+"\n车牌号:"+rent.getCarnumber()
					+"\n出租价格:"+rent.getPrice()+"\n打印时间:"+new Date().toLocaleString()+"\n操作员:"+rent.getOpername();
		// 生成二维码
		BufferedImage image = ZXingEncodeUtils.createLogoCode(Content,
				200, 200, "gif", logoStream);
		//创建一个内存流
		ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
		try {
			// 把图片流写入内存流
			ImageIO.write(image, "jpg", byteArrayOut);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		// 画图的顶级管理器，一个sheet只能获取一个（一定要注意这点）
		HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		// anchor主要用于设置图片的属性
		/**
		 * dx1：起始单元格的x偏移量，如例子中的255表示直线起始位置距A1单元格左侧的距离；
		 * dy1：起始单元格的y偏移量，如例子中的125表示直线起始位置距A1单元格上侧的距离；
		 * dx2：终止单元格的x偏移量，如例子中的1023表示直线起始位置距C3单元格左侧的距离；
		 * dy2：终止单元格的y偏移量，如例子中的150表示直线起始位置距C3单元格上侧的距离； col1：起始单元格列序号，从0开始计算；
		 * row1：起始单元格行序号，从0开始计算，如例子中col1=0,row1=0就表示起始单元格为A1；
		 * col2：终止单元格列序号，从0开始计算；
		 * row2：终止单元格行序号，从0开始计算，如例子中col2=2,row2=2就表示起始单元格为C3；
		 */
		HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 0, 255, (short) 3,
				1, (short) 4, 1);
		anchor.setAnchorType(ClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);
		patriarch.createPicture(anchor, workbook.addPicture(
				byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
		
		row++;
		HSSFRow row3 = sheet.createRow(row);
		HSSFCell row3_cell1 = row3.createCell(0);
		row3_cell1.setCellStyle(tableBodyCellStyle);
		row3_cell1.setCellValue("客户姓名:");
		
		HSSFCell row3_cell2 = row3.createCell(1);
		row3_cell2.setCellStyle(tableBodyCellStyle);
		row3_cell2.setCellValue(customer.getCustname());
		
		HSSFCell row3_cell3 = row3.createCell(2);
		row3_cell3.setCellStyle(tableBodyCellStyle);
		row3_cell3.setCellValue("客户身份证号:");
		
		HSSFCell row3_cell4 = row3.createCell(3);
		row3_cell4.setCellStyle(tableBodyCellStyle);
		row3_cell4.setCellValue(customer.getIdentity());
		
		row++;
		HSSFRow row4 = sheet.createRow(row);
		HSSFCell row4_cell1 = row4.createCell(0);
		row4_cell1.setCellStyle(tableBodyCellStyle);
		row4_cell1.setCellValue("起租时间:");
		
		HSSFCell row4_cell2 = row4.createCell(1);
		row4_cell2.setCellStyle(tableBodyCellStyle);
		row4_cell2.setCellValue(rent.getBegindate().toLocaleString());
		
		HSSFCell row4_cell3 = row4.createCell(2);
		row4_cell3.setCellStyle(tableBodyCellStyle);
		row4_cell3.setCellValue("还车时间:");
		
		HSSFCell row4_cell4 = row4.createCell(3);
		row4_cell4.setCellStyle(tableBodyCellStyle);
		row4_cell4.setCellValue(rent.getReturndate().toLocaleString());
		
		
		row++;
		HSSFRow row5 = sheet.createRow(row);
		HSSFCell row5_cell1 = row5.createCell(0);
		row5_cell1.setCellStyle(tableBodyCellStyle);
		row5_cell1.setCellValue("车辆编号:");
		
		HSSFCell row5_cell2 = row5.createCell(1);
		row5_cell2.setCellStyle(tableBodyCellStyle);
		row5_cell2.setCellValue(rent.getCarnumber());
		
		HSSFCell row5_cell3 = row5.createCell(2);
		row5_cell3.setCellStyle(tableBodyCellStyle);
		row5_cell3.setCellValue("出租价格:");
		
		HSSFCell row5_cell4 = row5.createCell(3);
		row5_cell4.setCellStyle(tableBodyCellStyle);
		row5_cell4.setCellValue(rent.getPrice());
		
		row++;//第六行
		row++;
		HSSFRow row7 = sheet.createRow(row);
		HSSFCell row7_cell3 = row7.createCell(2);
		row7_cell3.setCellStyle(tableBodyCellStyle);
		row7_cell3.setCellValue("打印时间");
		
		HSSFCell row7_cell4 = row7.createCell(3);
		row7_cell4.setCellStyle(tableBodyCellStyle);
		row7_cell4.setCellValue(new Date().toLocaleString());
		
		row++;
		HSSFRow row8 = sheet.createRow(row);
		HSSFCell row8_cell3 = row8.createCell(2);
		row8_cell3.setCellStyle(tableBodyCellStyle);
		row8_cell3.setCellValue("操作人员");
		
		HSSFCell row8_cell4 = row8.createCell(3);
		row8_cell4.setCellStyle(tableBodyCellStyle);
		row8_cell4.setCellValue(rent.getOpername());
		
		row++;
		HSSFRow row9 = sheet.createRow(row);
		HSSFCell row9_cell3 = row9.createCell(2);
		row9_cell3.setCellStyle(tableBodyCellStyle);
		row9_cell3.setCellValue("客户签名");
		// 写出去
		try {
			response.reset();
			fileName = URLEncoder.encode(fileName, "UTF-8");// 处理文件下载名的乱码问题
			response.setContentType("application/x-msdownload");
			response.addHeader("Content-Disposition", "attachment; filename=\""
					+ fileName + "\"");
			ServletOutputStream stream = response.getOutputStream();
			workbook.write(stream);
			stream.flush();
			stream.close();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
