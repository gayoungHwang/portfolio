<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ID 중복 확인 **</title>
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/inCheck0.js"></script>
<script>
   function idOk(){
      //joinForm(parent window : opener)으로 id를 전달하고 ,
      //현재의 창은 닫는다.
      opener.document.getElementById('kid').value="${kid}";
      opener.document.getElementById('sss').disabled="";
      opener.$('#kid').prop("readonly",true);
      opener.$('#password').focus();
      self.close();
   }//idOk
   //=> attr()는 HTML의 속성을 취급
   //=> prop()는 JavaScript의 프로퍼티를 취급
   
</script>
<style>
   body{
   background-color:#FAC1C1;
   font-size:12px;
      }
   
</style>
</head>

<body>

<h3><b>** ID 중복 확인 **</b></h3>
<form action="kidcheck" method="get">
User ID :
<input type="text" id="kid" name="kid" value="">
<input type="submit" value="ID 중복확인" onclick="return idCheck()">
<br><hr><br>
<div>
   <c:if test="${idCheck=='T'}">   
      ${kid} 는 사용가능한 ID 입니다.
      <input type="button" value="아이디 사용" onclick="idOk()">
   </c:if>
   <c:if test="${idCheck!='T'}">   
      ${kid} 는 사용 불가능한 ID 입니다.<br>
      다시 선택 하세요! <br>
      <!-- 부모창의 id 값을 clear 하려면? -> only JS만 가능 -->
      <script>
      opner.document.getElementById('kid').value="";
      </script>
   </c:if>
</div>

</form>

</body>
</html>