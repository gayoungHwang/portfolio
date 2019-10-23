<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
  
    #container {
 
      width: 30%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }

  #custom-search-input{
  
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
   
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
   
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{

    font-size: 15px;
}
    /* Bootstrap 수정 */
    .table > thead {
      background-color:#FFE5C2;
      height:5px;
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
    
  
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
     
   
    

  </style>
  <script>
  function confirmdelete(bno){
       if(confirm('정말 삭제하시겠습니까?')== true){
           location.href='ndelete?bno='+bno;  
       }else{
          return false;
       }
    }//confirmTest
    
    function ndetail(index){
        var bno = $('#bno'+index).val();
     
         location.href='ndetail?bno='+bno;
          
     }
  
  </script>
<meta charset="UTF-8">
<title>공고 목록</title>
</head>
<body>
<div id="container" class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;width:1000px;">

<table class="table table-striped table-bordered table-hover">
<thead>
        <tr>
            <th width="10%">업체명</th>
            <th width="10%">시급</th>
            <th width="10%">직종</th>
            <th width="5%">기간</th>
            <th width="5%">요일</th>
            <th width="10%">시간</th>
            <th width="10%">주소</th>
            <th width="5%"></th>
                   
        </tr>
</thead>
 <tbody>
<c:forEach var="nn" items="${Apple}"  varStatus="vs">
   
   <c:if test="${nn.kno==Kno}"> 
     <input type="hidden" id="bno${vs.index}" name="bno" value="${nn.bno}">
   <tr>
   
   <td onclick="ndetail(${vs.index})">${nn.bname}</td>  
   <td onclick="ndetail(${vs.index})"> <fmt:formatNumber value="${nn.pay}" pattern="##,###,###"/></td>
   <td onclick="ndetail(${vs.index})">${nn.typeoccup}</td>
   <td onclick="ndetail(${vs.index})">${nn.period}</td>
   <td onclick="ndetail(${vs.index})">${nn.dow}</td>
   <td onclick="ndetail(${vs.index})">${nn.timetotime}</td>
   <td onclick="ndetail(${vs.index})">${nn.region}</td>
   
   
  <td><button onclick="confirmdelete('${nn.bno}')">삭제</button></td>
  </tr>
  
</c:if>
</c:forEach>
</tbody>
</table><br>
<a href="#" onclick="history.back()"><button type=button >뒤로가기</button></a> <br><br>
</div>

</body>
</html>