package com.gxz.bus.utils;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;

public class ExcelCellStyleUtils {

	public static HSSFCellStyle createBodyCellStyle(HSSFWorkbook workbook) {
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

	public static HSSFCellStyle createTableTitleCellStyle(HSSFWorkbook workbook) {
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

	public static HSSFCellStyle createSecondTitleCellStyle(
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

	public static HSSFCellStyle createTitleCellStyle(HSSFWorkbook workbook) {
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
