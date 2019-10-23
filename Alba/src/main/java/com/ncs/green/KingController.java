package com.ncs.green;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import business.KService;
import vo.KingVO;
import vo.PageVO;


@Controller
public class KingController {
  
   @Autowired
   @Qualifier("king")
   private KService kservice ;
   
   // 암호화 Encryption, 복호화 Decryption
   @Autowired
   BCryptPasswordEncoder passwordEncoder ;
   
   //구인자 목록
   @RequestMapping(value = "/klist")
   public ModelAndView klist(HttpServletRequest request, ModelAndView mv, KingVO vo, PageVO pvo) {
      int currPage = 1;
      if (pvo.getCurrPage() > 1)
         currPage = pvo.getCurrPage();
      else pvo.setCurrPage(currPage);

      pvo.setTotalCount(kservice.totalRowCount());
      System.out.println("klist Test =>"+pvo);

      int totalPage = pvo.getTotalCount() / pvo.getPerPage();
      if (pvo.getTotalCount() % pvo.getPerPage() != 0)
         totalPage++;

      int sPage = 1, ePage = 1;

      sPage = ((currPage - 1) / pvo.getPerPageNo()) * pvo.getPerPageNo() + 1;
      ePage = sPage + pvo.getPerPageNo() - 1;

      int sno = ((currPage - 1)* pvo.getPerPage());

      pvo.setSno(sno);
      ArrayList<KingVO> klist = kservice.selectList();
      mv.addObject("Apple", klist);
      mv.addObject("totalPage", totalPage);
      mv.addObject("currPage", currPage);
      mv.addObject("perPageNo", pvo.getPerPageNo());
      mv.addObject("sPage", sPage);
      mv.addObject("ePage", ePage);

      HttpSession session = request.getSession(false);
      if (session != null) {

      } else
         System.out.println("**** session 값 null ****");
      
      mv.addObject("Apple", klist);
      mv.setViewName("layout4/king/kingList");
      return mv;
   } //klist

// 정보 상세보기
   @RequestMapping(value = "/kdetail")
   public ModelAndView kdetail(HttpServletRequest request, ModelAndView mv, KingVO vo) {
      String id = null;
      String kid = null;
      String password = null; 
      HttpSession session = request.getSession(false);
      if (session != null) {
         kid = (String) session.getAttribute("kloginID");
         id = (String) session.getAttribute("loginID");
         password = (String) session.getAttribute("kloginPW"); 
         if (kid != null || id != null) {
            if (kid != null) {
               vo.setKid(kid);
            }
            vo = kservice.selectOne(vo);
            vo.setKpw(password);
            mv.addObject("Apple", vo);
            System.out.println("voefe" + vo);
         } else
            System.out.println("**** loginID 값 null ****");
      } else
         System.out.println("**** session 값 null ****");

      if (vo != null && kid != null) {
         mv.setViewName("layout3/king/kingDetail");
      } else if (id != null) {
         mv.setViewName("layout4/king/kingDetail");
      } else {
         mv.addObject("fCode", "D");
         mv.setViewName("king/doFinish");
      }
      return mv;
   } // kdetail

   // 정보 수정
   @RequestMapping(value = "/kupdate")
   public ModelAndView kupdate(HttpServletRequest request, ModelAndView mv, KingVO vo)
         throws ServletException, IOException {
      String kid = null;
      String id = null;
      HttpSession session = request.getSession(false);
      if (session != null) {
         kid = (String) session.getAttribute("kloginID");
         id = (String) session.getAttribute("loginID");
      }
      // Password 인코딩
      String encPassword = passwordEncoder.encode(vo.getKpw());
      vo.setKpw(encPassword);
      int cnt = kservice.update(vo);

      if (cnt > 0) {
         if (kid != null) {
            mv.setViewName("layout3/mainForm");
         } else if (id != null) {
            mv.setViewName("redirect:/klist");
         }
      } else {
         mv.addObject("fCode", "U");
         mv.setViewName("king/doFinish");
      }
      return mv;
   } // kupdate
   
   // 회원 탈퇴
   @RequestMapping(value="/kdelete")
   public ModelAndView kdelete(HttpServletRequest request,
         ModelAndView mv, KingVO vo) {
      String kid = null;
      String id = null;
      int cnt = 0;
      HttpSession session = request.getSession(false);
      if (session != null) {
         kid = (String) session.getAttribute("kloginID");
         id = (String) session.getAttribute("loginID");
         if (kid != null || id!=null) {
            cnt = kservice.delete(vo);
            mv.addObject("Apple", vo);
         } else
            System.out.println("**** loginID 값 null ****");
      } else
         System.out.println("**** session 값 null ****");
      
      if (cnt > 0) {
         if(kid!=null)
            session.invalidate();
            mv.setViewName("home");
         } else if(id!=null){
            mv.addObject("fCode", "DS");
            mv.setViewName("redirect:/klist");
      } else { // doFinish.jsp 로 forward
         mv.addObject("fCode", "DF");
      }
      return mv;
   } // kdelete
   
   // 검색
   @RequestMapping(value="/searchking")
   public ModelAndView searchking(HttpServletRequest request, ModelAndView mv, PageVO pvo, KingVO vo) {
      int currPage = 1;
      if (pvo.getCurrPage() > 1)
         currPage = pvo.getCurrPage();
      else pvo.setCurrPage(currPage);

      pvo.setTotalCount(kservice.totalRowCount());
      int totalPage = pvo.getTotalCount() / pvo.getPerPage();
      if (pvo.getTotalCount() % pvo.getPerPage() != 0)
         totalPage++;

      int sPage = 1, ePage = 1;
      sPage = ((currPage - 1) / pvo.getPerPageNo()) * pvo.getPerPageNo() + 1;
      ePage = sPage + pvo.getPerPageNo() - 1;

      int sno = ((currPage - 1)* pvo.getPerPage());
      pvo.setSno(sno);

      ArrayList<KingVO> searchking = kservice.search(pvo);

      mv.addObject("Apple", searchking);
      mv.addObject("totalPage", totalPage);
      mv.addObject("currPage", currPage);
      mv.addObject("perPageNo", pvo.getPerPageNo());
      mv.addObject("sPage", sPage);
      mv.addObject("ePage", ePage);
      mv.setViewName("king/kingSearch");

      return mv; 
   }//searckking

   
}