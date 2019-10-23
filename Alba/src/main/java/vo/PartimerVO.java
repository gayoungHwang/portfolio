package vo;


public class PartimerVO {
	private int pno;
	private String pid;
	private String ppw;
	private String pname;
	private int age;
	private String gender;
	private String phone;
	private String email;
	private String approval_status;
	private String approval_key;
	
	
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public String getApproval_key() {
		return approval_key;
	}
	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPpw() {
		return ppw;
	}
	public void setPpw(String ppw) {
		this.ppw = ppw;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "PartimerVO [pno=" + pno + ", pid=" + pid + ", ppw=" + ppw + ", pname=" + pname + ", age=" + age
				+ ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", approval_key=" + approval_key
				+ "]";
	}
	
	
	
	
}
