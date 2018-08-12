package com.entity;

public class message {
	public String id;
	public String username;
	public String message;
	public String date;
	
	
	public message() {
	}
	
	public message(String id, String username, String message, String date) {
		super();
		this.id = id;
		this.username = username;
		this.message = message;
		this.date = date;
	}

	
	
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
