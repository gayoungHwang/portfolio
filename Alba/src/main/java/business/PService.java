package business;


import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import vo.PageVO;
import vo.PartimerVO;

public interface PService{

   PartimerVO loginCheck(PartimerVO vo);
   PartimerVO login(String pid) throws Exception;
   ArrayList<PartimerVO> selectList();
   ArrayList<PartimerVO> pageList(PageVO pvo);
   PartimerVO selectOne(PartimerVO vo);
   int check_pid(String pid) throws Exception;
   int totalRowCount();
   int insertPartimer(PartimerVO vo) throws Exception;
   int insertPartimer(PartimerVO vo, HttpServletResponse response) throws Exception;
   int update(PartimerVO vo);
   int delete(PartimerVO vo);
   
   ArrayList<PartimerVO> search(PageVO pvo);
   
   //이메일 체크
   int check_email(String email) throws Exception;
   void check_email(String email, HttpServletResponse response) throws Exception;
   
   //아이디 찾기
   String find_pid(String email)throws Exception;
   String find_pid(HttpServletResponse response, String email) throws Exception;
   
   //비밀번호 찾기
   void find_ppw(HttpServletResponse response, PartimerVO vo) throws Exception;
   int update_ppw(PartimerVO vo)throws Exception;
   
   //회원 메일 인증
   String create_key() throws Exception;
   //이메일 발송
   void send_mail(PartimerVO vo, String div) throws Exception;
   void approval_partimer(PartimerVO vo, HttpServletResponse response) throws Exception;
	
}