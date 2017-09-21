package image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class ImageDAO {
	
	public List<ImageDTO> readImg(int imageno){
		List list = new ArrayList();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(imageno,2)     over (order by imageno) pre_imgno2,   ");
		sql.append("          lag(imageno,1)     over (order by imageno ) pre_imgno1,  ");
		sql.append("          imageno, ");
		sql.append("          lead(imageno,1)    over (order by imageno) nex_imgno1,   ");
		sql.append("          lead(imageno,2)    over (order by imageno) nex_imgno2,   ");
		sql.append("          lag(fname,2)  over (order by imageno) pre_file2,    ");
		sql.append("          lag(fname,1)  over (order by imageno ) pre_file1, ");
		sql.append("          fname,  ");
		sql.append("          lead(fname,1) over (order by imageno) nex_file1, ");
		sql.append("          lead(fname,2) over (order by imageno) nex_file2  ");
		sql.append("          from (  ");
		sql.append("               SELECT imageno, fname   ");
		sql.append("               FROM image ");
		sql.append("               ORDER BY imageno DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE imageno = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				int[] arrNo = {rs.getInt("pre_imgno2"),rs.getInt("pre_imgno1"),
						rs.getInt("imageno"),rs.getInt("nex_imgno1"),rs.getInt("nex_imgno2")
				};
				String[] fileName = {rs.getString("pre_file2"),rs.getString("pre_file1"),
						rs.getString("fname"),rs.getString("nex_file1"),rs.getString("nex_file2")
				};
				list.add(arrNo);
				list.add(fileName);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return list;
	}
	public List<ImageDTO> list(Map<String,Object> map) {
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		List<ImageDTO> list = new ArrayList<ImageDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select imageno, pname, title,content,passwd,wdate,grpno,indent,ansnum,fname,r ");
		sql.append(" from( ");
		sql.append(" 	select imageno, pname, title,content,passwd,wdate,grpno,indent,ansnum,fname,rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select imageno, pname, title,content,passwd,wdate,grpno,indent,ansnum,fname ");
		sql.append(" 		from image ");
		if(word.trim().length() > 0){
			sql.append(" 	where "+col+" like '%'||?||'%' ");
		}
		sql.append(" 		order by grpno desc ,ansnum asc ");
		sql.append(" 	) ");
		sql.append(" )where r >= ? and r < = ? ");
		
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ImageDTO dto = new ImageDTO();
				dto.setImageno(rs.getInt("imageno"));
				dto.setPname(rs.getString("pname"));
				dto.setFname(rs.getString("fname"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				list.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return list;
	}
	public int total(Map<String,Object> map){
		int total = 0;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from image ");
		if(word.trim().length() > 0){
			sql.append(" where "+col+" like'%'||?||'%' ");
		}
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length() > 0){
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return total;
	}
	public boolean create(ImageDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into image ");
		sql.append(" (imageno,pname,title,content,passwd,wdate,fname,grpno) ");
		sql.append(" values ");
		sql.append(" ((select NVL(Max(imageno),0)+1 as imageno from image), ");
		sql.append(" ?,?,?,?,sysdate,?, ");
		sql.append(" (select NVL(Max(grpno),0)+1 as grpno from image)) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFname());

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
	//---
	

		
		
	//----사진업로드
	
	public boolean passwdCheck(Map map){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(imageno) ");
		sql.append(" from image ");
		sql.append(" where imageno = ? and passwd = ? ");

		int imageno = (Integer) map.get("imageno");
		String passwd = (String) map.get("passwd");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}
	
		
		
	
	public boolean updateFile(Map map) { // 아이디와 fname 2개 넣을것. 2개 이상은 무조건 맵에
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		String fname = (String) map.get("fname");
		int imageno = (int) map.get("imageno");
		StringBuffer sql = new StringBuffer();
		sql.append(" update image ");
		sql.append(" set fname = ? ");
		sql.append(" where imageno = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setInt(2, imageno);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}
	public boolean replyCreate(ImageDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into image(imageno, title, content,  ");
		sql.append(" wdate,grpno,indent,ansnum,refnum,fname,pname,passwd) ");
		sql.append(" values((select NVL(Max(imageno),0)+1 as imageno from image),?,?,sysdate,?,?,?,?,?,?,?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getGrpno());
			pstmt.setInt(4, dto.getIndent()+1);
			pstmt.setInt(5, dto.getAnsnum()+1);
			pstmt.setInt(6, dto.getImageno());
			pstmt.setString(7, dto.getFname());
			pstmt.setString(8, dto.getPname());
			pstmt.setString(9, dto.getPasswd());
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public ImageDTO replyRead(int imageno){
		ImageDTO dto =  null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select imageno, title, grpno, indent, ansnum,fname,pname ");
		sql.append(" from image ");
		sql.append(" where imageno=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new ImageDTO();
				dto.setImageno(rs.getInt("imageno"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFname(rs.getString("fname"));
				dto.setPname(rs.getString("pname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
	public void upAnsnum(Map map){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update image ");
		sql.append(" set ansnum = ansnum+1 ");
		sql.append(" where grpno = ? and ansnum>? ");
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
	}
	
	
	
	public boolean getRefnum(int imageno){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from image ");
		sql.append(" where refnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}
	//---------------------------------------re
	
	
	public boolean delete(int imageno) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from image ");
		sql.append(" where imageno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);

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
	
	public boolean update(ImageDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update IMAGE set ");
		sql.append(" title = ?, ");
		sql.append(" content=?, ");
		sql.append("  pname = ? ");
		sql.append(" where imageno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPname());
			pstmt.setInt(4, dto.getImageno());

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
	
	public ImageDTO read(int imageno) {
		ImageDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from image ");
		sql.append(" where imageno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new ImageDTO();
				dto.setImageno(rs.getInt("imageno"));
				dto.setPname(rs.getString("pname"));
				dto.setFname(rs.getString("fname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}
	

}
