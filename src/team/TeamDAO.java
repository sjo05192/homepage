package team;

import java.sql.*;
import java.util.*;
import memo.MemoDTO;
import sun.dc.pr.PRError;
import utility.DBClose;
import utility.DBOpen;

public class TeamDAO {
	
	public boolean updateFile(Map map, int teamno){
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		int filename = (Integer)map.get("filename");
		StringBuffer sql = new StringBuffer();
		sql.append(" update TEAM ");
		sql.append(" set ");
		sql.append(" filename = ? ");
		sql.append(" where teamno = ? ");
		
		try{
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setLong(1, filename);
		pstmt.setInt(2, teamno);
		
		int cnt = pstmt.executeUpdate();
		if(cnt>0)flag = true;
		} catch (SQLException e){
		return flag;
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}

	public boolean delete(int teamno) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from team ");
		sql.append(" where teamno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, teamno);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}

	public boolean update(TeamDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" update team set phone = ?,  ");
		sql.append(" 					  zipcode = ?, ");
		sql.append(" 					  address1 = ?, ");
		sql.append(" 					  address2 = ?, ");
		sql.append(" 					  skill = ?, ");
		sql.append(" 					  hobby = ? ");
		// sql.append( " filename = ? " );
		sql.append(" where teamno = ?			 ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getZipcode());
			pstmt.setString(3, dto.getAddress1());
			pstmt.setString(4, dto.getAddress2());
			pstmt.setString(5, dto.getSkill());
			pstmt.setString(6, dto.getHobby());
			// pstmt.setString(7, dto.getFilename());
			pstmt.setInt(7, dto.getTeamno());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}

	public boolean create(TeamDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into team (teamno, name, gender, phone, zipcode, ");
		sql.append(" address1, address2, skill, hobby, filename) ");
		sql.append(" values ((select NVL(Max(teamno), 0) + 1 from team), ");
		sql.append(" ?, ?, ?, ?, ?, ?, ?, ?, '?' ) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress1());
			pstmt.setString(6, dto.getAddress2());
			pstmt.setString(7, dto.getSkill());
			pstmt.setString(8, dto.getHobby());
			pstmt.setString(9, dto.getFilename());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public TeamDTO read(int teamno) {
		TeamDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select * from team where teamno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, teamno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new TeamDTO();
				dto.setTeamno(rs.getInt("teamno"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setSkill(rs.getString("skill"));
				dto.setHobby(rs.getString("hobby"));
				dto.setFilename(rs.getString("filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}

	public int total(Map map){
		int total = 0;
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from team ");
		
		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%' ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();

			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return total;
	}
	
	public List<TeamDTO> list(Map map) {
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		List<TeamDTO> list = new ArrayList<TeamDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select teamno, name, phone, skill, r ");
		sql.append(" from( ");
		sql.append(" 	select teamno, name, phone, skill, rownum as r  ");
		sql.append(" 	from( ");
		sql.append(" 		select teamno, name, phone, skill, filename ");
		sql.append("		from team ");
		
		if (word.trim().length() > 0)
			sql.append(" 	where " + col + " like '%'||?||'%' ");
		sql.append(" 		order by teamno desc ");
		sql.append(" 	) ");
		sql.append(" )where r>=1 and r<=3 ");
		
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeamDTO dto = new TeamDTO();
				dto.setTeamno(rs.getInt("Teamno"));
				dto.setName(rs.getString("Name"));
				dto.setPhone(rs.getString("Phone"));
				dto.setSkill(rs.getString("Skill"));
				dto.setFilename(rs.getString("filename"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;
	}
}
