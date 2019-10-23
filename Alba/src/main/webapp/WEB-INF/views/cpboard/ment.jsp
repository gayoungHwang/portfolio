<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>          
      <c:forEach var="bb"  items="${yerim}" varStatus="vs" >
      <c:if test="${bb.seq==Seq}">
   
          <div style="border-bottom:1px solid darkgray; margin-bottom: 15px;">
          <div>댓글 작성자: ${bb.pid}</div>
        
          <div id='content${vs.index}'>${bb.content}</div>
         
           <c:if test="${bb.pid==ploginID}">
           
          <div align="right">
          <a href="#" id='${vs.index}' onclick="mUpdatef('${bb.mno}', '${vs.index}', '${bb.content}'); return false;">수정</a>
          <a href="#" id='ment_delete' onclick="mdelete">삭제</a>
          </div>
          </c:if>
  
          <div>${bb.regdate}</div>
       
          </div>
       </c:if> 
       </c:forEach>
</table>
</body>
</html>