package com.entity;

public class publicinit {
	public String id;
	public String title;
	public String text;

	
	
	public publicinit() {
		
	}
	public publicinit(String id, String title, String text) {
		super();
		this.id = id;
		this.title = title;
		this.text = text;
	}

	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
