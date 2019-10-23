package com.ncs.green;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import business.RService;
import vo.KingVO;
import vo.PageVO;
import vo.PartimerVO;
import vo.ResumeVO;

@Controller
public class ResumeController {
	@Autowired
	@Qualifier("resume")
	private RService rservice;


	// 이력서 전체보기
	@RequestMapping(value = "/rlist2")
	public ModelAndView rlist2(HttpServletRequest request, ModelAndView mv, ResumeVO vo,PageVO pvo) {
		int currPage = 1;
		if (pvo.getCurrPage() > 1)
			currPage = pvo.getCurrPage();
		else pvo.setCurrPage(currPage);

		pvo.setTotalCount(rservice.totalRowCount());
		System.out.println("nlist Test =>"+pvo);

		int totalPage = pvo.getTotalCount() / pvo.getPerPage();
		if (pvo.getTotalCount() % pvo.getPerPage() != 0)
			totalPage++;

		int sPage = 1, ePage = 1;
		sPage = ((currPage - 1) / pvo.getPerPageNo()) * pvo.getPerPageNo() + 1;
		ePage = sPage + pvo.getPerPageNo() - 1;

		int sno = ((currPage - 1)* pvo.getPerPage());

		pvo.setSno(sno);

		ArrayList<ResumeVO> rlist = rservice.selectList();

		mv.addObject("Apple", rlist);
		mv.addObject("totalPage", totalPage);
		mv.addObject("currPage", currPage);
		mv.addObject("perPageNo", pvo.getPerPageNo());
		mv.addObject("sPage", sPage);
		mv.addObject("ePage", ePage);

		String id = null;
		HttpSession session = request.getSession(false);
		if (session != null) {
			id = (String) session.getAttribute("loginID");
			if( vo !=null && id!= null) {
				mv.setViewName("layout4/resume/resumeList2");
			} else {

				mv.setViewName("layout3/resume/resumeList2");
			}
		}
		return mv;
	} // rlist2

	// 내 이력서 보기
	@RequestMapping(value="/rlist")
	public ModelAndView rlist(HttpServletRequest request, ModelAndView mv, ResumeVO vo) {

		HttpSession session = request.getSession(false);
		if (session != null) {

		} else
			System.out.println("**** session 값 null ****");

		ArrayList<ResumeVO> rlist = rservice.selectList();
		mv.addObject("Apple",rlist);
		mv.setViewName("layout2/resume/resumeList");
		return mv; 
	} //rlist

	// 이력서 선택
	@RequestMapping(value="/rselect")
	public ModelAndView rselect(HttpServletRequest request, ModelAndView mv, ResumeVO vo) {
		int pno = 0;
		HttpSession session = request.getSession(false);
		if (session != null) {
			pno = (Integer) session.getAttribute("Pno");
		} else
			System.out.println("**** session 값 null ****");

		ArrayList<ResumeVO> rlist = rservice.selectList();

		mv.addObject("Apple",rlist);
		vo.setPno(pno);
		mv.setViewName("resume/resumeSelect");
		return mv; 
	} // rselect

	@RequestMapping(value = "/rinsertf")
	public ModelAndView pjoinf(ModelAndView mv) {
		mv.setViewName("layout2/resume/resumeForm");
		return mv;
	}

	// 이력서 등록
	@RequestMapping(value = "/rinsert")
	public ModelAndView rinsert(HttpServletRequest request, ModelAndView mv, ResumeVO vo, PartimerVO vo2)
			throws ServletException, IOException {
		int pno = 0;
		int cnt = 0;
		HttpSession session = request.getSession(false);
		if (session != null) {
			pno = (Integer) session.getAttribute("Pno");
		} else
			System.out.println("**** session 값 null ****");

		vo.setPno(pno);

		// Ajax Test 위해 추가
		System.out.println("rinsert Test =>" + vo);
		MultipartFile uploadfilef = null;
		if (vo.getUploadfilef() != null) {
			uploadfilef = vo.getUploadfilef();
		}
		String file1, file2 = "No Image";

		if (uploadfilef != null) {
			file1 ="D:/mtest/Mywork/Alba/src/main/webapp/resources/uploadImage/" + uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(file1));
			file2 = "resources/uploadImage/" + uploadfilef.getOriginalFilename();
		} else
			System.out.println("** UploadImage 를 선택하지 않음 ");

		vo.setUploadfile(file2);

		cnt = rservice.insert(vo);
		if (cnt > 0) {	
			mv.addObject("fCode", "RS");
			ArrayList<ResumeVO> rlist = rservice.selectList();
			mv.addObject("Apple",rlist);
			mv.setViewName("layout2/resume/resumeList");
		} else {
			mv.addObject("fCode", "RF");
			mv.setViewName("layout2/partimer/doFinish");
		} 
		return mv;
	} // rinsert

	// 이력서 상세보기
	@RequestMapping(value = "/rdetail")
	public ModelAndView rdetail(HttpServletRequest request, ModelAndView mv, ResumeVO vo, PartimerVO vo2) {

		String pid = null;
		String id = null;
		HttpSession session = request.getSession(false);
		if (session != null) {
			pid = (String) session.getAttribute("ploginID");
			id = (String) session.getAttribute("loginID");

			if (pid != null || id != null) {
				vo = rservice.selectOne(vo);
				mv.addObject("Apple", vo);
			} else
				System.out.println("**** loginID 값 null ****");
		} else
			System.out.println("**** session 값 null ****");

		if (vo2 != null && pid != null) {
			mv.setViewName("layout2/resume/resumeDetail");
		} else if(id != null) { // doFinish.jsp 로 forward
			mv.setViewName("layout4/resume/resumeDetail");
		} else {
			mv.addObject("fCode", "D");
			mv.setViewName("partimer/doFinish");
		}
		return mv;
	} // rdetail

	//구인자가 보는 이력서
	@RequestMapping(value = "/krdetail")
	public ModelAndView krdetail(HttpServletRequest request, ModelAndView mv, ResumeVO vo, KingVO vo2) {

		String kid = null;

		HttpSession session = request.getSession(false);
		if (session != null) {
			kid = (String) session.getAttribute("kloginID");

			if (kid != null) {
				if (!kid.equals("admin"))
					vo2.setKid(kid);
				vo = rservice.selectOne(vo);

				mv.addObject("Apple", vo);
			} else
				System.out.println("**** loginID 값 null ****");
		} else
			System.out.println("**** session 값 null ****");

		if (vo2 != null && kid != null) {
			mv.setViewName("layout3/resume/kresumeDetail");
		} else { 
			mv.addObject("fCode", "D");
			mv.setViewName("partimer/doFinish");
		}
		return mv;
	} // krdetail

	// 이력서 수정
	@RequestMapping(value = "/rupdate")
	public ModelAndView rupdate(HttpServletRequest request, ModelAndView mv, ResumeVO vo)
			throws ServletException, IOException {

		String id = null;
		HttpSession session = request.getSession(false);
		if (session != null) {
			id = (String) session.getAttribute("loginID");
		}

		System.out.println("from form uploadfile=>" + vo.getUploadfile());
		MultipartFile uploadfilef = vo.getUploadfilef();
		String file1, file2 = "No Image";
		if (!uploadfilef.isEmpty()) {
			file1 = "D:/mtest/Mywork/Alba/src/main/webapp/resources/uploadImage/" + uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(file1));
			file2 = "resources/uploadImage/" + uploadfilef.getOriginalFilename();
			vo.setUploadfile(file2);
		} else
			System.out.println("** UploadImage 를 선택하지 않음 ~~");
		int cnt = rservice.update(vo);

		if (cnt > 0) {
			if(id!=null) {
				mv.addObject("fCode", "RS");
				mv.setViewName("redirect:/rlist2"); 
				}
			else {
				mv.setViewName("redirect:/rlist");
				}
		} else {
			mv.addObject("fCode", "U");
			mv.setViewName("partimer/doFinish");
		} 
		return mv;
	} // rupdate

	@RequestMapping(value="/rdelete")
	public ModelAndView rdelete(HttpServletRequest request,
			ModelAndView mv, ResumeVO vo, PartimerVO vo2) {
		String pid = null;
		String id = null;
		int cnt = 0;

		HttpSession session = request.getSession(false);
		if (session != null) {
			pid = (String) session.getAttribute("ploginID");
			id = (String) session.getAttribute("loginID");

			if (pid != null || id != null) {		
				cnt = rservice.delete(vo);
				mv.addObject("Apple", vo);
			} else
				System.out.println("**** loginID 값 null ****");
		} else
			System.out.println("**** session 값 null ****");

		if (cnt > 0) {
			if (id != null) {
				mv.setViewName("redirect:/rlist2");
			} else if(pid != null) {
				mv.addObject("fCode", "DS");
				mv.setViewName("redirect:/rlist");
			}
		} else { 
			mv.addObject("fCode", "RS");
			mv.setViewName("partimer/doFinish");
		}
		return mv;
	} // rdelete

	// 검색
	@RequestMapping(value="/searchresume")
	public ModelAndView searchresume(HttpServletRequest request, ModelAndView mv, PageVO pvo, ResumeVO vo) {

		int currPage = 1;
		if (pvo.getCurrPage() > 1)
			currPage = pvo.getCurrPage();
		else pvo.setCurrPage(currPage);

		pvo.setTotalCount(rservice.totalRowCount());
		int totalPage = pvo.getTotalCount() / pvo.getPerPage();
		if (pvo.getTotalCount() % pvo.getPerPage() != 0)
			totalPage++;

		int sPage = 1, ePage = 1;
		sPage = ((currPage - 1) / pvo.getPerPageNo()) * pvo.getPerPageNo() + 1;
		ePage = sPage + pvo.getPerPageNo() - 1;

		int sno = ((currPage - 1)* pvo.getPerPage());
		pvo.setSno(sno);

		ArrayList<ResumeVO> searchresume = rservice.search(pvo);

		mv.addObject("Apple", searchresume);
		mv.addObject("totalPage", totalPage);
		mv.addObject("currPage", currPage);
		mv.addObject("perPageNo", pvo.getPerPageNo());
		mv.addObject("sPage", sPage);
		mv.addObject("ePage", ePage);
		mv.setViewName("resume/resumeSearch");

		return mv; 
	} // searchresume
}