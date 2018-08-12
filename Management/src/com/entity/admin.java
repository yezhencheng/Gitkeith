package com.entity;



public class admin {
public String id;
public String account;
public String password;
public String username;


public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public admin() {
	super();
	// TODO Auto-generated constructor stub
}
public admin(String id, String account, String password, String username) {
	super();
	this.id = id;
	this.account = account;
	this.password = password;
	this.username = username;
}

}
