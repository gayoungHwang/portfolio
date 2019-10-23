package business;

import java.util.ArrayList;

import vo.NoticeVO;
import vo.PageVO;

public interface NService {

      ArrayList<NoticeVO> pageList(PageVO pvo);
      ArrayList<NoticeVO> selectList();
      // 메인에 보이기 위한 공고
      ArrayList<NoticeVO> selectList2();
      NoticeVO selectOne(NoticeVO vo);
      int totalRowCount();
      int insert(NoticeVO vo); 
      int delete(NoticeVO vo); 
      int update(NoticeVO vo);

      ArrayList<NoticeVO> search(PageVO pvo);
   
}