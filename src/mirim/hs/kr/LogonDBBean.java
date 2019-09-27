package mirim.hs.kr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LogonDBBean {
	
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		String url = "jdbc:mysql://localhost:3306/event";
		String user = "test";
		String pass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, user, pass);
		return conn;
	} // getConnection
	
	public void insertUser(UserBean user) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO userTbl VALUES(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
	} // insertUser
	
	public int idCheck(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT pw FROM userTbl WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = 1;
			}
			else {
				x = 0; 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) { try { rs.close(); } catch(Exception e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
		return x;
	} // idCheck
	
	public int userCheck(String id, String password) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		String dbpass = "";
		
		try {
			conn = getConnection();
			String sql = "SELECT pw FROM userTbl WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpass = rs.getString("pw");
				if(dbpass.equals(password)) {
					x = 1;
				}
				else {
					x = 0; 
				}
			}
			else {
				x = -1; 
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) { try { rs.close(); } catch(Exception e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
		return x;
	} // userCheck
	
}
