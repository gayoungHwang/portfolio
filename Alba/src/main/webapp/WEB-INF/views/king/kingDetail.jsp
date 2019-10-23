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
function confirmdelete(kid){
    if(confirm('정말 탈퇴하시겠습니까?')== true){
        location.href='kdelete?kid='+kid;  
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
  .table > tr > td {
      text-align: center;
       color: black;
    }
    
    .table > tr {
      text-align: center;
       color: black;
    }      
</style>
<title>** King Detail, Update **</title>
</head>
<body>
<div id="container" class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;width:1000px;">
<div align=center>
<form action="kupdate" method="post">
<table >
<tr height="40"><td bgcolor="#FFE5C2">아이디</td>
   <td><input type="text" name="kid" value="${Apple.kid}" readonly="readonly"></td></tr>
<tr height="40"><td bgcolor="#FFE5C2">비밀번호</td>
   <td><input type="password" name="kpw" value="${Apple.kpw}"><br>
   <span id=pMessage></span></td></tr>
<tr height="40"><td bgcolor="#FFE5C2">성명</td>
   <td><input type="text" name="kname" value="${Apple.kname}"></td></tr>
<tr height="40"><td bgcolor="#FFE5C2" >업체명</td>
    <td><input type="text" id="bname" name="bname" value="${Apple.bname}"></td></tr>
 <tr height="40"><td bgcolor="#FFE5C2" >사업자번호</td>
    <td><input type="text" id="bNumber" name="bNumber" value="${Apple.bNumber}"></td></tr>
<tr height="40"><td bgcolor="#FFE5C2" >주소</td>
    <td><input type="text" id="addr" name="addr" value="${Apple.addr}"></td></tr>
<tr height="40"><td bgcolor="#FFE5C2" >이메일</td>
    <td><input type="text" id="email" name="email" value="${Apple.email}"></td></tr>   

   
<tr><td></td><td><input type="submit" value="수정">
                 <input type="reset" value="Reset"></td>   
</table>
</form>
<br>
<c:if test="${loginID=='admin' || kloginID==Apple.kid}">
   <button onclick="confirmdelete('${Apple.kid}')">회원탈퇴</button>
</c:if>
</div>
</div>
</body>
</html>