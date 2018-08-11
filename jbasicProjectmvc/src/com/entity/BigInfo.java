package com.entity;

import java.util.ArrayList;
import java.util.List;

public class BigInfo {
	public String bigid;
	public String bigname;
	public String smallid;
	public String smallname;
	public String typecontent;
	public List<T0300NEWS> newslist=new ArrayList<T0300NEWS>();
	
	
	
	
	public String getTypecontent() {
		return typecontent;
	}
	public void setTypecontent(String typecontent) {
		this.typecontent = typecontent;
	}
	public String getSmallid() {
		return smallid;
	}
	public void setSmallid(String smallid) {
		this.smallid = smallid;
	}
	public String getSmallname() {
		return smallname;
	}
	public void setSmallname(String smallname) {
		this.smallname = smallname;
	}
	public List<T0300NEWS> getNewslist() {
		return newslist;
	}
	public void setNewslist(List<T0300NEWS> newslist) {
		this.newslist = newslist;
	}
	public String getBigid() {
		return bigid;
	}
	public void setBigid(String bigid) {
		this.bigid = bigid;
	}
	public String getBigname() {
		return bigname;
	}
	public void setBigname(String bigname) {
		this.bigname = bigname;
	}
	
	
	
}
