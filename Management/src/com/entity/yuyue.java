package com.entity;

import java.util.Date;

public class yuyue {
	public String id;
	public String username;
	public String zhuanjia;
	public String time;
	public String txt;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getZhuanjia() {
		return zhuanjia;
	}
	public void setZhuanjia(String zhuanjia) {
		this.zhuanjia = zhuanjia;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		this.txt = txt;
	}
	
	public yuyue(String id, String username, String zhuanjia, String time,
			String txt) {
		super();
		this.id = id;
		this.username = username;
		this.zhuanjia = zhuanjia;
		this.time = time;
		this.txt = txt;
	}
	public yuyue() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
