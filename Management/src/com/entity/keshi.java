package com.entity;

public class keshi {
	public String id;
	public String keshi;
	public String url;
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKeshi() {
		return keshi;
	}
	public void setKeshi(String keshi) {
		this.keshi = keshi;
	}
	
	public keshi() {
		super();
	}
	public keshi(String id, String keshi, String url) {
		super();
		this.id = id;
		this.keshi = keshi;
		this.url = url;
	}
	
	
}
