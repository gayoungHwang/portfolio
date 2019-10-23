package business;

import java.util.ArrayList;

import vo.PageVO;
import vo.ResumeVO;

public interface RService {

	ArrayList<ResumeVO> selectList();
	ArrayList<ResumeVO> pageList(PageVO pvo);
	ResumeVO selectOne(ResumeVO vo);
	int totalRowCount();
	int insert(ResumeVO vo); 
	int update(ResumeVO vo);
	int delete(ResumeVO vo); 
	
	ArrayList<ResumeVO> search(PageVO pvo);

	
}