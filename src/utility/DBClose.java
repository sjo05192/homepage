package utility;

import java.sql.*;

public class DBClose {
	
	public static void close(Connection con){
		try {
			if(con != null)
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close (PreparedStatement pstmt, Connection con){
		try {
			if(pstmt != null)
			pstmt.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	
		try {	
			if(con != null)
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if(rs != null)
			rs.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try {
			if(pstmt != null)
			pstmt.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	
		try {	
			if(con != null)
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
