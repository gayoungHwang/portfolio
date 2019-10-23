package business;

import java.util.ArrayList;

import vo.ReservationVO;

public interface REService {

	ArrayList<ReservationVO> reservationList(ReservationVO vo);
	ReservationVO selectOne(ReservationVO vo);
	
	int listCount();
	int insertReservation(ReservationVO vo);
	int deleteReservation(ReservationVO vo);
	
    //¿¹¾à
	int check_reservation(ReservationVO vo);
	int check_reservation2(ReservationVO vo);
	int selectApproval(ReservationVO vo);
	int selectRefuse(ReservationVO vo);
}