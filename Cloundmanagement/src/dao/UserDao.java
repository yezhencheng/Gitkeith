package dao;
import java.util.List;
import java.util.Map;

//import cn.cmts.control.util.PageList;


/**
 * DAO �ӿ�.
 * @author yangdx.
 *
 */
public interface UserDao { 
	/**
	 * ��ѯ���� �޲���
	 */
	List queryForList(String sql);
	/**
	 * ��ѯList����
	 * @param sql iBATIS xml��select��id
	 *  @param obj ��ѯ����
	 */
	List queryForList(String sql,Object obj) ;
	
	/**
	 * ��ѯ��������
	 * @param sql iBATIS xml��select��id
	 * @param obj ��ѯ����
	 */
	Object queryForObject(String sql,Object obj);
	
	Object queryForObject(String sql);
	/**
	 * insert ����
	 * @param sql iBATIS xml��select��id
	 * @param obj ��ѯ����
	 */
	Object save(String sql,Object obj);	
	
	/**
	 * batchUpdate �������
	 * @param sql iBATIS xml��select��id
	 * @param list ��Ӳ�������
	 * @return
	 */
	int saveAll(String sql,List list);
	
	/**
	 * deleteɾ������ ��������
	 * @param sql iBATIS xml��select��id
	 * @param obj ��ѯ����
	 */
	Object delete(String sql,Object obj);
	/**
	 * update �޸ķ���
	 * @param sql iBATIS xml��select��id
	 * @param obj �޸Ĳ���
	 */
	int update(String sql ,Object obj);
	
	/**
	 * updateAll �����޸�
	 * @param sql iBATIS xml��select��id
	 * @param list �޸Ĳ�������
	 * @return
	 */
	int updateAll(String sql,List list);
	
	/**
	 * ��ҳ
	 * @param sql iBATIS xml��select��id
	 */
	//PageList findPage(String querySql, String countSql,Object obj,int page,int numPerPage);
	 /**
	  * insert ���� ���ض�������
	  * @param sql iBATIS xml��select��id
	  * @param obj ��ѯ����
	  */
	 Object saveObject(String sql , Object obj);
	 
	 /**
	  * ibatis���ô洢���̷���
	  * @param EXESENDLISTID
	  * @author lanzx
	  */
	 public void callProc(String EXESENDLISTID);

}
