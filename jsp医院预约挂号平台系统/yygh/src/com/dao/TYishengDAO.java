package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYisheng;

/**
 * Data access object (DAO) for domain model class TYisheng.
 * 
 * @see com.model.TYisheng
 * @author MyEclipse Persistence Tools
 */

public class TYishengDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYishengDAO.class);

	// property constants
	public static final String YISHENG_NAME = "yishengName";

	public static final String YISHENG_SEX = "yishengSex";

	public static final String YISHENG_AGE = "yishengAge";

	public static final String YISHENG_JIANJIE = "yishengJianjie";

	public static final String KESHI_ID = "keshiId";

	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYisheng transientInstance)
	{
		log.debug("saving TYisheng instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TYisheng persistentInstance)
	{
		log.debug("deleting TYisheng instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TYisheng findById(java.lang.Integer id)
	{
		log.debug("getting TYisheng instance with id: " + id);
		try
		{
			TYisheng instance = (TYisheng) getHibernateTemplate().get(
					"com.model.TYisheng", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYisheng instance)
	{
		log.debug("finding TYisheng instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TYisheng instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TYisheng as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByYishengName(Object yishengName)
	{
		return findByProperty(YISHENG_NAME, yishengName);
	}

	public List findByYishengSex(Object yishengSex)
	{
		return findByProperty(YISHENG_SEX, yishengSex);
	}

	public List findByYishengAge(Object yishengAge)
	{
		return findByProperty(YISHENG_AGE, yishengAge);
	}

	public List findByYishengJianjie(Object yishengJianjie)
	{
		return findByProperty(YISHENG_JIANJIE, yishengJianjie);
	}

	public List findByKeshiId(Object keshiId)
	{
		return findByProperty(KESHI_ID, keshiId);
	}

	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TYisheng instances");
		try
		{
			String queryString = "from TYisheng";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYisheng merge(TYisheng detachedInstance)
	{
		log.debug("merging TYisheng instance");
		try
		{
			TYisheng result = (TYisheng) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TYisheng instance)
	{
		log.debug("attaching dirty TYisheng instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TYisheng instance)
	{
		log.debug("attaching clean TYisheng instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TYishengDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYishengDAO) ctx.getBean("TYishengDAO");
	}
}