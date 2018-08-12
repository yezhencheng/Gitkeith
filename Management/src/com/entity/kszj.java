package com.entity;

public class kszj {
public String id;
public String zhuanjia;
public String zhicheng;
public String txt;
public String img;

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getZhuanjia() {
	return zhuanjia;
}
public void setZhuanjia(String zhuanjia) {
	this.zhuanjia = zhuanjia;
}
public String getZhicheng() {
	return zhicheng;
}
public void setZhicheng(String zhicheng) {
	this.zhicheng = zhicheng;
}
public String getTxt() {
	return txt;
}
public void setTxt(String txt) {
	this.txt = txt;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}




public kszj(String id, String zhuanjia, String zhicheng, String txt,
		String img, byte[] content, String contentutf) {
	super();
	this.id = id;
	this.zhuanjia = zhuanjia;
	this.zhicheng = zhicheng;
	this.txt = txt;
	this.img = img;
}
public kszj() {
	super();
	// TODO Auto-generated constructor stub
}

}
