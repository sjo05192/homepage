package jointest;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

public class JointestDAO {

	public EmpDTO oneToOne(int empno, SqlMapClient sqlMapClient) throws Exception {
		// TODO Auto-generated method stub
		return (EmpDTO)sqlMapClient.queryForObject("jointest.oneToOne", empno);
	}

	public List oneToOneList(SqlMapClient sqlMapClient) throws Exception {
		// TODO Auto-generated method stub
		return sqlMapClient.queryForList("jointest.oneToOneList");
	}

	public DeptDTO oneToMany(int deptno, SqlMapClient sqlMapClient) throws Exception {
		// TODO Auto-generated method stub
		return (DeptDTO)sqlMapClient.queryForObject("jointest.oneToMany", deptno);
	}

}
