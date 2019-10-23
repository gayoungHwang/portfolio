package business;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.NoticeVO;
import vo.PageVO;

@Service("notice")
public class NServiceImpl implements NService {
   
   @Autowired
   private SqlSession dao ;
   private static final String NS ="green.mapper.NoticeMapper." ;
   
   @Override
   public ArrayList<NoticeVO> pageList(PageVO pvo) {
      return (ArrayList)dao.selectList(NS+"pageList",pvo);
   }
   
   @Override
   public ArrayList<NoticeVO> selectList() {
      return (ArrayList)dao.selectList(NS+"noticelist");
   }
   
   @Override
   public ArrayList<NoticeVO> selectList2() {
      return (ArrayList)dao.selectList(NS+"mainnoticelist");
   }
   
   @Override
   public NoticeVO selectOne(NoticeVO vo) {
      return dao.selectOne(NS+"selectDetail", vo); 
   }
   
   @Override
   public int totalRowCount() {
      return dao.selectOne(NS+"totalrowCount") ;
   }
   
   @Override
   public int insert(NoticeVO vo) {
      return dao.insert(NS + "insertNotice", vo);
   } 

   @Override
   public int delete(NoticeVO vo) {
      return dao.delete(NS + "deleteNotice", vo);
   } 

   @Override
   public int update(NoticeVO vo) {
      return dao.update(NS + "updateNotice", vo);
   }
   
   @Override
   public ArrayList<NoticeVO> search(PageVO pvo) {
      return (ArrayList)dao.selectList(NS+"searchList", pvo); 
   }
   
}