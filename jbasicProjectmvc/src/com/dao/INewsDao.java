package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.entity.BigInfo;
import com.entity.Power;
import com.entity.RoleInfo;
import com.entity.T0300NEWS;
import com.entity.T0301NEWSTYPE;
import com.entity.User;

public interface INewsDao {
	public List<T0301NEWSTYPE> querybigtype();
	
	public List<T0301NEWSTYPE> querysmalltype(Map<String, String> params);
	
	public void dosavenews(Map<String, String> params);
	
	public void doupdatenews(Map<String, String> params);
	
	public List<T0300NEWS> findlist(Map<String, String> params);
	
	public List<T0301NEWSTYPE> findtypelist(Map<String, String> params);
	
	public void deletenewsitem(Map<String, String> params);
	
	public void deleteleibie(Map<String, String> params);
	
	public T0300NEWS querynewsitem(Map<String, String> params);
	
	public T0301NEWSTYPE querleibieitem(Map<String, String> params);
	
	public List<T0301NEWSTYPE> querysmalltypebyid(Map<String, String> params);
	
	public  List<T0300NEWS> queryNew(Map<String, String> params);
	
	public  List<BigInfo> querysmalllist(Map<String, String> params);
	
	public  List<BigInfo> querymap(Map<String, String> params);
	
	public  List<T0300NEWS> queryitembysmall(Map<String, String> params);
	
	public  List<T0300NEWS> queryLeiBie(Map<String, String> params);
	
	public  List<T0300NEWS> queryByBig(Map<String, String> params);
	
	public  T0300NEWS queryNewsDetail(Map<String, String> params);
	
	public void addpoint(Map<String, String> params);
	
	
	public  List<T0300NEWS> queryupdown(Map<String, String> params);
	
	public  List<T0300NEWS> queryPaiHang(Map<String, String> params);
	
	public void doaddbigtype(Map<String, String> params);
	
	public void doaddsmalltype(Map<String, String> params);
	public void editsmalltype(Map<String, String> params);
	

}
