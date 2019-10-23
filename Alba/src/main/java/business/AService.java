package business;

import java.util.ArrayList;

import vo.ApplylistVO;
import vo.ReservationVO;

public interface AService {

   ArrayList<ApplylistVO> resultList();
   ArrayList<ApplylistVO> selectList();
   ArrayList<ApplylistVO> nselectList();
   
   ApplylistVO selectOne(ApplylistVO vo);
   
   int insert(ApplylistVO vo);
   int delete(ApplylistVO vo);
   
   // 지원 여부
   int check_apply(ApplylistVO vo);
   
   //합격
   int selectPass(ApplylistVO vo);
   int selectFail(ApplylistVO vo);
   
}