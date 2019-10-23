<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 자유게시판 검색 폼</title>
  <!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
#container {
	width: 30%;
	margin: 0 auto;
	padding-top: 10%;
}

#custom-search-input {
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
}

#custom-search-input input {
	border: 0;
	box-shadow: none;
}

#custom-search-input button {
	margin: 2px 0 0 0;
	background: none;
	box-shadow: none;
	border: 0;
	color: #666666;
	padding: 0 8px 0 10px;
	border-left: solid 1px #ccc;
}

#custom-search-input button:hover {
	border: 0;
	box-shadow: none;
	border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search {
	font-size: 15px;
}

.table>thead {
	background-color: #FFE5C2;
}

.table>thead>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #FDF5E6;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

div>#paging {
	text-align: center;
}

/* 히트 */
.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
}

@keyframes blink {
	from {color: white;
}

30%
{ color:yellow;}

to {
	color: red;
	font-weight: bold;
}

}
</style>
<meta charset="UTF-8">
<title>게시판 검색창</title>
</head>
<body>

<table class="table table-striped table-bordered table-hover">
  <thead>
          <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="10%">아이디</th>
            <th width="20%">작성일</th>
            <th width="10%">조회</th>
          </tr>
        </thead>
        <tbody>
   <c:forEach var="bb"  items="${hyejin}"  varStatus="status">
     <tr>
      <td>${bb.seq}</td>
      <!-- 조회수 10이상일 경우 hit -->
      <td id="title"><a href="bdetail?seq=${bb.seq}&pno=${bb.pno}&pid=${bb.pid}">${bb.title}</a><c:if test="${bb.cnt >= 10}">
             <span class="hit">hit!</span>
        </c:if>
         </td>
 
      <td>${bb.pid}</td>
      <td>${bb.regdate}</td>
      <td>${bb.cnt}</td>
     </tr>
     
   </c:forEach>
       </tbody>
</table>
 <!-- Paging 처리 -->

<br>

	<div id="paging" align="center">
		<div align="right">
			<c:if test="${ploginID!=null}">
				<a href="binsertf"><input id=btn type=button value='글쓰기'></a>&nbsp;
</c:if>
		</div>
		<c:choose>
			<c:when test="${sPage > perPageNo}">
				<a href="blist?currPage=1"> 〈〈 </a>&nbsp;
          <a href="blist?currPage=${sPage-1}">〈 </a>&nbsp;
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
					<a href="blist?currPage=${i}">${i}</a>&nbsp;
          </c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${totalPage==ePage}">
            〉&nbsp; 〉〉&nbsp;&nbsp;
       </c:when>
			<c:otherwise>
				<a href="blist?currPage=${ePage+1}"> 〉</a>&nbsp;
          <a href="blist?currPage=${totalPage}"> 〉〉</a>&nbsp;
       </c:otherwise>
		</c:choose>
	</div>
	<br>
	<hr>
	<br>

</body>
</html>