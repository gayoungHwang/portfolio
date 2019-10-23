package com.ncs.green;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.Period;
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

import business.NService;
import business.PService;
import vo.KingVO;
import vo.NoticeVO;
import vo.PageVO;
import vo.PartimerVO;


@Controller
public class NoticeController {

   @Autowired
   @Qualifier("notice")
   private NService nservice;

   @Qualifier("partimer")
   private PService pservice;

   // 공고 목록(구직자)
   @RequestMapping(value="/nlist")
   public ModelAndView nlist(HttpServletRequest request, ModelAndView mv,PageVO pvo, NoticeVO vo) {

      String id = null;
      String pid=null;
      HttpSession session = request.getSession(false);
      if (session != null) {
         session.setAttribute("Kno", vo.getKno());
         id = (String)session.getAttribute("loginID");
         pid = (String)session.getAttribute("ploginID");

      } else
         System.out.println("**** session 값 null ****");

      int currPage = 1;
      if (pvo.getCurrPage() > 1)
         currPage = pvo.getCurrPage();
      else pvo.setCurrPage(currPage);

      pvo.setTotalCount(nservice.totalRowCount());
      System.out.println("nlist Test =>"+pvo);

      int totalPage = pvo.getTotalCount() / pvo.getPerPage();
      if (pvo.getTotalCount() % pvo.getPerPage() != 0)
         totalPage++;

      int sPage = 1, ePage = 1;

      sPage = ((currPage - 1) / pvo.getPerPageNo()) * pvo.getPerPageNo() + 1;
      ePage = sPage + pvo.getPerPageNo() - 1;

      int sno = ((currPage - 1)* pvo.getPerPage());

      pvo.setSno(sno);

      ArrayList<NoticeVO> nlist = nservice.pageList(pvo);

      mv.addObject("Apple", nlist);
      mv.addObject("totalPage", totalPage);
      mv.addObject("currPage", currPage);
      mv.addObject("perPageNo", pvo.getPerPageNo());
      mv.addObject("sPage", sPage);
      mv.addObject("ePage", ePage);

      if(vo!=null && id!=null) {
         mv.setViewName("layout4/notice/noticeList");

      }else if(pid!=null){
         mv.setViewName("layout2/notice/noticeList");
      }

      return mv; 
   } // nlist

   // 공고목록 (구인자)
   @RequestMapping(value = "/nlist2")
   public ModelAndView nlist2(HttpServletRequest request, ModelAndView mv, NoticeVO vo) {

      System.out.println("nlist2 Test =>" + vo);
      HttpSession session = request.getSession(false);
      if (session != null) {

      } else
         System.out.println("**** session 값 null ****");
      ArrayList<NoticeVO> nlist = nservice.selectList();
      mv.addObject("Apple", nlist);

      mv.setViewName("layout3/notice/noticeList2");
      return mv;
   } // nlist2

   @RequestMapping(value = "/noticef")
   public ModelAndView noticef(ModelAndView mv) {
      mv.setViewName("layout3/notice/noticeForm");
      return mv;
   }

   // 공고 등록
   @RequestMapping(value = "/ninsert")
   public ModelAndView ninsert(HttpServletRequest request, ModelAndView mv, NoticeVO vo, KingVO vo2)
         throws ServletException, IOException {
      int kno = 0;
      int cnt = 0;

      HttpSession session = request.getSession(false);
      if (session != null) {
         kno = (Integer) session.getAttribute("Kno");

      } else
         System.out.println("**** session 값 null ****");

      vo.setKno(kno);

      System.out.println("ninsert Test =>" + vo);
      MultipartFile mainimagef = null;
      if (vo.getMainimagef() != null) {
         mainimagef = vo.getMainimagef();
      }
      String file1, file2 = "No Image";

      if (mainimagef != null) {
         file1 = "D:/mtest/Mywork/Alba/src/main/webapp/resources/uploadImage/" + mainimagef.getOriginalFilename();
         mainimagef.transferTo(new File(file1));
         file2 = "resources/uploadImage/" + mainimagef.getOriginalFilename();
      } else
         System.out.println("** UploadImage 를 선택하지 않음 ~~");

      vo.setMainimage(file2);

      cnt = nservice.insert(vo);
      if (cnt > 0) {

         vo2.setKno(kno);

         mv.addObject("fCode", "RS");
         mv.setViewName("redirect:/nlist2");
      } else {
         // Join실패 -> doFinish.jsp 출력
         mv.addObject("fCode", "RF");
         mv.setViewName("king/doFinish");
      } // else

      return mv;
   } // ninsert

   //공고 상세보기
   @RequestMapping(value = "/ndetail")
   public ModelAndView ndetail(HttpServletRequest request, ModelAndView mv, NoticeVO vo, KingVO vo2, PartimerVO vo3) {

      String kid = null;
      String id = null;
      HttpSession session = request.getSession(false);
      if (session != null) {
         kid = (String) session.getAttribute("kloginID");
         id = (String) session.getAttribute("loginID");

         if (kid != null || id != null) {
            vo = nservice.selectOne(vo);
            mv.addObject("Apple", vo);
         } else
            System.out.println("**** loginID 값 null ****");
      } else
         System.out.println("**** session 값 null ****");

      if (vo2 != null && kid != null) {
         mv.setViewName("layout3/notice/noticeDetail");
      } else if(id != null) { 
         mv.setViewName("layout4/notice/noticeDetail");
      } else {
         mv.addObject("fCode", "D");
         mv.setViewName("king/doFinish");
      }
      return mv;
   } // ndetail

   // 공고 수정
   @RequestMapping(value = "/nupdate")
   public ModelAndView nupdate(HttpServletRequest request, ModelAndView mv, NoticeVO vo)
         throws ServletException, IOException {
      int kno = 0;
      String id = null;
      HttpSession session = request.getSession(false);
      if (session != null) {
         id = (String) session.getAttribute("loginID");
         kno = (Integer) session.getAttribute("Kno");
      }

      System.out.println("from form mainimage=>" + vo.getMainimage());

      MultipartFile Mainimagef = vo.getMainimagef();
      String file1, file2 = "No Image";
      // 새 이미지를 선택 한 경우에만 수정함
      if (!Mainimagef.isEmpty()) {
         file1 = "D:/mtest/Mywork/Alba/src/main/webapp/resources/uploadImage/" + Mainimagef.getOriginalFilename();
         Mainimagef.transferTo(new File(file1));
         file2 = "resources/uploadImage/" + Mainimagef.getOriginalFilename();
         vo.setMainimage(file2);
      } else
         System.out.println("** UploadImage 를 선택하지 않음 ~~");

      vo.setKno(kno);
      int cnt = nservice.update(vo);
      if (cnt > 0) {
         if(id!=null) {
            mv.addObject("fCode", "NS");
            mv.setViewName("redirect:/nlist"); }
         else {
            mv.setViewName("redirect:/nlist2");
         }
      } else {
         mv.addObject("fCode", "U");
         mv.setViewName("king/doFinish");
      }
      return mv;
   } // nupdate


   // 구직자가 보는 공고 상세보기
   @RequestMapping(value = "/pndetail")
   public ModelAndView pndetail(HttpServletRequest request, ModelAndView mv, NoticeVO vo, PartimerVO vo2, KingVO vo3) throws ParseException {
      int pno=0;
      int kno=0;
      String pid=null;
      String kid=null;
      //Date객체로부터 특정한 형식의 문자열로 일시를 만들어내기 위한 포매터를 생성한다
      
      HttpSession session = request.getSession(false);
      if (session != null) {

         vo = nservice.selectOne(vo);
         mv.addObject("Apple", vo);
       
         LocalDate today = LocalDate.now();
     
         
         String deadline = vo.getDeadline();
         LocalDate to =  LocalDate.parse(deadline);
         
         if(vo != null) {
            pid = (String) session.getAttribute("ploginID");
            kid = (String) session.getAttribute("kloginID");
            
            if (pid!=null) {
               pno = (Integer) session.getAttribute("Pno");
               session.setAttribute("Kno", vo.getKno()); 
               session.setAttribute("Bno", vo.getBno());
               vo2.setPid(pid);
               vo2.setPno(pno);
               mv.addObject("Banana",vo2);
               mv.setViewName("layout2/notice/pnoticeDetail");
		
          Period test = Period.between(today, to);  //  to-today
          if (test.isNegative()) {  mv.addObject("fCode", "BT");  } //BT :공고마감
          else {  mv.addObject("fCode", "AT"); } //AT: 지원가능
                          
             } // if
            else if(kid!=null) {
               kno = (Integer) session.getAttribute("Kno");
               vo3.setKno(kno);
               mv.setViewName("layout3/notice/pnoticeDetail");
            } // else if 
            
         else {         
             mv.setViewName("layout/notice/pnoticeDetail");				
            } // if
         }
      }
         else {
               System.out.println("**** session 값 null ****");
         }
      return mv;
   } //pndetail

   // 공고 삭제
   @RequestMapping(value = "/ndelete")
   public ModelAndView ndelete(HttpServletRequest request, ModelAndView mv, NoticeVO vo, KingVO vo2) {
      System.out.println("kkk"+vo);

      String kid = null;
      String id = null;
      int cnt = 0;

      HttpSession session = request.getSession(false);
      if (session != null) {
         kid = (String) session.getAttribute("kloginID");
         id = (String) session.getAttribute("loginID");

         if (kid != null || id != null) {
            cnt = nservice.delete(vo);
            mv.addObject("Apple", vo);
         } else
            System.out.println("**** loginID 값 null ****");
      } else
         System.out.println("**** session 값 null ****");

      if (cnt > 0) {
         if(id != null) {
            mv.setViewName("redirect:/nlist");
            return mv;
         } else if(kid != null){
            mv.addObject("fCode", "DS");
            mv.setViewName("redirect:/nlist2");
         } else {
            mv.setViewName("partimer/doFinish");
         }
      } else { 
         mv.addObject("fCode", "NS");
         mv.setViewName("king/dofinish");
      }
      return mv;
   } // ndelete


   @RequestMapping(value="/searchnotice")
   public ModelAndView searchlist(HttpServletRequest request, ModelAndView mv,PageVO pvo, NoticeVO vo) {
      int currPage = 1;
      if (pvo.getCurrPage() > 1)
         currPage = pvo.getCurrPage();
      else pvo.setCurrPage(currPage);

      pvo.setTotalCount(nservice.totalRowCount());
      int totalPage = pvo.getTotalCount() / pvo.getPerPage();
      if (pvo.getTotalCount() % pvo.getPerPage() != 0)
         totalPage++;

      int sPage = 1, ePage = 1;

      sPage = ((currPage - 1) / pvo.getPerPageNo()) * pvo.getPerPageNo() + 1;
      ePage = sPage + pvo.getPerPageNo() - 1;

      int sno = ((currPage - 1)* pvo.getPerPage());
      pvo.setSno(sno);

      ArrayList<NoticeVO> searchlist = nservice.search(pvo);

      mv.addObject("Apple", searchlist);
      mv.addObject("totalPage", totalPage);
      mv.addObject("currPage", currPage);
      mv.addObject("perPageNo", pvo.getPerPageNo());
      mv.addObject("sPage", sPage);
      mv.addObject("ePage", ePage);
      mv.setViewName("notice/noticeSearch");

      return mv; 
   }

}