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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
       color: black;
    }
    
      .table > tbody > tr > td {
      text-align: center;
      color: black;
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
  <script>
  function confirmdelete(userno){
       if(confirm('정말 삭제하시겠습니까?')== true){
           location.href='rdelete?userno='+userno;  
       }else{
          return false;
       }
    }//confirmTest
    
    function rdetail(index){
        var userno = $('#userno'+index).val();
     
         location.href='rdetail?userno='+userno;
          
     }
  
  </script>
<meta charset="UTF-8">
<title>내 이력서 목록</title>
</head>
<body>
<div id="container" class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;width:1000px;">
<table class="table table-striped table-bordered table-hover">
<thead>
<tr>
            <th width="5%">번호</th>
            <th width="20%">제목</th> 
            <th width="10%">연락처</th>
            <th width="15%">주소</th>
            <th width="10%">학력</th>
            <th width="5%">경력</th>
            <th width="5%">직종</th>
            <th width="5%">기간</th>
            <th width="10%">요일</th>
            <th width="5%">시간</th>
            <th width="10%">근무지역</th>
            <th></th>
</tr>
</thead>
<tbody>
<c:forEach var="rr" items="${Apple}" varStatus="vs">

   <c:if test="${rr.pno==Pno}">
      <input type="hidden" id="userno${vs.index}" name="userno" value="${rr.userno}">
      
   <tr>
   <td onclick="rdetail(${vs.index})">${rr.userno}</td>
   <td onclick="rdetail(${vs.index})">${rr.title}</td>
   <td onclick="rdetail(${vs.index})">${rr.phone}</td>
   <td onclick="rdetail(${vs.index})">${rr.addr}</td>
   <td onclick="rdetail(${vs.index})">${rr.academic}</td>
   <td onclick="rdetail(${vs.index})">${rr.career}</td>
   <td onclick="rdetail(${vs.index})">${rr.typeoccup}</td>
   <td onclick="rdetail(${vs.index})">${rr.period}</td>
   <td onclick="rdetail(${vs.index})">${rr.dow}</td>
   <td onclick="rdetail(${vs.index})">${rr.timetotime}</td>
   <td onclick="rdetail(${vs.index})">${rr.region}</td>

   <td><button onclick="confirmdelete('${rr.userno}')">삭제</button></td>
  </tr>
  
</c:if>
</c:forEach>

</tbody>
 </table><br>
<a href="#" onclick="history.back()"><button value='button'>뒤로 가기</button></a><br><br>
</div>
<br>

</body>
</html>