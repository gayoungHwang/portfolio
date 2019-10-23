package business;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vo.ApplylistVO;

@Service("applylist")
public class AServiceImpl implements AService {
   @Autowired
   private SqlSession dao ;
   private static final String NS ="green.mapper.ApplylistMapper." ;
   
   @Override
   public ArrayList<ApplylistVO> resultList() {
      return (ArrayList)dao.selectList(NS+"resultPass");
   }

   @Override
   public ArrayList<ApplylistVO> selectList() {
      return (ArrayList)dao.selectList(NS+"applylist");
   }
   
   @Override
	public ArrayList<ApplylistVO> nselectList() {
		return (ArrayList) dao.selectList(NS + "applyKing");
	}

   @Override
   public ApplylistVO selectOne(ApplylistVO vo) {
      return dao.selectOne(NS+"detailApplylist",vo);
   }
   
   @Override
   public int insert(ApplylistVO vo) {
      return dao.insert(NS+"insertApplylist",vo) ;
   } 
   
   @Override
   public int delete(ApplylistVO vo) {
      return dao.delete(NS+"deleteApplylist",vo) ;
   }
   
	@Override
	public int check_apply(ApplylistVO vo) {
		return dao.selectOne(NS+"checkApplylist",vo);
	}
	
	@Override
	public int selectPass(ApplylistVO vo) {
		return dao.update(NS+"selectPass",vo);
	}
	
	@Override
	public int selectFail(ApplylistVO vo) {
		return dao.update(NS+"selectFail",vo);
	}
}