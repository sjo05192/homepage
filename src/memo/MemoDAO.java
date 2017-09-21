package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import sqlmap.GetSqlMapClient;
import utility.DBClose;
import utility.DBOpen;

public class MemoDAO {

	private static SqlMapClient sqlMapClient;

	static {

		sqlMapClient = GetSqlMapClient.get();
	}

	public boolean getRefnum(int memono) throws SQLException {
		boolean flag = false;
		int cnt = (Integer) sqlMapClient.queryForObject("memo.getRefnum", memono);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean replyCreate(MemoDTO dto) throws SQLException {
		boolean flag = false;
		int cnt = sqlMapClient.update("memo.replyCreate", dto);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public void upAnsnum(Map map) throws SQLException{
		sqlMapClient.update("memo.upAnsnum",map);
		}

	public MemoDTO replyRead(int memono) throws SQLException{
		return (MemoDTO)sqlMapClient.queryForObject("memo.replyRead", memono);
		}

	public boolean delete(int memono) throws SQLException {
		boolean flag = false;
		int cnt = sqlMapClient.delete("memo.delete", memono);
		if (cnt > 0)
			flag = true;
		System.out.println(flag);
		return flag;
	}

	public boolean update(MemoDTO dto) throws SQLException {
		boolean flag = false;
		int cnt = (Integer) sqlMapClient.update("memo.update", dto);
		if (cnt > 0)
			flag = true;
		System.out.println(flag);
		return flag;
	}

	public boolean create(MemoDTO dto) throws SQLException {
		boolean flag = false;
		int cnt = (Integer) sqlMapClient.update("memo.create", dto);
		if (cnt > 0)
			flag = true;
		System.out.println(flag);
		return flag;
	}

	public void upviewcnt(int memono) throws SQLException {
		sqlMapClient.update("memo.upviewcnt", memono);
	}

	public MemoDTO read(int memono) throws SQLException {
		return (MemoDTO) sqlMapClient.queryForObject("memo.read", memono);
	}

	public List<MemoDTO> list(Map map) throws SQLException {
		return sqlMapClient.queryForList("memo.list", map);
	}

	public int total(Map map) throws SQLException {
		return (Integer) sqlMapClient.queryForObject("memo.total", map);
	}
}
