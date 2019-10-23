<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
#container {
	width: 30%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */
}

.table>thead {
	background-color: #FFE5C2;
}

.table-hover>tbody>tr:hover {
	background-color: #FDF5E6;
}

.table>thead>tr>th {
	text-align: center;
	color: black;
}

.table>tbody>tr>td {
	text-align: center;
	color: black;
}

a {
	text-decoration: none;
}
</style>
<script>
  function confirmdelete(ano){
       if(confirm('정말 삭제하시겠습니까?')== true){
           location.href='adelete?ano='+ano;  
       }else{
          return false;
       }
    }
  </script>
<meta charset="UTF-8">
<title>내 지원 현황</title>
</head>
<body>
	<div id="container" class="w3-main w3-content w3-padding"
		style="max-width: 1200px; margin-top: 100px; width: 1000px;">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th width="10%">업장명</th>
					<th width="5%">시급</th>
					<th width="10%">직종</th>
					<th width="5%">기간</th>
					<th width="5%">요일</th>
					<th width="10%">시간</th>
					<th width="20%">주소</th>
					<th width="20%">제출날짜</th>
					<th width="20%">마감날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="aa" items="${Apple}">
					<c:if test="${ploginID!=null}">
						<c:if test="${aa.pno==Pno}">
							<input type="hidden" id="ano" name="ano" value="${aa.ano}">
							<tr>

								<td>${aa.bname}</td>
								<td>${aa.pay}</td>
								<td>${aa.typeoccup}</td>
								<td>${aa.period}</td>
								<td>${aa.dow}</td>
								<td>${aa.timetotime}</td>
								<td>${aa.region}</td>
								<td>${aa.subd}</td>
								<td>${aa.deadline}</td>
								<c:if test="${aa.fCode=='AT'}">
								<td><button type="button"
										onclick="confirmdelete('${aa.ano}')">지원취소</button></td>
								</c:if>
								<c:if test="${aa.fCode=='BT'}">
								<td><button type="button" disabled="disabled">공고마감</button></td>
								</c:if>
							</tr>
						</c:if>
					</c:if>

					<!-- 관리자 -->
					<c:if test="${loginID!=null}">
						<tr>
							<td>${aa.bname}</td>
							<td>${aa.pay}</td>
							<td>${aa.typeoccup}</td>
							<td>${aa.period}</td>
							<td>${aa.dow}</td>
							<td>${aa.timetotime}</td>
							<td>${aa.region}</td>
							<td>${aa.subd}</td>
							<td>${aa.deadline}</td>
							<td><button type="button"
									onclick="confirmdelete('${aa.ano}')">지원취소</button></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br> <a href="#" onclick="history.back()"><button
				value='뒤로 가기'>뒤로 가기</button></a><br>
		<br>
	</div>
	<br>

</body>
</html>