package mirim.hs.kr;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
			String sql = "INSERT INTO userTbl(id, pw, name, regDate, eventDate) VALUES(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			
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
	
	public void updateUser(String id, int point) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "UPDATE userTbl SET point = point + ?, eventDate = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
			pstmt.setString(3, id);
			
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
	
	public UserBean getUser(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserBean user = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM userTbl WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				user = new UserBean();
				user.setId(id);
				user.setName(rs.getString("name"));
				user.setPoint(rs.getInt("point"));
				user.setRegDate(rs.getTimestamp("regDate"));
				user.setEventDate(rs.getTimestamp("eventDate"));
			} // while
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) { try { rs.close(); } catch(Exception e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} }
		} // finally
		
		System.out.println("getUser : " + user);
		return user;
	} // getUser
	
	public void insertNote(NoteBean note) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO noteTbl(id, title, content, regDate, updateDate) VALUES(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, note.getId());
			pstmt.setString(2, note.getTitle());
			pstmt.setString(3, note.getContent());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			System.out.println("insertNote : " + note);
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
	} // insertNote
	
	public void updateNote(NoteBean note) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "UPDATE noteTbl SET title = ?, content = ?, updateDate = ? WHERE nno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, note.getTitle());
			pstmt.setString(2, note.getContent());
			pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(4, note.getNno());
			System.out.println("updateNote : " + note);
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
	} // insertNote
	
	public List<NoteBean> selectNotesWithId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoteBean> notes = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM noteTbl WHERE id = ? ORDER BY regDate DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoteBean note = new NoteBean();
				note.setNno(rs.getInt("nno"));
				note.setId(rs.getString("id"));
				note.setTitle(rs.getString("title"));
				note.setContent(rs.getString("content"));
				note.setRegDate(rs.getTimestamp("regDate"));
				note.setUpdateDate(rs.getTimestamp("updateDate"));
				
				notes.add(note);
			} // while
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) { try { rs.close(); } catch(Exception e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} }
		} // finally
		
		System.out.println("selectNotesWithId : " + notes.size());
		return notes;
	} // selectNotesWithId
	
	public NoteBean selectNote(int nno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoteBean noted = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM noteTbl WHERE nno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoteBean note = new NoteBean();
				note.setNno(rs.getInt("nno"));
				note.setId(rs.getString("id"));
				note.setTitle(rs.getString("title"));
				note.setContent(rs.getString("content"));
				note.setRegDate(rs.getTimestamp("regDate"));
				note.setUpdateDate(rs.getTimestamp("updateDate"));
				
				noted = note;
			} // while
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) { try { rs.close(); } catch(Exception e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} }
		} // finally
		
		System.out.println("selectNote : " + noted);
		return noted;
	} // selectNotesWithId
	
	public List<ProductBean> selectProductWithId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductBean> products = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT p.pno pno, ptype, pname, pvalue, point FROM buyTbl b, productTbl p WHERE b.id = ? AND p.pno = b.pno ORDER BY ptype";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean product = new ProductBean();
				product.setPno(rs.getInt("pno"));
				product.setPtype(rs.getString("ptype"));
				product.setPname(rs.getString("pname"));
				product.setPvalue(rs.getString("pvalue"));
				product.setPoint(rs.getInt("point"));
				
				products.add(product);
			} // while
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) { try { rs.close(); } catch(Exception e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} }
		} // finally
		
		System.out.println("selectProductsWithId : " + products.size());
		return products;
	} // selectProductsWithId
	
	public List<ProductBean> selectNoProductWithId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductBean> products = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT pno, ptype, pname, pvalue, point FROM productTbl WHERE pno NOT IN (SELECT pno FROM buyTbl WHERE id = ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean product = new ProductBean();
				product.setPno(rs.getInt("pno"));
				product.setPtype(rs.getString("ptype"));
				product.setPname(rs.getString("pname"));
				product.setPvalue(rs.getString("pvalue"));
				product.setPoint(rs.getInt("point"));
				
				products.add(product);
			} // while
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) { try { rs.close(); } catch(Exception e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} }
		} // finally
		
		System.out.println("selectNoProductsWithId : " + products.size());
		return products;
	} // selectNoProductsWithId
	
	public void insertOption(String id, int pno, int point) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO buyTbl VALUES(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pno);
			
			pstmt.executeUpdate();
			
			updatePoint(id, point);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
	} // insertOption
	
	public void updatePoint(String id, int point) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "UPDATE userTbl SET point = point - ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
	} // insertOption
	
	public void insertProduct(ProductBean product) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO productTbl(ptype, pname, pvalue, point) VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getPtype());
			pstmt.setString(2, product.getPname());
			pstmt.setString(3, product.getPvalue());
			pstmt.setInt(4, product.getPoint());
			
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
	} // insertOption
	
}
