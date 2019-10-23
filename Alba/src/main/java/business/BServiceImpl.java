package business;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.CpboardVO;
import vo.PageVO;

@Service
public class BServiceImpl implements BService {
	@Autowired
	private SqlSession dao ;
	private static final String NS ="green.mapper.CpboardMapper." ;
	

	@Override
	public ArrayList<CpboardVO> idselectList(CpboardVO vo) {
		return (ArrayList)dao.selectList(NS+"idselectList",vo);
	} 
	
	@Override public ArrayList<CpboardVO> pageList(PageVO pvo) { 
	 return (ArrayList)dao.selectList(NS+"pageList", pvo);
	}
	  
	@Override public ArrayList<CpboardVO> selectList() { 
		  return (ArrayList)dao.selectList(NS+"selectList"); 
    } 

	@Override
	public CpboardVO selectOne(CpboardVO vo) {
		return dao.selectOne(NS+"selectDetail",vo) ;
	} 
	
	@Override
	public int totalRowCount() {
		return dao.selectOne(NS+"totalrowCount") ;
	}
	
	@Override
	public int insert(CpboardVO vo) {
		return dao.insert(NS+"insertBoard",vo) ;
	} 

	@Override
	public int update(CpboardVO vo) {
		return dao.update(NS+"updateBoard",vo) ;
	} 
	
	@Override
	public int delete(CpboardVO vo) {
		return dao.delete(NS+"deleteBoard",vo) ;
	} 
	
	@Override
	public int countUp(CpboardVO vo) {
		return dao.update(NS+"countUp",vo) ;    
	} 
	
	@Override
	public int rinsert(CpboardVO vo) {
		System.out.println("** rinsert StepUp count =>"+dao.update(NS+"stepUpdate",vo));
		return dao.insert(NS+"rinsertBoard",vo) ;
	} 
	
    @Override
    public ArrayList<CpboardVO> search(PageVO pvo) {
	 return (ArrayList)dao.selectList(NS+"searchList", pvo); 
	 }
} // class

