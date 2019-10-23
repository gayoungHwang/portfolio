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
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
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
    }
    .table > thead > tr > th {
      text-align: center;
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
     
    div > #paging {
      text-align: center;
    }    

</style>


<meta charset="UTF-8">
<title>공고 목록</title>
</head>
<body>


<table class="table table-striped table-bordered table-hover">
<thead>
<tr>
			<th width="10%">업체명</th>
            <th width="10%">시급</th>
            <th width="10%">직종</th>
            <th width="10%">기간</th>
            <th width="10%">요일</th>
            <th width="10%">시간</th>
            <th width="20%">주소</th>
            <th width="20%">마감일</th>
</tr>
</thead>
<tbody>
<c:forEach var="nn" items="${Apple}">
   <tr onclick="window.location.replace('pndetail?bno=${nn.bno}')" >
   
   <td>${nn.bname}</td>  
   <td> <fmt:formatNumber value="${nn.pay}" pattern="##,###,###"/></td>
   <td>${nn.typeoccup}</td>
   <td>${nn.period}</td>
   <td>${nn.dow}</td>
   <td>${nn.timetotime}</td>
   <td>${nn.region}</td>
   <td>${nn.deadline}</td>
   </tr>
</c:forEach>
</tbody>
</table><br>
 <div id="paging" align="center">
 <c:choose>
       <c:when test="${sPage > perPageNo}">
          <a href="nlist?currPage=1"> 〈〈  </a>&nbsp;
          <a href="nlist?currPage=${sPage-1}">〈 </a>&nbsp;
       </c:when>
       <c:otherwise>
          〈〈&nbsp;〈 &nbsp;&nbsp;
       </c:otherwise>
    </c:choose>
    
    <c:if test="${totalPage < ePage}">
       <c:set var="ePage" value="${totalPage}"></c:set>
    </c:if>
    <c:forEach var="i" begin="${sPage}" end="${ePage}">
       <c:choose>
          <c:when test="${i==currPage}">
             <font size="5" color="Orange">${i}</font>&nbsp;
          </c:when>
          <c:otherwise>
             <a href="nlist?currPage=${i}">${i}</a>&nbsp;
          </c:otherwise>
       </c:choose>
    </c:forEach>
    
    <c:choose>
       <c:when test="${totalPage==ePage}">
            〉&nbsp; 〉〉&nbsp;&nbsp;
       </c:when>
       <c:otherwise>
          <a href="nlist?currPage=${ePage+1}">  〉</a>&nbsp;
          <a href="nlist?currPage=${totalPage}"> 〉〉</a>&nbsp;
       </c:otherwise>
    </c:choose>
    <br>
<div align="left">
<a href="#" onclick="history.back()"><button type=button >뒤로가기</button></a> <br><br>
</div>
</div>

</body>
</html>