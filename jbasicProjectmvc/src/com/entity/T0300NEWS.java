package com.entity;

import com.mysql.jdbc.Blob;



public class T0300NEWS {
	
	public String id;
	public String newsid;
	public String typeid;
	public String title;
	public String keywords;
	public String description;
	public byte[] content;
	public String contentutf;
	public String power;	
	public String used;
	public String datetime;
	public String point;
	
	public String typename;
	public String bigid;
	public String datetimef;
	public String updown;// up上一篇，down下一篇
	
	public String bigname;
	public String smallname;
	
	
	
	
	public String getDatetimef() {
		return datetimef;
	}
	public void setDatetimef(String datetimef) {
		this.datetimef = datetimef;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNewsid() {
		return newsid;
	}
	public void setNewsid(String newsid) {
		this.newsid = newsid;
	}
	public String getTypeid() {
		return typeid;
	}
	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}


	
	
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getContentutf() {
		return contentutf;
	}
	public void setContentutf(String contentutf) {
		this.contentutf = contentutf;
	}
	
	public String getSmallname() {
		return smallname;
	}
	public void setSmallname(String smallname) {
		this.smallname = smallname;
	}
	public String getBigid() {
		return bigid;
	}
	public void setBigid(String bigid) {
		this.bigid = bigid;
	}
	public String getUpdown() {
		return updown;
	}
	public void setUpdown(String updown) {
		this.updown = updown;
	}
	public String getBigname() {
		return bigname;
	}
	public void setBigname(String bigname) {
		this.bigname = bigname;
	}
	
	
	
	
}
