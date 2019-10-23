 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/inCheck.js"></script>

<script>
function confirmdelete(pid){
    if(confirm('정말 탈퇴하시겠습니까?')== true){
        location.href='pdelete?pid='+pid;  
    }else{
       return false;
    }
 }
</script>
<style>
    #container {
 
      width: 30%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
      color: black;
    }
    
    table > tr > td {
      text-align: center;
       color: black;
    }
    
    table > tr {
      text-align: center;
       color: black;
    }     
</style>
<title>** Partimer Detail, Update **</title>
</head>
<body>
<div id="container" class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;width:1000px;">
<div align=center>
<form action="pupdate" method="post">
<table>
<tr height="40"><td bgcolor="#FFE5C2">아이디</td>
   <td><input type="text" name="pid" value="${Apple.pid}" readonly="readonly"></td></tr>
<tr height="40"><td bgcolor="#FFE5C2">비밀번호</td>
   <td><input type="password" name="ppw" value="${Apple.ppw}"><br>
   <span id=pMessage></span></td></tr>
<tr height="40"><td bgcolor="#FFE5C2">성명</td>
   <td><input type="text" name="pname" value="${Apple.pname}"></td></tr>
<tr height="40"><td bgcolor="#FFE5C2" >나이</td>
    <td><input type="number" id="age" name="age" value="${Apple.age}"><br>
   <span id=aMessage></span></td></tr>
   
<tr height="40"><td bgcolor="#FFE5C2" >성별</td>    
   <td><c:choose>
      <c:when test="${Apple.gender=='여'}">
         <select name="gender">
            <option value="여" selected="selected">여</option>
            <option value="남">남</option>            
         </select>
      </c:when>
      <c:when test="${Apple.gender=='남'}">
         <select name="gender">
            <option value="여" >여</option>
            <option value="남" selected="selected">남</option>            
         </select>
      </c:when>
      <c:otherwise>
         <select name="gender">
            <option value="여">여</option>
            <option value="남">남</option>   
            <option value="E" selected="selected">Error</option>
         </select>
      </c:otherwise>
   </c:choose>
   </td></tr>
<tr height="40"><td bgcolor="#FFE5C2">연락처</td>
   <td><input type="text" id="phone" name="phone" value="${Apple.phone}">   
<tr height="40"><td bgcolor="#FFE5C2">이메일</td>
   <td><input type="text" id="email" name="email" value="${Apple.email}">
   
   
<tr><td></td><td><input type="submit" value="수정">
                 <input type="reset" value="Reset"></td>   
</table>
</form>
<br>
<c:if test="${loginID=='admin' || ploginID==Apple.pid}">
   <button onclick="confirmdelete('${Apple.pid}')">회원탈퇴</button>
</c:if>
</div>
</div>
</body>
</html>