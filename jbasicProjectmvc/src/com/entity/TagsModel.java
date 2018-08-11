package com.entity;

import java.util.HashMap;
import java.util.List;

public class TagsModel {
	   private String username;
private String password;
private int count;

private boolean checkboxone;

private List<User> userlist;

private String[] checkarray;

private String[] selectarray;

private String[] selectc;

private String selectid;

private HashMap<String,String> choosemap;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isCheckboxone() {
		return checkboxone;
	}

	public void setCheckboxone(boolean checkboxone) {
		this.checkboxone = checkboxone;
	}



	public String[] getCheckarray() {
		return checkarray;
	}

	public void setCheckarray(String[] checkarray) {
		this.checkarray = checkarray;
	}

	public String[] getSelectarray() {
		return selectarray;
	}

	public void setSelectarray(String[] selectarray) {
		this.selectarray = selectarray;
	}

	public HashMap<String, String> getChoosemap() {
		return choosemap;
	}

	public void setChoosemap(HashMap<String, String> choosemap) {
		this.choosemap = choosemap;
	}

	public String[] getSelectc() {
		return selectc;
	}

	public void setSelectc(String[] selectc) {
		this.selectc = selectc;
	}

	public String getSelectid() {
		return selectid;
	}

	public void setSelectid(String selectid) {
		this.selectid = selectid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<User> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<User> userlist) {
		this.userlist = userlist;
	}

	
	
	

	
	   
	
	   
	
	
}
