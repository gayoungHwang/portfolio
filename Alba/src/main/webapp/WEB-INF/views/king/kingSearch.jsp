<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Karma">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<title>** 관리자 -> 구인자 회원목록 **</title>
</head>

<style>
#container {
   width: 30%;
   margin: 0 auto; /* 가로로 중앙에 배치 */
   padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */
}

a {
   text-decoration: none;
}

/* Bootstrap 수정 */
.table>thead {
   background-color:#FFE5C2;
}

.table>thead>tr>th {
   text-align: center;
}

.table-hover>tbody>tr:hover {
   background-color: #FDF5E6;
}

.table>tbody>tr>td {
   text-align: center;
}

.table>tbody>tr>#title {
   text-align: left;
}
</style>

<body> 
         <table class="table table-striped table-bordered table-hover">
            <thead>
               <tr>
                  <th>ID</th>
                  <th>이름</th>
                  <th>업체명</th>
                  <th>사업자번호</th>
                  <th>이메일</th>
               </tr>
            </thead>

            <tbody>
               <c:forEach var="kk" items="${Apple}">


                  <input type="hidden" id="kid" name="kid" value="${kk.kid}">

                  <tr onclick="location.href='kdetail?kid=${kk.kid}'" onmouseover="this.style.backgroundColor='#FFE6E6'"
                     onmouseout="this.style.backgroundColor=''">

                     <td>${kk.kid}</td>
                     <td>${kk.kname}</td>
                     <td>${kk.bname}</td>
                     <td>${kk.bNumber}</td>
                     <td>${kk.email}</td>

                  </tr>

               </c:forEach>
            </tbody>

         </table>
         <br>

         <div id="paging" align="center">
            <div align="center">


               <c:choose>
                  <c:when test="${sPage > perPageNo}">
                     <a href="klist?currPage=1"> 〈〈 </a>&nbsp;
          <a href="klist?currPage=${sPage-1}">〈 </a>&nbsp;
       </c:when>
                  <c:otherwise>
          〈〈&nbsp;〈 &nbsp;&nbsp;
       </c:otherwise>
               </c:choose>

               <c:if test="${totalPage < ePage}">
                  <c:set var="ePage" value="${totalPage}"></c:set>
               </c:if>
               <c:forEach var="i" begin="${sPage}" end="${ePage}">
                  <c:choose>
                     <c:when test="${i==currPage}">
                        <font size="5" color="Orange">${i}</font>&nbsp;
          </c:when>
                     <c:otherwise>
                        <a href="klist?currPage=${i}">${i}</a>&nbsp;
          </c:otherwise>
                  </c:choose>
               </c:forEach>

               <c:choose>
                  <c:when test="${totalPage==ePage}">
            〉&nbsp; 〉〉&nbsp;&nbsp;
       </c:when>
                  <c:otherwise>
                     <a href="klist?currPage=${ePage+1}"> 〉</a>&nbsp;
          <a href="klist?currPage=${totalPage}"> 〉〉</a>&nbsp;
       </c:otherwise>
               </c:choose>
            </div>
         </div>
         <div align="right">
            <a href="#" onclick="history.back()"><button value='button'>뒤로
                  가기</button></a><br>
            <br>

         </div>
 
</body>
</html>