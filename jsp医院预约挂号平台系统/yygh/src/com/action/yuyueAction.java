package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TAdminDAO;
import com.dao.TUserDAO;
import com.dao.TYishengDAO;
import com.dao.TYuyueDAO;
import com.model.TAdmin;
import com.model.TUser;
import com.model.TYuyue;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class yuyueAction extends ActionSupport
{
	private int id;
	private int userId;
	private int yishengId;
	private String shijian;
	private String beizhu;
	 
	private String message;
	private String path;
	
	

	private TYuyueDAO yuyueDAO;
	private TYishengDAO yishengDAO;
	private TUserDAO userDAO;
	
	public String yuyueAdd()
	{
		Map session=ActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		TYuyue yuyue=new TYuyue();
		yuyue.setUserId(user.getUserId());
		yuyue.setYishengId(yishengId);
		yuyue.setShijian(shijian);
		yuyue.setBeizhu(beizhu);
		
		yuyueDAO.save(yuyue);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String yuyueManaMy()
	{
		Map session=ActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		String sql="from TYuyue where userId="+user.getUserId();
		List yuyueList=yuyueDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<yuyueList.size();i++)
		{
			TYuyue yuyue=(TYuyue)yuyueList.get(i);
			yuyue.setYishengName(yishengDAO.findById(yuyue.getYishengId()).getYishengName());
			
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yuyueList", yuyueList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yuyueMana()
	{
		Map session=ActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		String sql="from TYuyue";
		List yuyueList=yuyueDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<yuyueList.size();i++)
		{
			TYuyue yuyue=(TYuyue)yuyueList.get(i);
			yuyue.setYishengName(yishengDAO.findById(yuyue.getYishengId()).getYishengName());
			yuyue.setUserName(userDAO.findById(yuyue.getUserId()).getUserName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yuyueList", yuyueList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yuyueDelMy()
	{
		yuyueDAO.delete(yuyueDAO.findById(id));
		this.setMessage("取消成功");
		this.setPath("yuyueManaMy.action");
		return "succeed";
	}



	public String getBeizhu()
	{
		return beizhu;
	}



	public TUserDAO getUserDAO()
	{
		return userDAO;
	}



	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}



	public TYishengDAO getYishengDAO()
	{
		return yishengDAO;
	}



	public void setYishengDAO(TYishengDAO yishengDAO)
	{
		this.yishengDAO = yishengDAO;
	}



	public void setBeizhu(String beizhu)
	{
		this.beizhu = beizhu;
	}



	public int getId()
	{
		return id;
	}



	public void setId(int id)
	{
		this.id = id;
	}



	public String getMessage()
	{
		return message;
	}



	public void setMessage(String message)
	{
		this.message = message;
	}



	public String getPath()
	{
		return path;
	}



	public void setPath(String path)
	{
		this.path = path;
	}



	public String getShijian()
	{
		return shijian;
	}



	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}



	public int getUserId()
	{
		return userId;
	}



	public void setUserId(int userId)
	{
		this.userId = userId;
	}



	public int getYishengId()
	{
		return yishengId;
	}



	public void setYishengId(int yishengId)
	{
		this.yishengId = yishengId;
	}



	public TYuyueDAO getYuyueDAO()
	{
		return yuyueDAO;
	}



	public void setYuyueDAO(TYuyueDAO yuyueDAO)
	{
		this.yuyueDAO = yuyueDAO;
	}
	
}
