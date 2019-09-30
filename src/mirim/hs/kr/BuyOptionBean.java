package mirim.hs.kr;

public class BuyOptionBean {
	private String id;
	private String ptype;
	private String pname;
	private int point;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return "BuyOptionBean [id=" + id + ", ptype=" + ptype + ", pname=" + pname + ", point=" + point + "]";
	}
	
}
