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
			String sql = "INSERT INTO userTbl(id, pw, name, regDate, eventDate, login) VALUES(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			
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
		
	} // updateUser
	
	public void updateLogin(String id, Timestamp login) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "UPDATE userTbl SET login = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setTimestamp(1, login);
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
				user.setLogin(rs.getTimestamp("login"));
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
			String sql = "INSERT INTO noteTbl(sno, id, title, content, regDate, updateDate) VALUES(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, note.getSno());
			pstmt.setString(2, note.getId());
			pstmt.setString(3, note.getTitle());
			pstmt.setString(4, note.getContent());
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
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
			String sql = "UPDATE noteTbl SET sno = ?, title = ?, content = ?, updateDate = ? WHERE nno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, note.getSno());
			pstmt.setString(2, note.getTitle());
			pstmt.setString(3, note.getContent());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(5, note.getNno());
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
			String sql = "SELECT * FROM noteTbl WHERE id = ? || sno IN (SELECT sno FROM scheduleTbl WHERE team LIKE ?) ORDER BY regDate DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "%" + id + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoteBean note = new NoteBean();
				note.setNno(rs.getInt("nno"));
				note.setSno(rs.getInt("sno"));
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
	
	public List<NoteBean> selectNotesWithSno(int sno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoteBean> notes = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM noteTbl WHERE sno = ? ORDER BY regDate DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoteBean note = new NoteBean();
				note.setNno(rs.getInt("nno"));
				note.setSno(rs.getInt("sno"));
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
				note.setSno(rs.getInt("sno"));
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
		
	} // updatePoint
	
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
	
	public void insertSchedule(ScheduleBean schedule) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO scheduleTbl(id, title, content, startDay, endDay, team, regDate, updateDate) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schedule.getId());
			pstmt.setString(2, schedule.getTitle());
			pstmt.setString(3, schedule.getContent());
			pstmt.setTimestamp(4, schedule.getStartDay());
			pstmt.setTimestamp(5, schedule.getEndDay());
			pstmt.setString(6, schedule.getTeam());
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
			
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
	} // insertSchedule
	
	public void updateSchedule(ScheduleBean schedule) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "UPDATE scheduleTbl SET title = ?, content = ?, startDay = ?, endDay = ?, team = ?, updateDate = ? WHERE sno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schedule.getTitle());
			pstmt.setString(2, schedule.getContent());
			pstmt.setTimestamp(3, schedule.getStartDay());
			pstmt.setTimestamp(4, schedule.getEndDay());
			pstmt.setString(5, schedule.getTeam());
			pstmt.setInt(6, schedule.getSno());
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			System.out.println("updateSchedule : " + schedule);
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} } 
		} // finally
		
	} // updateSchedule
	
	public ScheduleBean selectScheduleWithSno(int sno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ScheduleBean schedule = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM scheduleTbl WHERE sno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				schedule = new ScheduleBean();
				schedule.setSno(rs.getInt("sno"));
				schedule.setId(rs.getString("id"));
				schedule.setTitle(rs.getString("title"));
				schedule.setContent(rs.getString("content"));
				schedule.setStartDay(rs.getTimestamp("startDay"));
				schedule.setEndDay(rs.getTimestamp("endDay"));
				schedule.setTeam(rs.getString("team"));
			} // if
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) { try { rs.close(); } catch(Exception e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(conn != null) { try { conn.close(); } catch(Exception e) {} }
		} // finally
		
		System.out.println("selectSchedulesWithSno : " + schedule);
		return schedule;
	} // selectScheduleWithSno
	
	public List<ScheduleBean> selectScheduleWithId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ScheduleBean> schedules = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM scheduleTbl WHERE id = ? || team LIKE ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "%" + id + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ScheduleBean schedule = new ScheduleBean();
				schedule.setSno(rs.getInt("sno"));
				schedule.setId(rs.getString("id"));
				schedule.setTitle(rs.getString("title"));
				schedule.setContent(rs.getString("content"));
				schedule.setStartDay(rs.getTimestamp("startDay"));
				schedule.setEndDay(rs.getTimestamp("endDay"));
				schedule.setTeam(rs.getString("team"));
				
				schedules.add(schedule);
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
		
		System.out.println("selectSchedulesWithId : " + schedules.size());
		return schedules;
	} // selectScheduleWithId
	
	public List<ScheduleNoteBean> selectScheduleWithNote(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ScheduleNoteBean> schedules = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT s.sno, s.id, s.title, s.content, startDay, endDay, team, (SELECT COUNT(*) FROM noteTbl n WHERE n.sno = s.sno) notes FROM scheduleTbl s WHERE s.id = ? || s.team LIKE ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "%" + id + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ScheduleNoteBean schedule = new ScheduleNoteBean();
				schedule.setSno(rs.getInt("sno"));
				schedule.setId(rs.getString("id"));
				schedule.setTitle(rs.getString("title"));
				schedule.setContent(rs.getString("content"));
				schedule.setStartDay(rs.getTimestamp("startDay"));
				schedule.setEndDay(rs.getTimestamp("endDay"));
				schedule.setTeam(rs.getString("team"));
				schedule.setNotes(rs.getInt("notes"));
				
				schedules.add(schedule);
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
		
		System.out.println("selectSchedulesWithNote : " + schedules.size());
		return schedules;
	} // selectScheduleWithId
	
	public void insertIssue(IssueBean issue) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO issueTbl(nno, id, content, regDay) VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, issue.getNno());
			pstmt.setString(2, issue.getId());
			pstmt.setString(3, issue.getContent());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			
			System.out.println("insertIssue : " + issue);
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
	
	public List<IssueBean> selectIssues(int nno) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<IssueBean> issues = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM issueTbl WHERE nno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				IssueBean issue = new IssueBean();
				issue.setIno(rs.getInt("ino"));
				issue.setNno(rs.getInt("nno"));
				issue.setId(rs.getString("id"));
				issue.setContent(rs.getString("content"));
				issue.setRegDay(rs.getTimestamp("regDay"));
				
				issues.add(issue);
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
		
		System.out.println("selectIssues : " + issues.size());
		return issues;
	} // selectScheduleWithId
	
	// Dashboard용
	public List<ScheduleBean> selectScheduleForDashBoard(String id, Timestamp login, Timestamp now) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ScheduleBean> schedules = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM scheduleTbl WHERE (regDate between ? AND ? || updateDate between ? AND ?) AND team LIKE ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setTimestamp(1, login);
			pstmt.setTimestamp(2, now);
			pstmt.setTimestamp(3, login);
			pstmt.setTimestamp(4, now);
			pstmt.setString(5, "%" + id + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ScheduleBean schedule = new ScheduleBean();
				schedule.setSno(rs.getInt("sno"));
				schedule.setId(rs.getString("id"));
				schedule.setTitle(rs.getString("title"));
				schedule.setContent(rs.getString("content"));
				schedule.setStartDay(rs.getTimestamp("startDay"));
				schedule.setEndDay(rs.getTimestamp("endDay"));
				schedule.setTeam(rs.getString("team"));
				schedule.setRegDate(rs.getTimestamp("regDate"));
				schedule.setUpdateDate(rs.getTimestamp("updateDate"));
				
				schedules.add(schedule);
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
		
		System.out.println("selectSchedulesWithId : " + schedules.size());
		return schedules;
	} // selectScheduleWithId
	public List<NoteBean> selectNoteForDashBoard(String id, Timestamp login, Timestamp now) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoteBean> notes = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM noteTbl WHERE sno IN (SELECT sno FROM scheduleTbl WHERE team LIKE ?) && (regDate between ? AND ? || updateDate between ? AND ?) ORDER BY regDate DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setTimestamp(2, login);
			pstmt.setTimestamp(3, now);
			pstmt.setTimestamp(4, login);
			pstmt.setTimestamp(5, now);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoteBean note = new NoteBean();
				note.setNno(rs.getInt("nno"));
				note.setSno(rs.getInt("sno"));
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
		
		System.out.println("selectNoteForDashBoard : " + notes.size());
		return notes;
	} // selectNoteForDashBoard
	
	public List<IssueBean> selectIssuesForDashBoard(String id, Timestamp login, Timestamp now) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<IssueBean> issues = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM issueTbl WHERE regDay between ? AND ? && nno IN (SELECT nno FROM noteTbl WHERE sno IN (SELECT sno FROM scheduleTbl WHERE id = ? || team LIKE ?))";
			pstmt = conn.prepareStatement(sql);
			pstmt.setTimestamp(1, login);
			pstmt.setTimestamp(2, now);
			pstmt.setString(3, id);
			pstmt.setString(4, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				IssueBean issue = new IssueBean();
				issue.setIno(rs.getInt("ino"));
				issue.setNno(rs.getInt("nno"));
				issue.setId(rs.getString("id"));
				issue.setContent(rs.getString("content"));
				issue.setRegDay(rs.getTimestamp("regDay"));
				
				issues.add(issue);
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
		
		System.out.println("selectIssuesForDashBoard : " + issues.size());
		return issues;
	} // selectIssuesForDashBoard
	
}
