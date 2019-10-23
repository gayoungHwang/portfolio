package business;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.MentVO;



@Service
public class MServiceImpl implements MService {
	@Autowired
	private SqlSession dao ;
	private static final String NS ="green.mapper.mentMapper." ;

	
	@Override
	public ArrayList<MentVO> mentList() {
		return (ArrayList)dao.selectList(NS+"mentList");
	} 

	@Override
	public int mentCount() {
		return dao.selectOne(NS+"mentCount") ;
	} 

	@Override
	public int insert(MentVO vo) {
		return dao.insert(NS+"mentInsert",vo) ;
	} 

	@Override
	public int update(MentVO vo) {
		return dao.update(NS+"mentUpdate",vo) ;
	} 
	
	@Override
	public int delete(MentVO vo) {
		return dao.delete(NS+"mentDelete",vo) ;
	} 

}






