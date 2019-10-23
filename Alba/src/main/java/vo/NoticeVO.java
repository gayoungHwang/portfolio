package vo;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {

	private int bno;
	private int kno;
	private String bname;//사업장명
	private int pay;
	private String timetotime; // 시간
	private String etc; // 상세내용
	private String typeoccup; // 직종
	private String period; // 기간
	private String dow; // 요일
	private String region; // 지역
	private String keyword1;
	private String keyword2;
	private String keyword3;
	private String deadline; //마감일
	private String mainimage; // alba Table에 정의된 field 명과 동일
	private MultipartFile mainimagef;// form의 input tag의 name과 동일

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getKno() {
		return kno;
	}
	public void setKno(int kno) {
		this.kno = kno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getTimetotime() {
		return timetotime;
	}
	public void setTimetotime(String timetotime) {
		this.timetotime = timetotime;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
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
	public String getDow() {
		return dow;
	}
	public void setDow(String dow) {
		this.dow = dow;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getKeyword3() {
		return keyword3;
	}
	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}
	public String getMainimage() {
		return mainimage;
	}
	public void setMainimage(String mainimage) {
		this.mainimage = mainimage;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public MultipartFile getMainimagef() {
		return mainimagef;
	}
	public void setMainimagef(MultipartFile mainimagef) {
		this.mainimagef = mainimagef;
	}
	@Override
	public String toString() {
		return "NoticeVO [bno=" + bno + ", kno=" + kno + ", bname=" + bname + ", pay=" + pay + ", timetotime="
				+ timetotime + ", etc=" + etc + ", typeoccup=" + typeoccup + ", period=" + period + ", dow=" + dow
				+ ", region=" + region + ", keyword1=" + keyword1 + ", keyword2=" + keyword2 + ", keyword3=" + keyword3
				+ ", mainimage=" + mainimage + ", deadline=" + deadline + ", mainimagef=" + mainimagef + "]";
	}

}