package mirim.hs.kr;

import java.sql.Timestamp;

public class ScheduleNoteBean {
	private int sno;
	private String id;
	private String title;
	private String content;
	private Timestamp startDay;
	private Timestamp endDay;
	private String team;
	private int notes;
	
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
	public int getNotes() {
		return notes;
	}
	public void setNotes(int notes) {
		this.notes = notes;
	}
	
	@Override
	public String toString() {
		return "ScheduleNoteBean [sno=" + sno + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", startDay=" + startDay + ", endDay=" + endDay + ", team=" + team + ", notes=" + notes + "]";
	}
	
}
