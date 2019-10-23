package vo;

public class ReservationVO {
	private int rno;
	private int pno;
	private int ano;
	private int kno;
	private String phone;
	private String writing;
	private String state;
	private String day;
	private String rtime;
	private String pname;
	private String bname;
	
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getKno() {
		return kno;
	}
	public void setKno(int kno) {
		this.kno = kno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	public String getWriting() {
		return writing;
	}
	public void setWriting(String writing) {
		this.writing = writing;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	@Override
	public String toString() {
		return "ReservationVO [rno=" + rno + ", pno=" + pno + ", ano=" + ano + ", kno=" + kno + ", writing=" + writing
				+ ", state=" + state + ", day=" + day + ", rtime=" + rtime + ", pname=" + pname + ", bname=" + bname
				+ "]";
	}
	
}
