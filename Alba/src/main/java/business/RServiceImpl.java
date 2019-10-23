package business;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.PageVO;
import vo.ResumeVO;

@Service("resume")
public class RServiceImpl implements RService{
	@Autowired
	private SqlSession dao ;
	private static final String NS ="green.mapper.ResumeMapper." ;
	
	@Override
	public ArrayList<ResumeVO> selectList() {
		return (ArrayList)dao.selectList(NS+"resumelist");
	}
	
	@Override
	public ArrayList<ResumeVO> pageList(PageVO pvo) {
		return (ArrayList)dao.selectList(NS+"pageList",pvo);
	}
	
	@Override
	public ResumeVO selectOne(ResumeVO vo) {
		return dao.selectOne(NS+"detailResume",vo);
	}
	
	@Override
	public int totalRowCount() {
		return dao.selectOne(NS+"totalrowCount");
	}
	
	@Override
	public int insert(ResumeVO vo) {
		System.out.println("Å×½ºÆ®"+vo);
		
		return dao.insert(NS+"insertResume",vo) ;
	} // insert
	
	@Override
	public int update(ResumeVO vo) {
		return dao.update(NS+"updateResume",vo);
	}
	
	@Override
	public int delete(ResumeVO vo) {
		return dao.delete(NS+"deleteResume",vo) ;
	} // delete

	@Override
	public ArrayList<ResumeVO> search(PageVO pvo) {
		return (ArrayList)dao.selectList(NS + "searchList", pvo);
	}

}
