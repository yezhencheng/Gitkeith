package com.model;

/**
 * TYuyue generated by MyEclipse Persistence Tools
 */

public class TYuyue implements java.io.Serializable
{

	// Fields

	private Integer id;

	private Integer userId;

	private Integer yishengId;

	private String shijian;

	private String beizhu;
	
	private String yishengName;

	private String userName;
	// Constructors

	/** default constructor */
	public TYuyue()
	{
	}

	/** full constructor */
	public TYuyue(Integer userId, Integer yishengId, String shijian,
			String beizhu)
	{
		this.userId = userId;
		this.yishengId = yishengId;
		this.shijian = shijian;
		this.beizhu = beizhu;
	}

	// Property accessors

	public Integer getId()
	{
		return this.id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getYishengName()
	{
		return yishengName;
	}

	public void setYishengName(String yishengName)
	{
		this.yishengName = yishengName;
	}

	public Integer getUserId()
	{
		return this.userId;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public void setUserId(Integer userId)
	{
		this.userId = userId;
	}

	public Integer getYishengId()
	{
		return this.yishengId;
	}

	public void setYishengId(Integer yishengId)
	{
		this.yishengId = yishengId;
	}

	public String getShijian()
	{
		return this.shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

	public String getBeizhu()
	{
		return this.beizhu;
	}

	public void setBeizhu(String beizhu)
	{
		this.beizhu = beizhu;
	}

}