package vo;

public class KingVO {

	private int kno;
	private String kid;
	private String kpw;
	private String kname;
	private String bname; //업장명
	private String bNumber; //사업자번호
	private String addr; //주소
	private String email;
	private String approval_key;
	private String approval_status;


	public String getApproval_key() {
		return approval_key;
	}
	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public int getKno() {
		return kno;
	}
	public void setKno(int kno) {
		this.kno = kno;
	}
	public String getKid() {
		return kid;
	}
	public void setKid(String kid) {
		this.kid = kid;
	}
	public String getKpw() {
		return kpw;
	}
	public void setKpw(String kpw) {
		this.kpw = kpw;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getbNumber() {
		return bNumber;
	}
	public void setbNumber(String bNumber) {
		this.bNumber = bNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "KingVO [kno=" + kno + ", kid=" + kid + ", kpw=" + kpw + ", kname=" + kname + ", bname=" + bname
				+ ", bNumber=" + bNumber + ", addr=" + addr + ", email=" + email + ", approval_key=" + approval_key
				+ ", approval_status=" + approval_status + "]";
	}




}