package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TKeshiDAO;
import com.dao.TYishengDAO;
import com.model.TKeshi;
import com.model.TYisheng;
import com.opensymphony.xwork2.ActionSupport;

public class yishengAction extends ActionSupport
{
	private int yishengId;
	private String yishengName;
	private String yishengSex;
	private String yishengAge;
	private int keshiId;
	private String yishengJianjie;
	
	private String message;
	private String path;
	
	private TYishengDAO yishengDAO;
	private TKeshiDAO keshiDAO;
	
	public String yishengAdd()
	{
		TYisheng yisheng=new TYisheng();
		yisheng.setYishengName(yishengName);
		yisheng.setYishengSex(yishengSex);
		yisheng.setYishengAge(yishengAge);
		yisheng.setKeshiId(keshiId);
		yisheng.setYishengJianjie(yishengJianjie);
		yisheng.setDel("no");
		yishengDAO.save(yisheng);
		this.setMessage("操作成功");
		this.setPath("yishengMana.action");
		return "succeed";
	}
	
	public String yishengMana()
	{
		String sql="from TYisheng where del='no'";
		List yishengList=yishengDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<yishengList.size();i++)
		{
			TYisheng yisheng=(TYisheng)yishengList.get(i);
			yisheng.setKeshiName(keshiDAO.findById(yisheng.getKeshiId()).getKeshiAnme());
			
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yishengList", yishengList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yishengDel()
	{
		TYisheng yisheng=yishengDAO.findById(yishengId);
		yisheng.setDel("yes");
		yishengDAO.attachDirty(yisheng);
		this.setMessage("操作成功");
		this.setPath("yishengMana.action");
		return "succeed";
	}
	
	
	
	public String yishengEditPre()
	{
		TYisheng yisheng=yishengDAO.findById(yishengId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yisheng", yisheng);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yishengEdit()
	{
		TYisheng yisheng=yishengDAO.findById(yishengId);
		yisheng.setYishengName(yishengName);
		yisheng.setYishengSex(yishengSex);
		yisheng.setYishengAge(yishengAge);
		yisheng.setDel("no");
		yishengDAO.attachDirty(yisheng);
		this.setMessage("操作成功");
		this.setPath("yishengMana.action");
		return "succeed";
	}

	
	
	public String yishengAll()
	{
		String sql="from TYisheng where del='no' and keshiId="+keshiId;
		List yishengList=yishengDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yishengList", yishengList);
		return ActionSupport.SUCCESS;
	}
	public String getMessage()
	{
		return message;
	}

	public int getKeshiId()
	{
		return keshiId;
	}

	public void setKeshiId(int keshiId)
	{
		this.keshiId = keshiId;
	}

	public TKeshiDAO getKeshiDAO()
	{
		return keshiDAO;
	}

	public void setKeshiDAO(TKeshiDAO keshiDAO)
	{
		this.keshiDAO = keshiDAO;
	}

	public String getYishengJianjie()
	{
		return yishengJianjie;
	}

	public void setYishengJianjie(String yishengJianjie)
	{
		this.yishengJianjie = yishengJianjie;
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

	public String getYishengAge()
	{
		return yishengAge;
	}

	public void setYishengAge(String yishengAge)
	{
		this.yishengAge = yishengAge;
	}

	public TYishengDAO getYishengDAO()
	{
		return yishengDAO;
	}

	public void setYishengDAO(TYishengDAO yishengDAO)
	{
		this.yishengDAO = yishengDAO;
	}

	public int getYishengId()
	{
		return yishengId;
	}

	public void setYishengId(int yishengId)
	{
		this.yishengId = yishengId;
	}

	public String getYishengName()
	{
		return yishengName;
	}

	public void setYishengName(String yishengName)
	{
		this.yishengName = yishengName;
	}

	public String getYishengSex()
	{
		return yishengSex;
	}

	public void setYishengSex(String yishengSex)
	{
		this.yishengSex = yishengSex;
	}
	
}
