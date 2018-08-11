package dao;
import java.util.List;
import java.util.Map;

//import cn.cmts.control.util.PageList;


/**
 * DAO 接口.
 * @author yangdx.
 *
 */
public interface UserDao { 
	/**
	 * 查询集合 无参数
	 */
	List queryForList(String sql);
	/**
	 * 查询List集合
	 * @param sql iBATIS xml中select的id
	 *  @param obj 查询参数
	 */
	List queryForList(String sql,Object obj) ;
	
	/**
	 * 查询单条数据
	 * @param sql iBATIS xml中select的id
	 * @param obj 查询参数
	 */
	Object queryForObject(String sql,Object obj);
	
	Object queryForObject(String sql);
	/**
	 * insert 方法
	 * @param sql iBATIS xml中select的id
	 * @param obj 查询参数
	 */
	Object save(String sql,Object obj);	
	
	/**
	 * batchUpdate 批量添加
	 * @param sql iBATIS xml中select的id
	 * @param list 添加参数集合
	 * @return
	 */
	int saveAll(String sql,List list);
	
	/**
	 * delete删除方法 返回主键
	 * @param sql iBATIS xml中select的id
	 * @param obj 查询参数
	 */
	Object delete(String sql,Object obj);
	/**
	 * update 修改方法
	 * @param sql iBATIS xml中select的id
	 * @param obj 修改参数
	 */
	int update(String sql ,Object obj);
	
	/**
	 * updateAll 批量修改
	 * @param sql iBATIS xml中select的id
	 * @param list 修改参数集合
	 * @return
	 */
	int updateAll(String sql,List list);
	
	/**
	 * 分页
	 * @param sql iBATIS xml中select的id
	 */
	//PageList findPage(String querySql, String countSql,Object obj,int page,int numPerPage);
	 /**
	  * insert 方法 返回对象类型
	  * @param sql iBATIS xml中select的id
	  * @param obj 查询参数
	  */
	 Object saveObject(String sql , Object obj);
	 
	 /**
	  * ibatis调用存储过程方法
	  * @param EXESENDLISTID
	  * @author lanzx
	  */
	 public void callProc(String EXESENDLISTID);

}
