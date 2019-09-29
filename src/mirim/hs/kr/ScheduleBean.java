package mirim.hs.kr;

import java.sql.Timestamp;

public class ScheduleBean {
	private int sno;
	private String id;
	private String title;
	private String content;
	private Timestamp startDay;
	private Timestamp endDay;
	private String team;
	private Timestamp regDate;
	private Timestamp updateDate;
	
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
	public Timestamp getStartDay() {
		return startDay;
	}
	public void setStartDay(Timestamp startDay) {
		this.startDay = startDay;
	}
	public Timestamp getEndDay() {
		return endDay;
	}
	public void setEndDay(Timestamp endDay) {
		this.endDay = endDay;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
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
		return "ScheduleBean [sno=" + sno + ", id=" + id + ", title=" + title + ", content=" + content + ", startDay="
				+ startDay + ", endDay=" + endDay + ", team=" + team + ", regDate=" + regDate + ", updateDate="
				+ updateDate + "]";
	}
	
}
