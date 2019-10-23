package business;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.ApplylistVO;
import vo.ReservationVO;

@Service("reservation")
public class REServiceImpl implements REService {

	@Autowired
	private SqlSession dao ;
	private static final String NS ="green.mapper.ReservationMapper." ;

	@Override
	public ArrayList<ReservationVO> reservationList(ReservationVO vo) { 
		 return (ArrayList)dao.selectList(NS+"reservationList", vo);
		}
		  
	@Override
	public ReservationVO selectOne(ReservationVO vo) {
		return dao.selectOne(NS+"detailReservation",vo) ;
	} 
	@Override
	public int listCount() {
		return dao.selectOne(NS+"listCount");
	}
	@Override
	public int insertReservation(ReservationVO vo) {
		return dao.insert(NS+"insertReservation",vo);
	}
	@Override
	public int deleteReservation(ReservationVO vo) {
		return dao.delete(NS+"deleteReservation",vo);
	}
	@Override
	public int check_reservation(ReservationVO vo) {
		return dao.selectOne(NS+"checkReservation",vo);
	}
	@Override
	public int check_reservation2(ReservationVO vo) {
		return dao.selectOne(NS+"checkReservation2",vo);
	}
	@Override
	public int selectApproval(ReservationVO vo) {
		return dao.update(NS+"selectApproval",vo);
	}
	@Override
	public int selectRefuse(ReservationVO vo) {
		return dao.update(NS+"selectRefuse",vo);
	}
	
	
}
