package com.entity;

import java.util.ArrayList;
import java.util.List;

public class RoleInfo {
	public String mainroleid;    // 一级分类编码
	public String mainrolename;  // 一级分类名称
	public String powernames;//  权限字符串间隔,
	public String content;
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<Power> powerlist=new ArrayList<Power>();// 归属于一级分类的二级分类

	public String getMainroleid() {
		return mainroleid;
	}

	public void setMainroleid(String mainroleid) {
		this.mainroleid = mainroleid;
	}

	public String getMainrolename() {
		return mainrolename;
	}

	public void setMainrolename(String mainrolename) {
		this.mainrolename = mainrolename;
	}

	public List<Power> getPowerlist() {
		return powerlist;
	}

	public void setPowerlist(List<Power> powerlist) {
		this.powerlist = powerlist;
	}

	public String getPowernames() {
		return powernames;
	}

	public void setPowernames(String powernames) {
		this.powernames = powernames;
	}
	
	
	
}
