package business;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import vo.KingVO;
import vo.PageVO;

public interface KService {

   KingVO loginCheck(KingVO vo);
   KingVO login(String kid) throws Exception;
   ArrayList<KingVO> selectList();
   ArrayList<KingVO> pageList(PageVO pvo);
   KingVO selectOne(KingVO vo);
   int check_kid(String kid) throws Exception;
   int totalRowCount();
   int insertKing(KingVO vo) throws Exception;
   int insertKing(KingVO vo, HttpServletResponse response) throws Exception;
   int update(KingVO vo);
   int delete(KingVO vo);
   
   ArrayList<KingVO> search(PageVO pvo);
   
   //이메일 체크
   int kcheck_email(String email) throws Exception;
   void kcheck_email(String email, HttpServletResponse response) throws Exception;
   
   //아이디 찾기
   String find_kid(String email) throws Exception;
   String find_kid(HttpServletResponse response, String email) throws Exception;
  
   //비밀번호 찾기
   void find_kpw(HttpServletResponse response, KingVO vo) throws Exception;
   int update_kpw(KingVO vo) throws Exception;

   //회원 메일 인증
   String create_key() throws Exception;
   void send_mail(KingVO vo, String div) throws Exception;
   void approval_king(KingVO vo, HttpServletResponse response) throws Exception;

}