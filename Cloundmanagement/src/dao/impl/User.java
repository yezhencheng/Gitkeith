package dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import dao.UserDao;



public class User extends SqlMapClientDaoSupport implements UserDao {

	public List queryForList(String sql, Object obj) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().queryForList(sql, obj);
	}

	public Object queryForObject(String sql, Object obj) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().queryForObject(sql, obj);
	}

	public Object queryForObject(String sql) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().queryForObject(sql, null);
	}

	public Object save(String sql, Object obj) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().insert(sql, obj);
	}

	public int saveAll(String sql, List objList) {
		int flag = 0;
		try {
			getSqlMapClientTemplate().getSqlMapClient().startBatch();
			for (Object obj : objList) {
				getSqlMapClientTemplate().getSqlMapClient().insert(sql, obj);
				flag++;
			}
			// ��������ִ��
			getSqlMapClientTemplate().getSqlMapClient().executeBatch();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag = 0;
			logger.info("������ӷ����쳣:" + e.getMessage());
			e.printStackTrace();
		}
		return flag;
	}

	public Object delete(String sql, Object obj) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().delete(sql, obj);
	}

	public int update(String sql, Object obj) {
		// TODO Auto-generated method stub
		return getSqlMapClientTemplate().update(sql, obj);
	}

	public int updateAll(String sql, List objList) {
		int flag = 0;
		try {
			getSqlMapClientTemplate().getSqlMapClient().startBatch();
			for (Object obj : objList) {
				getSqlMapClientTemplate().getSqlMapClient().update(sql, obj);
				flag++;
			}
			// ��������ִ��
			getSqlMapClientTemplate().getSqlMapClient().executeBatch();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag = 0;
			logger.info("�����޸ķ����쳣:" + e.getMessage());
		}
		return flag;
	}

	/*
	 * querySql ��ѯ��Ϣ����� countSql ��ѯ��������� obj �������� page ҳ�� numPerPage ÿҳ��ʾ����
	 */
	// public PageList findPage(String querySql, String countSql, Object obj,
	// int page, int numPerPage) {
	// // TODO Auto-generated method stub
	// PageList pageList = new PageList();
	// System.out.println(page);
	// pageList.setPage(page);
	//
	// pageList.setNumPerPage(numPerPage);
	// try {
	// // ��ѯ������
	// String count = (String) getSqlMapClientTemplate().queryForObject(
	// countSql, obj);
	// // ���ò���.
	// Long sum = Long.valueOf(count);
	// pageList.setObjectsum(sum);
	// // ���з�ҳ����.
	// pageList.count();
	// // ������ѯ.
	// List list = getSqlMapClientTemplate().queryForList(querySql, obj,
	// (page - 1) * numPerPage, numPerPage);
	// pageList.setObjects(list);
	//
	// } catch (Throwable e) {
	// e.printStackTrace();
	// }
	// return pageList;
	// }

	public List queryForList(String sql) {

		return getSqlMapClientTemplate().queryForList(sql, null);
	}

	public Object saveObject(String sql, Object obj) {
		return getSqlMapClientTemplate().insert(sql, obj);
	}

	public void callProc(String exesendlistid) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("exesendlistid", exesendlistid);

		this.getSqlMapClientTemplate().queryForObject("insertNameByProcedure",
				paramMap);
	}
}
