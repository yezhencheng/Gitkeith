package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.kszj;



public interface kszjDao {
	public List<kszj> selectshxzx();
	public kszj queryitem(Map<String, String> params);
	
	
}
