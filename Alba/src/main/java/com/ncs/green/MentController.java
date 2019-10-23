package com.ncs.green;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import business.MService;
import vo.MentVO;
import vo.PageVO;




@Controller
public class MentController {
	@Autowired
	private MService service;


	// ´ñ±Û ¸ñ·Ï
	@RequestMapping(value="/mlist")
	public ModelAndView mlist(HttpServletRequest request, ModelAndView mv, PageVO pvo, MentVO vo){ 

		ArrayList<MentVO> mlist = service.mentList();
		mv.addObject("yerim",mlist);
		mv.setViewName("cpboard/ment"); 
		return mv; 
	} //mlist

	// ´ñ±Û µî·Ï
	@RequestMapping(value="/minsert")
	public ModelAndView minsert(HttpServletRequest request, ModelAndView mv, MentVO vo) {
		int cnt = 0;
		int pno = 0;


		HttpSession session = request.getSession(false);
		if (session != null) {
			pno = (Integer) session.getAttribute("Pno");

		} else
			System.out.println("**** session °ª null ****");


		vo.setPno(pno);
		System.out.println("minsert" + vo);
		cnt=service.insert(vo);
		if (cnt>0) {
			mv.setViewName("redirect:mlist");
		}else {
			mv.addObject("fCode","I");
			mv.setViewName("cpboard/boardFinish");
		}

		return mv;
	} // minsert

	@RequestMapping(value="/mupdatef")
	public ModelAndView mupdatef(ModelAndView mv) {
		mv.setViewName("cpboard/boardDetail");  

		return mv;
	}

	// ´ñ±Û ¼öÁ¤
	@RequestMapping(value="/mupdate")
	public ModelAndView mupdate(ModelAndView mv, MentVO vo) {
		int cnt = 0;
		cnt=service.update(vo);
		mv.addObject("yerim",vo);
		if (cnt>0) {
			mv.setViewName("redirect:mlist");
		}else {
			mv.addObject("fCode","U");
			mv.setViewName("cpboard/boardFinish");
		}
		return mv;
	} // mupdate 


	// ´ñ±Û »èÁ¦
	@RequestMapping(value="/mdelete")
	public ModelAndView mdelete(ModelAndView mv, MentVO vo) {

		int cnt = 0;
		cnt=service.delete(vo);
		if (cnt>0) {
			mv.setViewName("redirect:mlist");
		}else {
			mv.addObject("fCode","D");
			mv.setViewName("cpboard/boardFinish");
		}
		return mv;
	} // mdelete 

}