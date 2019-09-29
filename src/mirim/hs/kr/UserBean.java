package mirim.hs.kr;

import java.sql.Timestamp;

public class UserBean {
	private String id;
	private String pw;
	private String name;
	private int point;
	private Timestamp regDate;
	private Timestamp eventDate;
	private Timestamp login;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Timestamp getEventDate() {
		return eventDate;
	}
	public void setEventDate(Timestamp eventDate) {
		this.eventDate = eventDate;
	}
	public Timestamp getLogin() {
		return login;
	}
	public void setLogin(Timestamp login) {
		this.login = login;
	}
	
	@Override
	public String toString() {
		return "UserBean [id=" + id + ", pw=" + pw + ", name=" + name + ", point=" + point + ", regDate=" + regDate
				+ ", eventDate=" + eventDate + ", login=" + login + "]";
	}
	
}
