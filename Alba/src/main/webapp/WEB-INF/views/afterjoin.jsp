<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/axlogin.js"></script>   
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="container" class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;width:1000px;">
<div id="resultArea">

<div align="center">
 <c:if test="${fCode=='PJS'}">
   회원가입이 성공하였습니다!<br>
   <i>${pjoinID}</i>님, 환영합니다!<br>
  <a href="ploginf"><input id=btn type=button value='구직자로 로그인'></a>&nbsp;
</c:if>
</div>


<div align="center">
<c:if test="${fCode=='KJS'}">
   회원가입이 성공하였습니다!<br>
   <i>${kjoinID}</i>님, 환영합니다!<br>
    <a href="kloginf"><input id=btn type=button value='구인자로 로그인'></a>&nbsp;
</c:if>
</div>


</div>
</div>
</body>
</html>