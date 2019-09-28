package mirim.hs.kr;

public class ProductBean {
	private int pno;
	private String ptype;
	private String pname;
	private String pvalue;
	private int point;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public String getPvalue() {
		return pvalue;
	}
	public void setPvalue(String pvalue) {
		this.pvalue = pvalue;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return "ProductBean [pno=" + pno + ", ptype=" + ptype + ", pname=" + pname + ", pvalue=" + pvalue + ", point="
				+ point + "]";
	}
	
}
