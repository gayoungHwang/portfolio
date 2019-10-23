
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/axment.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
   $(function() {
      $('.search-addr').on('click', function() {
         new daum.Postcode({
            oncomplete : function(data) {
               const addr = data.roadAddress;
               document.getElementById("addr").value = addr;
            }
         }).open();
      });
   });
   
   function confirmdelete(userno){
       if(confirm('정말 삭제하시겠습니까?')== true){

           location.href='rdelete?userno='+userno;  
       }else{
          return false;
       }
    }//confirmTest
    
</script>
<style>
#contentForm {
   width: 40%;
   margin: 0 auto;
   padding-top: 12%;
   color: black;
}

.table>thead>tr>th, .table>tbody>tr>th {
   background-color: #FFE5C2;
   text-align: center;
}
</style>
<meta charset="UTF-8">
<title>** Resume Detail **</title>
</head>
<body>


   <form action="rupdate" method="post" enctype="multipart/form-data">
      <div id="contentForm">
         <input type="text" name="userno" value="${Apple.userno}"
            hidden="true">
         <table class="table table-bordered"
            style="text-align: center; border: 1px solid #dddddd">
            <thead>
               <tr>
                  <th colspan="9">이력서</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td rowspan="1" colspan="9">
                     <input type="text" style="border: none" name="title" value="${Apple.title}" placeholder="제목을 창의적으로 입력하세요">
                  </td>
               <tr>
                  <td colspan="3" rowspan="4"><img src="${Apple.uploadfile}"> 
                     <input type="text" name="uploadfile" value="${Apple.uploadfile}" hidden="true"><br> 
                     <input type="file"name="uploadfilef"><br>3*4cm
                  </td>
                  
                  <td colspan="1">성명</td>
                  
                  <td  colspan="2">
                     <input type="text" style="border: none;" name="pname" value="${Apple.pname}">
                  </td>
                  
                  <td style="padding-top: 15px" >성별</td>
                  <td colspan="2">
                     <c:choose>
                        <c:when test="${Apple.gender=='여'}">
                           <select name="gender">
                              <option value="여" selected="selected">여</option>
                              <option value="남">남</option>
                           </select>
                        </c:when>
                        <c:when test="${Apple.gender=='남'}">
                           <select name="gender">
                              <option value="여">여</option>
                              <option value="남" selected="selected">남</option>
                           </select>
                        </c:when>
                        <c:otherwise>
                           <select name="gender">
                              <option value="여">여</option>
                              <option value="남">남</option>
                              <option value="" selected="selected">ERROR</option>
                           </select>
                        </c:otherwise>
                     </c:choose>
                 </td>
               </tr>

               <tr>
                  <td style="padding-top: 15px">나이</td>
                  
                  <td colspan="2"><input type="number" name="age" style="border: none;" value="${Apple.age}"></td>
                     
                  <td style="padding-top: 15px">연락처</td>
                  
                  <td colspan="2" ><input type="text" name="phone" style="border: none;" value="${Apple.phone}">
                  </td>
         <tr>
                  <td colspan="1">주소</td>
                  <td colspan="5"><input type="text"
                     class="addr road-addr" id="addr" name="addr"
                     style="border: none;" value="${Apple.addr}"><span
                     class="search-addr" id="searchAddr">주소검색</span></td>
               </tr>

               <tr>
                  <td colspan="1">학력</td>
                  <td colspan="2"><c:choose>
                        <c:when test="${Apple.academic=='중졸'}">
                           <select name="academic">
                              <option value="중졸" selected="selected">중졸</option>
                              <option value="고졸">고졸</option>
                              <option value="전문대졸">전문대졸</option>
                              <option value="4년제졸">4년제졸</option>
                           </select>
                        </c:when>
                        <c:when test="${Apple.academic=='고졸'}">
                           <select name="academic">
                              <option value="중졸">중졸</option>
                              <option value="고졸" selected="selected">고졸</option>
                              <option value="전문대졸">전문대졸</option>
                              <option value="4년제졸">4년제졸</option>
                           </select>
                        </c:when>
                        <c:when test="${Apple.academic=='전문대졸'}">
                           <select name="academic">
                              <option value="중졸">중졸</option>
                              <option value="고졸">고졸</option>
                              <option value="전문대졸" selected="selected">전문대졸</option>
                              <option value="4년제졸">4년제졸</option>
                           </select>
                        </c:when>
                        <c:when test="${Apple.academic=='4년제졸'}">
                           <select name="academic">
                              <option value="중졸">중졸</option>
                              <option value="고졸">고졸</option>
                              <option value="전문대졸">전문대졸</option>
                              <option value="4년제졸" selected="selected">4년제졸</option>
                           </select>
                        </c:when>
                        <c:otherwise>
                           <select name="academic">
                              <option value="중졸">중졸</option>
                              <option value="고졸">고졸</option>
                              <option value="전문대졸">전문대졸</option>
                              <option value="4년제졸">4년제졸</option>
                              <option value="" selected="selected">ERROR</option>
                           </select>
                        </c:otherwise>
                     </c:choose></td>
                  <td>경력</td>
                  <td colspan="2"><input type="text"
                     name="career" style="border: none;" value="${Apple.career}"></td>
               </tr>
            <thead>
               <tr>
                  <th colspan="9">희망근무</th>
               </tr>
            </thead>
            <tr>
               <td style="padding-top: 15px" rowspan="1" colspan="2">직종</td>
               <td colspan="7"><c:choose>
                     <c:when test="${Apple.typeoccup=='매장관리'}">
                        <select name="typeoccup">
                           <option value="매장관리" selected="selected">매장관리</option>
                           <option value="서비스">서비스</option>
                           <option value="교육">교육</option>
                           <option value="생산">생산</option>
                           <option value="사무">사무</option>
                           <option value="주방">주방</option>
                           <option value="서빙">서빙</option>
                           <option value="영업">영업</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.typeoccup=='서비스'}">
                        <select name="typeoccup">
                           <option value="매장관리">매장관리</option>
                           <option value="서비스" selected="selected">서비스</option>
                           <option value="교육">교육</option>
                           <option value="생산">생산</option>
                           <option value="사무">사무</option>
                           <option value="주방">주방</option>
                           <option value="서빙">서빙</option>
                           <option value="영업">영업</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.typeoccup=='교육'}">
                        <select name="typeoccup">
                           <option value="매장관리">매장관리</option>
                           <option value="서비스">서비스</option>
                           <option value="교육" selected="selected">교육</option>
                           <option value="생산">생산</option>
                           <option value="사무">사무</option>
                           <option value="주방">주방</option>
                           <option value="서빙">서빙</option>
                           <option value="영업">영업</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.typeoccup=='생산'}">
                        <select name="typeoccup">
                           <option value="매장관리">매장관리</option>
                           <option value="서비스">서비스</option>
                           <option value="교육">교육</option>
                           <option value="생산" selected="selected">생산</option>
                           <option value="사무">사무</option>
                           <option value="주방">주방</option>
                           <option value="서빙">서빙</option>
                           <option value="영업">영업</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.typeoccup=='사무'}">
                        <select name="typeoccup">
                           <option value="매장관리">매장관리</option>
                           <option value="서비스">서비스</option>
                           <option value="교육">교육</option>
                           <option value="생산">생산</option>
                           <option value="사무" selected="selected">사무</option>
                           <option value="주방">주방</option>
                           <option value="서빙">서빙</option>
                           <option value="영업">영업</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.typeoccup=='주방'}">
                        <select name="typeoccup">
                           <option value="매장관리">매장관리</option>
                           <option value="서비스">서비스</option>
                           <option value="교육">교육</option>
                           <option value="생산">생산</option>
                           <option value="사무">사무</option>
                           <option value="주방" selected="selected">주방</option>
                           <option value="서빙">서빙</option>
                           <option value="영업">영업</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.typeoccup=='서빙'}">
                        <select name="typeoccup">
                           <option value="매장관리">매장관리</option>
                           <option value="서비스">서비스</option>
                           <option value="교육">교육</option>
                           <option value="생산">생산</option>
                           <option value="사무">사무</option>
                           <option value="주방">주방</option>
                           <option value="서빙" selected="selected">서빙</option>
                           <option value="영업">영업</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.typeoccup=='영업'}">
                        <select name="typeoccup">
                           <option value="매장관리">매장관리</option>
                           <option value="서비스">서비스</option>
                           <option value="교육">교육</option>
                           <option value="생산">생산</option>
                           <option value="사무">사무</option>
                           <option value="주방">주방</option>
                           <option value="서빙">서빙</option>
                           <option value="영업" selected="selected">영업</option>
                        </select>
                     </c:when>
                     <c:otherwise>
                        <select name="typeoccup">
                           <option value="매장관리">매장관리</option>
                           <option value="서비스">서비스</option>
                           <option value="교육">교육</option>
                           <option value="생산">생산</option>
                           <option value="사무">사무</option>
                           <option value="주방">주방</option>
                           <option value="서빙">서빙</option>
                           <option value="영업">영업</option>
                           <option value="" selected="selected">ERROR</option>
                        </select>
                     </c:otherwise>
                  </c:choose></td>
            </tr>
            <tr>
               <td style="padding-top: 15px" rowspan="1" colspan="2">기간</td>
               <td colspan="2"><c:choose>
                     <c:when test="${Apple.period=='하루'}">
                        <select name="period">
                           <option value="하루" selected="selected">하루</option>
                           <option value="일주일">일주일</option>
                           <option value="1개월">1개월이상</option>
                           <option value="3개월">3개월이상</option>
                           <option value="6개월">6개월이상</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.period=='일주일'}">
                        <select name="period">
                           <option value="하루">하루</option>
                           <option value="일주일" selected="selected">일주일</option>
                           <option value="1개월">1개월이상</option>
                           <option value="3개월">3개월이상</option>
                           <option value="6개월">6개월이상</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.period=='1개월이상'}">
                        <select name="period">
                           <option value="하루">하루</option>
                           <option value="일주일">일주일</option>
                           <option value="1개월이상" selected="selected">1개월이상</option>
                           <option value="3개월이상">3개월이상</option>
                           <option value="6개월이상">6개월이상</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.period=='3개월이상'}">
                        <select name="period">
                           <option value="하루">하루</option>
                           <option value="일주일">일주일</option>
                           <option value="1개월이상">1개월이상</option>
                           <option value="3개월이상" selected="selected">3개월이상</option>
                           <option value="6개월이상">6개월이상</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.period=='6개월이상'}">
                        <select name="period">
                           <option value="하루">하루</option>
                           <option value="일주일">일주일</option>
                           <option value="1개월이상">1개월이상</option>
                           <option value="3개월이상">3개월이상</option>
                           <option value="6개월이상" selected="selected">6개월이상</option>
                        </select>
                     </c:when>
                     <c:otherwise>
                        <select name="period">
                           <option value="일주일">일주일</option>
                           <option value="1개월이상">1개월이상</option>
                           <option value="3개월이상">3개월이상</option>
                           <option value="6개월이상">6개월이상</option>
                           <option value="" selected="selected">ERROR</option>
                        </select>
                     </c:otherwise>
                  </c:choose></td>
               <td style="padding-top: 15px" rowspan="1" colspan="2">요일</td>
               <td colspan="3"><c:choose>
                     <c:when test="${Apple.dow=='평일'}">
                        <select name="dow">
                           <option value="평일" selected="selected">평일</option>
                           <option value="주말">주말</option>
                           <option value="금,토,일">금,토,일</option>
                           <option value="월,수,금">월,수,금</option>
                           <option value="화,목">화,목</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.dow=='주말'}">
                        <select name="dow">
                           <option value="평일">평일</option>
                           <option value="주말" selected="selected">주말</option>
                           <option value="금,토,일">금,토,일</option>
                           <option value="월,수,금">월,수,금</option>
                           <option value="화,목">화,목</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.dow=='금,토,일'}">
                        <select name="dow">
                           <option value="평일">평일</option>
                           <option value="주말">주말</option>
                           <option value="금,토,일" selected="selected">금,토,일</option>
                           <option value="월,수,금">월,수,금</option>
                           <option value="화,목">화,목</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.dow=='월,수,금'}">
                        <select name="dow">
                           <option value="평일">평일</option>
                           <option value="주말">주말</option>
                           <option value="금,토,일">금,토,일</option>
                           <option value="월,수,금" selected="selected">월,수,금</option>
                           <option value="화,목">화,목</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.dow=='화,목'}">
                        <select name="dow">
                           <option value="평일">평일</option>
                           <option value="주말">주말</option>
                           <option value="금,토,일">금,토,일</option>
                           <option value="월,수,금">월,수,금</option>
                           <option value="화,목" selected="selected">화,목</option>
                        </select>
                     </c:when>
                     <c:otherwise>
                        <select name="dow">
                           <option value="평일">평일</option>
                           <option value="주말">주말</option>
                           <option value="금,토,일">금,토,일</option>
                           <option value="월,수,금">월,수,금</option>
                           <option value="화,목">화,목</option>
                           <option value="" selected="selected">ERROR</option>
                        </select>
                     </c:otherwise>
                  </c:choose></td>
            </tr>
            <tr>
               <td style="padding-top: 15px" rowspan="1" colspan="2">시간</td>
               <td colspan="2" bgcolor="white"><c:choose>
                     <c:when test="${Apple.timetotime=='1-3시간'}">
                        <select name="timetotime">
                           <option value="1-3시간" selected="selected">1-3시간</option>
                           <option value="3-6시간">3-6시간</option>
                           <option value="6-8시간">6-8시간</option>
                           <option value="10시간이상">10시간이상</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.timetotime=='3-6시간'}">
                        <select name="timetotime">
                           <option value="1-3시간">1-3시간</option>
                           <option value="3-6시간" selected="selected">3-6시간</option>
                           <option value="6-8시간">6-8시간</option>
                           <option value="10시간이상">10시간이상</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.timetotime=='6-8시간'}">
                        <select name="timetotime">
                           <option value="1-3시간">1-3시간</option>
                           <option value="3-6시간">3-6시간</option>
                           <option value="6-8시간" selected="selected">6-8시간</option>
                           <option value="10시간이상">10시간이상</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.timetotime=='10시간이상'}">
                        <select name="timetotime">
                           <option value="1-3시간">1-3시간</option>
                           <option value="3-6시간">3-6시간</option>
                           <option value="6-8시간">6-8시간</option>
                           <option value="10시간이상" selected="selected">10시간이상</option>
                        </select>
                     </c:when>
                     <c:otherwise>
                        <select name="timetotime">
                           <option value="1-3시간">1-3시간</option>
                           <option value="3-6시간">3-6시간</option>
                           <option value="6-8시간">6-8시간</option>
                           <option value="10시간이상">10시간이상</option>
                           <option value="" selected="selected">ERROR</option>
                        </select>
                     </c:otherwise>
                  </c:choose></td>
               <td style="padding-top: 15px" rowspan="1" colspan="2">지역</td>
               <td colspan="3" bgcolor="white"><c:choose>
                     <c:when test="${Apple.region=='서울'}">
                        <select name="region">
                           <option value="서울" selected="selected">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='경기'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기" selected="selected">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='강원'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원" selected="selected">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='인천'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천" selected="selected">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='충남'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남" selected="selected">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='충북'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북" selected="selected">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='경남'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남" selected="selected">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='경북'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북" selected="selected">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='전남'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남" selected="selected">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='전북'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북" selected="selected">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='광주'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주" selected="selected">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='대구'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구" selected="selected">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='대전'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전" selected="selected">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='세종'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종" selected="selected">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='울산'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산" selected="selected">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='부산'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산" selected="selected">부산</option>
                           <option value="제주">제주</option>
                        </select>
                     </c:when>
                     <c:when test="${Apple.region=='제주'}">
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주" selected="selected">제주</option>
                        </select>
                     </c:when>
                     <c:otherwise>
                        <select name="region">
                           <option value="서울">서울</option>
                           <option value="경기">경기</option>
                           <option value="강원">강원</option>
                           <option value="인천">인천</option>
                           <option value="충남">충남</option>
                           <option value="충북">충북</option>
                           <option value="경남">경남</option>
                           <option value="경북">경북</option>
                           <option value="전남">전남</option>
                           <option value="전북">전북</option>
                           <option value="광주">광주</option>
                           <option value="대구">대구</option>
                           <option value="대전">대전</option>
                           <option value="세종">세종</option>
                           <option value="울산">울산</option>
                           <option value="부산">부산</option>
                           <option value="제주">제주</option>
                           <option value="" selected="selected">ERROR</option>
                        </select>
                     </c:otherwise>
                  </c:choose></td>
            </tr>
         
                <thead>
               <tr>
                  <th colspan="9">자기소개서</th>
               </tr>
               <tr>
                 <td colspan="9">
                  <textarea name="selfinfo" rows="30" cols="120" placeholder="지원동기 및 성격 등에 대해 서술하시오(1000글자이내)">${Apple.selfinfo}</textarea> </td> 
            
               </tr>
            </thead>
            </tbody>
         </table>
         <br> <br>
         <div align="center">
         <button type="submit" value="Submit">수정하기</button>
      </div>
      </div>
   </form>
   <br>
 <div align="right">
   <c:if test="${loginID!=null}">
         <button onclick="confirmdelete('${Apple.userno}')">삭제</button>
   </c:if>
   </div>
   <br>


</body>
</html>