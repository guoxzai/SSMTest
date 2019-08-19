package com.gxz.bus.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class RandomUtils {
	private static SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private static SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
	private static Random random=new Random();
	/**
	 * 根据老名字生成新的文件名  yyyyMMddHHmmssSSS[].PNG年月日时分秒毫秒+四位随机数+后缀名
	 * @param oldName     xfdsafdsafdsaf.sdaf.asd.f.das.fdsa.f.dasfds.png
	 */
	public static String createFileNameUseTime(String oldName){
		String suffix=oldName.substring(oldName.lastIndexOf("."), oldName.length());
		String time=sdf1.format(new Date());
		Integer num=random.nextInt(9000)+1000;
		return time+num+suffix;
	}
	/**
	 * 根据老名字生成新的文件名  uuid.PNG
	 * @param oldName     xfdsafdsafdsaf.sdaf.asd.f.das.fdsa.f.dasfds.png
	 */
	public static String createFileNameUseUUID(String oldName){
		String suffix=oldName.substring(oldName.lastIndexOf("."), oldName.length());
		String uuid=UUID.randomUUID().toString().replace("-", "").toUpperCase();
		return uuid+suffix;
	}
	/**
	 * 得到当前日期的字符串 yyyy-MM-dd 
	 * @return
	 */
	public static String createDirUseDate() {
		return sdf2.format(new Date());
	}
	public static void main(String[] args) {
		System.out.println(createFileNameUseUUID("xfdsafdsafdsaf.sdaf.fdsa.f.dasfds.png"));
	}
}