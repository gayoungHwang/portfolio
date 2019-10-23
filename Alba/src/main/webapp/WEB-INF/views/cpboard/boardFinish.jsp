<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>**Board Finish Spring MVC **</title>
</head>
<body>
<h3>** Board Finish Spring MVC **</h3>
<c:if test="${fCode=='I'}">
	<h3> 새 글 입력 실패 했습니다..ㅠㅠ</h3>
		<a href="javascript:history.go(-1)">[다시 하기]</a> 
</c:if>
<c:if test="${fCode=='U'}">
	<h3> 글수정에 실패 했습니다..ㅠㅠ</h3>
		<a href="javascript:history.go(-1)">[다시 하기]</a> 
</c:if>
<c:if test="${fCode=='D'}">
	<h3> 글 삭제에 실패 했습니다..ㅠㅠ</h3>
		<a href="javascript:history.go(-1)">[다시 하기]</a> 
</c:if>



<br>
<a href="blist">게시판</a>&nbsp;&nbsp;
<a href="home">홈</a>&nbsp;&nbsp;

</body>
</html>