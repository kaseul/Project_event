package mirim.hs.kr;

import java.sql.Timestamp;

public class NoteBean {
	private int nno;
	private int sno;
	private String id;
	private String title;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "NoteBean [nno=" + nno + ", id=" + id + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", updateDate=" + updateDate + "]";
	}
	
}
