<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<style> 

 body {
 	background-color:#FFEFEF;
 }
 
  
 #btn { 

  padding: 5px 10px 5px 10px; 
  border: 5px solid pink; 
  background-color:#FFFCFC; 
  border-top-left-radius: 15px; 
  border-top-right-radius: 15px; 
  border-bottom-left-radius: 15px; 
  border-bottom-right-radius: 15px; 
   zoom: 1; 

 } 

 #btn:hover { 

  padding: 5px 10px 5px 10px; 
  border: 5px solid pink; 
  background-color: pink; 
  border-top-left-radius: 15px; 
  border-top-right-radius: 15px; 
  border-bottom-left-radius: 15px; 
  border-bottom-right-radius: 15px; 
  zoom: 1; 
 } 
</style>
<meta charset="UTF-8">
<title>** Member DoFinish Factory**</title>
</head>
<body>
<div align=center>
<h3>*sdgdgj*</h3>
<%-- <c:if test="${fCode=='D'}">
	<h3> 당신의 정보는 없습니다~~~</h3>
	<a href="loginf">로그인 하기</a>
</c:if>
<c:if test="${fCode=='U'}">
	<h3> 정보 수정에 실패했습니다~~~</h3>
	<a href="mlist">memberList</a>
</c:if> --%>
<c:if test="${fCode=='JS'}">
	<h3>${pjoinID} 님 회원 가입 되었습니다~~</h3>
	<a href="home">로그인 하기</a>
</c:if>
<c:if test="${fCode=='JF'}">
	<h3>회원 가입 실패</h3>
	<h3>다시 하시겠습니까 ?</h3>
	<a href="pjoinf">[회원가입]</a>
</c:if>
<c:if test="${fCode=='DS'}">
	<h3>회원 탈퇴 되었습니다~~</h3>
</c:if>
<c:if test="${fCode=='DF'}">
	<h3>회원 탈퇴 실패~~</h3>
</c:if>



<a href="home"><input id=btn type=button value='HOME'></a>&nbsp;&nbsp;
<a href="#" onclick="history.back()"><input id=btn type=button value='TRY AGAIN'></a><br><br>
</div>
</body>
</html>