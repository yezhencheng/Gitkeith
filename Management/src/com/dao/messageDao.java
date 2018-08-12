package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.message;

public interface messageDao {
	public List<message> select();
	public void savemessage(Map<String,String> message);
}
