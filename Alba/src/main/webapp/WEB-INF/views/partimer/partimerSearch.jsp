<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">

<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<title>** 관리자 -> 구직자 회원목록 **</title>
</head>

<style>

      #container {
 
      width: 30%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
   
 
 a{text-decoration:none;}
 
  /* Bootstrap 수정 */
    .table > thead {
      background-color: #FFE5C2;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #FDF5E6;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }

</style>

<body>

<table class="table table-striped table-bordered table-hover">
<thead>
<tr>
            <th width="20%">아이디</th>
            <th width="20%">이름</th>
            <th width="20%">나이</th> 
            <th width="20%">성별</th>
            <th width="70%">이메일</th>
           
</tr>
</thead>

       <tbody>
<c:forEach var="pp" items="${Apple}">
   

     <input type="hidden" id="pid" name="pid" value="${pp.pid}">
     
   <tr onclick="location.href='pdetail?pid=${pp.pid}'" onmouseover="this.style.backgroundColor='#FFE6E6'" onmouseout="this.style.backgroundColor=''">

   <td class="detail">${pp.pid}</td>  
   <td class="detail">${pp.pname}</td>
   <td class="detail">${pp.age}</td>
   <td class="detail">${pp.gender}</td>
   <td class="detail">${pp.email}</td>
   
   </tr>

</c:forEach>
</tbody>

</table><br>

 <div id="paging" align="center">
 <div align="center">


    <c:choose>
       <c:when test="${sPage > perPageNo}">
          <a href="plist?currPage=1"> 〈〈  </a>&nbsp;
          <a href="plist?currPage=${sPage-1}">〈 </a>&nbsp;
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
             <a href="plist?currPage=${i}">${i}</a>&nbsp;
          </c:otherwise>
       </c:choose>
    </c:forEach>
    
    <c:choose>
       <c:when test="${totalPage==ePage}">
            〉&nbsp; 〉〉&nbsp;&nbsp;
       </c:when>
       <c:otherwise>
          <a href="plist?currPage=${ePage+1}">  〉</a>&nbsp;
          <a href="plist?currPage=${totalPage}"> 〉〉</a>&nbsp;
       </c:otherwise>
    </c:choose>
 </div> 
 </div>
 <div align="right">
 <a href="#" onclick="history.back()"><button value='button'>뒤로 가기</button></a><br><br>


</div>

</body>
</html>