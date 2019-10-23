package vo;

public class CpboardVO {
   private int seq;
   private String title;
   private int pno;
   private String content; //글내용
   private int cnt; //조회수
   private String regdate; //작성날짜
   private String pid;
   private int mcnt;
   
   public int getMcnt() {
      return mcnt;
   }
   public void setMcnt(int mcnt) {
      this.mcnt = mcnt;
   }
   public String getPid() {
      return pid;
   }
   public void setPid(String pid) {
      this.pid = pid;
   }
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public int getPno() {
      return pno;
   }
   public void setPno(int pno) {
      this.pno = pno;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public int getCnt() {
      return cnt;
   }
   public void setCnt(int cnt) {
      this.cnt = cnt;
   }
   public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   @Override
   public String toString() {
      return "CpboardVO [seq=" + seq + ", title=" + title + ", pno=" + pno + ", content=" + content + ", cnt=" + cnt
            + ", regdate=" + regdate + ", pid=" + pid + ", mcnt=" + mcnt + "]";
   }


   

   
   
}