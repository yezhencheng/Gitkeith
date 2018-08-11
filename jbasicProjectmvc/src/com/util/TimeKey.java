package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeKey {
	public static String newkey(String key)
	{
		String newkey="";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//3位字母
		newkey=key+sdf.format(new Date());
		return newkey;
	}
	
	public static String NowTime()
	{
		String newkey="";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//3位字母
		newkey=sdf.format(new Date());
		return newkey;
	}
	
	public  String wulipath="";

	public String getWulipath() {
		return wulipath;
	}

	public void setWulipath(String wulipath) {
		this.wulipath = wulipath;
	}
	
	
	
	
}
