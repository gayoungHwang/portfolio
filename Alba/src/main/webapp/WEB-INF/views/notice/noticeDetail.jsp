<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
               const region = data.roadAddress;
               document.getElementById("region").value = region;
            }
         }).open();
      });
   });
   
   function confirmdelete(bno){
       if(confirm('정말 삭제하시겠습니까?')== true){
           location.href='ndelete?bno='+bno;  
       }else{
          return false;
       }
    }//confirmTest
    
</script>
</head>

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
   color: black;
}
</style>

<title>** Notice Update **</title>
<body>


   <form action="nupdate" method="post" enctype="multipart/form-data">
      <div id="contentForm">
      <input type="text" name="bno" value="${Apple.bno}"
            hidden="true">
         <table class="table table-bordered">
            <thead>
               <tr>
                  <th colspan="9">공고 수정</th>
               </tr>
            </thead>
            <tr>
               <th>업체명</th>
               <td><input type="text" name="bname" value="${Apple.bname}"><br></td>
            </tr>
            <tr>

               <th>업체이미지</th>
               <td><img src="${Apple.mainimage}"> <input type="text"
                  name="mainimage" value="${Apple.mainimage}" hidden="true"><br>
                  <input type="file" name="mainimagef"></td>
            </tr>
            <tr>
               <th>급여</th>
               <td><input type="number" name="pay" value="${Apple.pay}"></td>
            </tr>

            <tr>
               <th>근무시간</th>
               <td><c:choose>
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
            </tr>


            <tr>
               <th>직종</th>
               <td><c:choose>
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
               <th>근무기간</th>
               <td><c:choose>
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
                  </c:choose></td></tr>
            <tr>
               <th>근무요일</th>
               
               <td><c:choose>
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
               <th>근무지역</th>
               <td><input type="text" class="addr road-addr" name="region"
                  id="region" value="${Apple.region}">
               <span class="search-addr" id="searchAddr">주소검색</span><br></td>
            </tr>
            <tr>
            <tr>
               <th>상세소개</th>
               <td><textarea name="etc" rows="10" cols="40">${Apple.etc}</textarea><br>
               </td>
            </tr>
            <tr>
               <th>마감일</th>
               <td><input type="date" id="deadline" name="deadline"
                  value="${Apple.deadline}"><br></td>
            <tr>
               <th>keyword1</th>
               <td><input type="text" id="keyword1" name="keyword1"
                  value="${Apple.keyword1}"><br></td>
            </tr>
            <tr>
               <th>keyword2</th>
               <td><input type="text" id="keyword2" name="keyword2"
                  value="${Apple.keyword2}"><br></td>
            </tr>
            <tr>
               <th>keyword3</th>
               <td><input type="text" id="keyword3" name="keyword3"
                  value="${Apple.keyword3}"><br></td>
            </tr>
          </table>
          <div align="center">
           <input type="submit" value="수정하기"> 
           </div>
           &nbsp;&nbsp;
      </div>
   </form>
<div align="center">
<c:if test="${loginID!=null}">
         <button onclick="confirmdelete('${Apple.bno}')">삭제</button>
         </c:if>
 </div>

</body>
</html>