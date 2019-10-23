package business;

import java.util.ArrayList;

import vo.CpboardVO;
import vo.PageVO;

public interface BService {

	ArrayList<CpboardVO> idselectList(CpboardVO vo); 
	ArrayList<CpboardVO> pageList(PageVO pvo);
	ArrayList<CpboardVO> selectList(); 
	
	CpboardVO selectOne(CpboardVO vo); 
	
	int totalRowCount();
	int insert(CpboardVO vo); 
	int update(CpboardVO vo); 
	int delete(CpboardVO vo); 
	int countUp(CpboardVO vo); 
	int rinsert(CpboardVO vo); 

	ArrayList<CpboardVO> search(PageVO pvo);

}