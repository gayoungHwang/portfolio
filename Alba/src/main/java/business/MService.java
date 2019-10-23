package business;

import java.util.ArrayList;
import vo.MentVO;

public interface MService {

	ArrayList<MentVO> mentList(); 
	int mentCount();
	int insert(MentVO vo); 
	int update(MentVO vo); 
	int delete(MentVO vo); 


}