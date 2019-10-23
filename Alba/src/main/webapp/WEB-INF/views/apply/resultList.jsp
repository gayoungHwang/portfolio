<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>** 합격자 조회 **</title>
<style>

.row {display: table-row; width:800;}
.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD; color:black;}

.col1 { width: 20%;}
.col2 {width: 20%;}
.col3 {width: 15%;}
.col4 {width: 15%;}
.col5 {width: 15%;}

</style>
</head>
<body>
<div id="container" class="w3-main w3-content w3-padding"
      style="max-width: 1200px; margin-top: 100px; width: 1000px;">
   <div id="container" class="w3-main w3-content w3-padding"
      style="max-width: 1200px; margin-top: 100px; width: 1000px;">
      <div class="row">
      <span class="cell col1">업체 이미지</span>
      <span class="cell col2">업체명</span>
      <span class="cell col3">직종</span>
      <span class="cell col4">마감일</span>
      <span class="cell col5">결과</span>
   
      </div>
   
      <c:forEach var="rr" items="${Apple}"> 
        <c:if test="${rr.pno==Pno}"> 
      <div class="row">
      <span class="cell col1"><img src="${rr.mainimage}" alt="Norway" style="width:100%" width="30" height="50"></span>
      <span class="cell col2">${rr.bname}</span>
      <span class="cell col3">${rr.typeoccup}</span>
      <span class="cell col4">${rr.deadline}</span>
      <span class="cell col5" ><font color="red">${rr.passcheck}</font></span>
      <input type="hidden" value="${rr.kno}">
      <input type="hidden" value="${rr.ano}">
      
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
        <c:if test="${rr.passcheck=='합격'}">
            <a href="relist?kno=${rr.kno}&bname=${rr.bname}&ano=${rr.ano}"><b>면접 예약</b></a>
        </c:if>
      
        <c:if test="${rr.passcheck!='합격'}">
         
        </c:if>
   
      </div>
      </c:if>
      </c:forEach>
</div>
</div>
</body>
</html>