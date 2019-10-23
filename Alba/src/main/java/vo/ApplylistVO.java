package vo;

import org.springframework.web.multipart.MultipartFile;

public class ApplylistVO {

	private int ano;
	private int kno;
	private int userno;
	private int bno; 
	private String subd; //제출날짜
	private int pno;
	private int pay;
	private String dow; //요일
	private String typeoccup; //직종
	private String period; //기간
	private String timetotime; //시간
	private String region; //주소
	private String bname;
	private String pname;
	private int age;
	private String gender;
	private String phone;
	private String passcheck;
	private String mainimage; // alba Table에 정의된 field 명과 동일
	private MultipartFile mainimagef;// form의 input tag의 name과 동일
	private String deadline;
	private String fCode;
	
	
	public String getfCode() {
		return fCode;
	}
	public void setfCode(String fCode) {
		this.fCode = fCode;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getMainimage() {
		return mainimage;
	}
	public void setMainimage(String mainimage) {
		this.mainimage = mainimage;
	}
	public MultipartFile getMainimagef() {
		return mainimagef;
	}
	public void setMainimagef(MultipartFile mainimagef) {
		this.mainimagef = mainimagef;
	}
	public String getPasscheck() {
		return passcheck;
	}
	public void setPasscheck(String passcheck) {
		this.passcheck = passcheck;
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
	public String getBname() {
		return bname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getKno() {
		return kno;
	}
	public void setKno(int kno) {
		this.kno = kno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getSubd() {
		return subd;
	}
	public void setSubd(String subd) {
		this.subd = subd;
	}

	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getDow() {
		return dow;
	}
	public void setDow(String dow) {
		this.dow = dow;
	}
	public String getTypeoccup() {
		return typeoccup;
	}
	public void setTypeoccup(String typeoccup) {
		this.typeoccup = typeoccup;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getTimetotime() {
		return timetotime;
	}
	public void setTimetotime(String timetotime) {
		this.timetotime = timetotime;
	}

	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	@Override
	public String toString() {
		return "ApplylistVO [ano=" + ano + ", kno=" + kno + ", userno=" + userno + ", bno=" + bno + ", subd=" + subd
				+ ", pno=" + pno + ", pay=" + pay + ", dow=" + dow + ", typeoccup=" + typeoccup + ", period=" + period
				+ ", timetotime=" + timetotime + ", region=" + region + ", bname=" + bname + ", pname=" + pname
				+ ", age=" + age + ", gender=" + gender + ", phone=" + phone + ", passcheck=" + passcheck
				+ ", mainimage=" + mainimage + ", mainimagef=" + mainimagef + ", deadline=" + deadline + ", fCode="
				+ fCode + "]";
	}
	
	
	






}