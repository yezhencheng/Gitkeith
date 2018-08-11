package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Power;
import com.entity.RoleInfo;
import com.entity.T0301NEWSTYPE;
import com.entity.User;

public interface IUserDao {
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<User> selectkey();
	
	public void save(Map<String,String> people);
	public void savepower(Map<String,String> power);
	public void saverolemain(Map<String,String> power);
	public void saveroledetail(Map<String,String> power);
	
	public void deleterolebyuserid(Map<String,String> power);
	public void saveuserrole(Map<String,String> power);
	
	public List<User> isuserexist(Map<String,String> people);
	
	public User showuser(Map<String,String> people);
	
	public List<RoleInfo> queryrolelist(Map<String,String> people);
	
	public List<RoleInfo> chooserolelist(Map<String,String> people);
	
	public List<Power> ispowerfatherexist(Map<String,String> power);
	public List<RoleInfo> rolelistinfo(Map<String,String> power);
	
	public RoleInfo rolebyid(Map<String,String> power);
	public List<Power> powerbyid(Map<String,String> power);
	
	public Power powerModelById(Map<String,String> power);
	
	public List<Power> queryfather(Map<String,String> power);
	
	public  List<User> findlist(Map<String,String> people);
	public  List<Power> findpowerlist(Map<String,String> Power);
	public List<RoleInfo> findpowerbyleave(Map<String,String> Power);
	public List<Power> findchildbyleave(Map<String,String> Power);
	
	public User findModel(Map<String,String> people);
	public Power findPowerModel(Map<String,String> people);
	public void updateModel(Map<String,String> people);
	public void updatepowerModel(Map<String,String> power);
	
	public void deleteuser(Map<String,String> people);
	public void deletepowerbyid(Map<String,String> people);
	public void deleterolemain(Map<String,String> people);
	public void deleteroledetail(Map<String,String> people);
	public void updaterolemain(Map<String,String> people);
}
