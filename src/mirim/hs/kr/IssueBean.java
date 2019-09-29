package mirim.hs.kr;

import java.sql.Timestamp;

public class IssueBean {
	private int ino;
	private int nno;
	private String id;
	private String content;
	private Timestamp regDay;
	
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegDay() {
		return regDay;
	}
	public void setRegDay(Timestamp regDay) {
		this.regDay = regDay;
	}
	
	@Override
	public String toString() {
		return "IssueBean [ino=" + ino + ", nno=" + nno + ", id=" + id + ", content=" + content + ", regDay=" + regDay
				+ "]";
	}
	
}
