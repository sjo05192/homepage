package jointest;

import java.util.List;

import sqlmap.GetSqlMapClient;

import com.ibatis.sqlmap.client.SqlMapClient;

public class JointestMgr {
	private static JointestDAO dao;
	private static SqlMapClient sqlMapClient;
	
	static{
		dao = new JointestDAO();
		sqlMapClient = GetSqlMapClient.get();
	}
	
	public EmpDTO oneToOne(int empno){
		EmpDTO dto = null;
		try{
			dto = dao.oneToOne(empno,sqlMapClient);
		}catch(Exception e){
			System.out.println(e);
		}
		return dto;
	}
	
	public List oneToOneList(){
		List list = null;
		try{
			list = dao.oneToOneList(sqlMapClient);
		}catch(Exception e){
			System.out.println(e);
		}
		return list;
	}
	
	public DeptDTO oneToMany(int deptno){
		DeptDTO dto = null;
		try{
			dto = dao.oneToMany(deptno,sqlMapClient);
		}catch(Exception e){
			System.out.println(e);
		}
		return dto;
	}
	
	
	
}
