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
			// 批量操作执行
			getSqlMapClientTemplate().getSqlMapClient().executeBatch();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag = 0;
			logger.info("批量添加方法异常:" + e.getMessage());
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
			// 批量操作执行
			getSqlMapClientTemplate().getSqlMapClient().executeBatch();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			flag = 0;
			logger.info("批量修改方法异常:" + e.getMessage());
		}
		return flag;
	}

	/*
	 * querySql 查询信息的语句 countSql 查询个数的语句 obj 返回类型 page 页数 numPerPage 每页显示个数
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
	// // 查询总数量
	// String count = (String) getSqlMapClientTemplate().queryForObject(
	// countSql, obj);
	// // 设置参数.
	// Long sum = Long.valueOf(count);
	// pageList.setObjectsum(sum);
	// // 进行分页计算.
	// pageList.count();
	// // 创建查询.
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
