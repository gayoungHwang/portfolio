package business;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vo.PageVO;
import vo.PartimerVO;

@Service("partimer")
public class PServiceImpl implements PService {
   @Autowired
   private SqlSession dao ;
   private static final String NS ="green.mapper.PartimerMapper." ;
   
   @Autowired
   BCryptPasswordEncoder passwordEncoder ;
   
   @Override 
   public PartimerVO loginCheck(PartimerVO vo) {
      return dao.selectOne(NS+"loginPartimer", vo); 
   }
   
   public PartimerVO login(String pid) throws Exception{
     return dao.selectOne(NS+"login", pid);
   }
   
   @Override
   public ArrayList<PartimerVO> selectList() {
     return (ArrayList)dao.selectList(NS+"partimerlist");
   }
   
   @Override
     public ArrayList<PartimerVO> pageList(PageVO pvo) {
        return (ArrayList)dao.selectList(NS+"pageList",pvo);
   }
   
   @Override 
   public PartimerVO selectOne(PartimerVO vo) { 
     return dao.selectOne(NS+"selectDetail", vo); 
   }   
   
   public int check_pid(String pid) throws Exception{
      return dao.selectOne(NS+"check_pid", pid);
   }
   
   @Override
   public int totalRowCount() {
     return dao.selectOne(NS + "totalrowCount");
   }

   @Override
   public int insertPartimer(PartimerVO vo) throws Exception { 
     return dao.insert(NS+"insertPartimer",vo) ; 
   } 
   
   @Override
   public int insertPartimer(PartimerVO vo, HttpServletResponse response) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      
      if(check_pid(vo.getPid()) == 1) {
         out.println("<script>");
         out.println("alert('동일한 아이디가 있습니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return 0;
      }else if(check_email(vo.getEmail())==1) {
         out.println("<script>");
         out.println("alert('동일한 이메일이 있습니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return 0;
      }else {
         // 인증키 set
         vo.setApproval_key(create_key());
         insertPartimer(vo);
         send_mail(vo, "join");
         return 1;
      }
   }
   
   @Override
   public int update(PartimerVO vo) {
      return dao.update(NS+"updatePartimer",vo) ;
   }  
   
   @Override
   public int delete(PartimerVO vo) {
      return dao.delete(NS+"deletePartimer",vo) ;
   } 
  
   @Override
   public ArrayList<PartimerVO> search(PageVO pvo) {
     return (ArrayList)dao.selectList(NS + "searchList", pvo);
   }
   
   //이메일 체크
   public int check_email(String email) throws Exception {
      return dao.selectOne(NS+"check_email", email);
   }
   
   @Override
     public void check_email(String email, HttpServletResponse response) throws Exception {
        PrintWriter out = response.getWriter();
        out.println(check_email(email));
        out.close();
     }
   
   //아이디 찾기
   @Override
   public String find_pid(String email)throws Exception{
      return dao.selectOne(NS+"find_pid", email);
   }
   
   @Override
   public String find_pid(HttpServletResponse response, String email) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      String pid = find_pid(email);
      
      if (pid == null) {
         out.println("<script>");
         out.println("alert('가입된 아이디가 없습니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return null;
      } else {
         return pid;
      }
   }
  
   //비밀번호 찾기   
   @Override
   public void find_ppw(HttpServletResponse response, PartimerVO vo) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
         
      // 아이디가 없으면
      if(check_pid(vo.getPid()) == 0) {
         out.print("아이디가 없습니다.");
         out.close();
      }
      // 가입에 사용한 이메일이 아니면
      else if(!vo.getEmail().equals(login(vo.getPid()).getEmail())) {
         out.print("잘못된 이메일 입니다.");
         out.close();
      }else {
      // 임시 비밀번호 생성
         String pw = "";
         for (int i = 0; i < 12; i++) {
            pw += (char) ((Math.random() * 26) + 97);
         }
         vo.setPpw(pw);
        // 비밀번호 변경 메일 발송   
         send_mail(vo, "find_ppw");
         String encPassword = passwordEncoder.encode(vo.getPpw());
         vo.setPpw(encPassword);
         // 비밀번호 변경
         update_ppw(vo);
         
            
         out.print("이메일로 임시 비밀번호를 발송하였습니다.");
         out.close();
      }
   }

   @Transactional
   public int update_ppw(PartimerVO vo) throws Exception{
      return dao.update(NS+"update_ppw", vo);
   }
   
   //회원 메일 인증
   @Override
   public String create_key() throws Exception {
      String key = "";
      Random rd = new Random();

      for (int i = 0; i < 8; i++) {
         key += rd.nextInt(10);
      }
      return key;
   }
   
   // 이메일 발송
   @Override
   public void send_mail(PartimerVO vo, String div) throws Exception {
      // Mail Server 설정
      String charSet = "utf-8";
      String hostSMTP = "smtp.naver.com";
      String hostSMTPid = "leeyerim96@naver.com";
      String hostSMTPpwd = "ehdanf12";

      // 보내는 사람 EMail, 제목, 내용
      String fromEmail = "leeyerim96@naver.com";
      String fromName = "Alba Exit";
      String subject = "";
      String msg = "";
      
      if(div.equals("join")) {
         // 회원가입 메일 내용
         subject = "Spring Homepage 회원가입 인증 메일입니다.";
         msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
         msg += "<h3 style='color: blue;'>";
         msg += vo.getPid() + "님 회원가입을 환영합니다.</h3>";
         msg += "<div style='font-size: 130%'>";
         msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
         msg += "<form method='post' action='http://localhost:9090/green/approval_partimer'>";
         msg += "<input type='hidden' name='email' value='" + vo.getEmail() + "'>";
         msg += "<input type='hidden' name='approval_key' value='" + vo.getApproval_key() + "'>";
         msg += "<input type='submit' value='인증'></form><br/></div>";
      }
      else if(div.equals("find_ppw")) {
         subject = "AlbaExit 임시 비밀번호 입니다.";
         msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
         msg += "<h3 style='color: blue;'>";
         msg += vo.getPid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
         msg += "<p>임시 비밀번호 : ";
         msg += vo.getPpw() + "</p></div>";
      }
      
      // 받는 사람 E-Mail 주소
      String mail =vo.getEmail();
      try {
         HtmlEmail email = new HtmlEmail();
         email.setDebug(true);
         email.setCharset(charSet);
         email.setSSL(true);
         email.setHostName(hostSMTP);
         email.setSmtpPort(465);

         email.setAuthentication(hostSMTPid, hostSMTPpwd);
         email.setTLS(true);
         email.addTo(mail, charSet);
         email.setFrom(fromEmail, fromName, charSet);
         email.setSubject(subject);
         email.setHtmlMsg(msg);
         email.send();
      } catch (Exception e) {
         System.out.println("메일발송 실패 : " + e);
      }
   }
      
   @Transactional
   public int approval_partimer(PartimerVO vo) throws Exception{
       return dao.update(NS+"approval_partimer", vo);
   }
      
   @Override
   public void approval_partimer(PartimerVO vo, HttpServletResponse response) throws Exception {
       response.setContentType("text/html;charset=utf-8");
       PrintWriter out = response.getWriter();
       if (approval_partimer(vo) == 0) { // 이메일 인증에 실패하였을 경우
         out.println("<script>");
         out.println("alert('잘못된 접근입니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
       } else { // 이메일 인증을 성공하였을 경우
         out.println("<script>");
         out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
         out.println("location.href='home';");
            out.println("</script>");
         out.close();
       }
   }
}