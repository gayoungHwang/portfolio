 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<title>게시판 글 상세보기화면</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/axment.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script>
	function confirmdelete(seq) {
		if (confirm('정말 삭제하시겠습니까?') == true) {
			location.href = 'bdelete?seq=' + seq;
		} else {
			return false;
		}
	}
</script>
<style>
#contentForm {
	width: 40%;
	margin: 0 auto;
	padding-top: 12%;
	color: black;
}

.table>thead>tr>th, .table>tbody>tr>th {
	background-color: #FFE5C2;
	text-align: center;
}

.myButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #d9fbbe;
	-webkit-box-shadow: inset 0px 1px 0px 0px #d9fbbe;
	box-shadow: inset 0px 1px 0px 0px #d9fbbe;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #b8e356
		), color-stop(1, #a5cc52));
	background: -moz-linear-gradient(top, #b8e356 5%, #a5cc52 100%);
	background: -webkit-linear-gradient(top, #b8e356 5%, #a5cc52 100%);
	background: -o-linear-gradient(top, #b8e356 5%, #a5cc52 100%);
	background: -ms-linear-gradient(top, #b8e356 5%, #a5cc52 100%);
	background: linear-gradient(to bottom, #b8e356 5%, #a5cc52 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#b8e356',
		endColorstr='#a5cc52', GradientType=0);
	background-color: #b8e356;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #83c41a;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #86ae47;
}

.myButton:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #a5cc52
		), color-stop(1, #b8e356));
	background: -moz-linear-gradient(top, #a5cc52 5%, #b8e356 100%);
	background: -webkit-linear-gradient(top, #a5cc52 5%, #b8e356 100%);
	background: -o-linear-gradient(top, #a5cc52 5%, #b8e356 100%);
	background: -ms-linear-gradient(top, #a5cc52 5%, #b8e356 100%);
	background: linear-gradient(to bottom, #a5cc52 5%, #b8e356 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5cc52',
		endColorstr='#b8e356', GradientType=0);
	background-color: #a5cc52;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
</head>

<body>

	<form action="bupdate" method="post">
		<div id="contentForm">

			<input type="hidden" name="seq" value="${hyejin.seq}">

			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">

				<thead>
					<tr>
						<th width="30%">작성자</th>
						<td width="70%">${hyejin.pid}</td>
						<th>조회수</th>
						<td>${hyejin.cnt}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="padding-top: 15px">제목</th>
						<td><c:if test="${hyejin.pid==ploginID}">
								<input type="text" name="title" value="${hyejin.title}"
									class="form-control" aria-describedby="basic-addon1">
							</c:if> <c:if test="${hyejin.pid!=ploginID}">
                  ${hyejin.title}
                  </c:if></td>
						<th>작성날짜</th>
						<td>${hyejin.regdate}</td>
					</tr>


					<tr height="400" valign="top">
						<td colspan="4"><c:if test="${hyejin.pid==ploginID}">
								<textarea name="content" rows="30" cols="100">${hyejin.content}</textarea>
							</c:if> <c:if test="${hyejin.pid!=ploginID}">
								<textarea name="content" rows="30" cols="100"
									readonly="readonly">${hyejin.content}</textarea>
							</c:if></td>
					</tr>

				</tbody>

			</table>
			<div align="right">
				<c:if test="${hyejin.pid==ploginID}">
					<input type="submit" value="글수정">&nbsp;					
					
				</c:if>
				<c:if test="${hyejin.pid==ploginID||loginID!=null}">
					<input type="button" value="삭제"
						onclick="confirmdelete('${hyejin.seq}')">
				</c:if>
				<a href="blist"><input id=btn type=button value='목록'></a>&nbsp;&nbsp;
			</div>
		</div>

		<div align="center">

			<!--  댓글  -->

			<div class="container">
				<label for="content">comment</label>
				<div class="input-group">
					<input type="hidden" id="seq" value="${hyejin.seq}" /> <input
						type="text" class="form-control" id="contentreg"
						placeholder="여러분의 소중한 댓글을 입력해주세요."> <span
						class="input-group-btn"> &nbsp;&nbsp;&nbsp;
						<button class="myButton" type="button" name="mentInsertBtn"
							id="commentlist">등록</button>
					</span>
				</div>
			</div>
			<hr>
		</div>
	</form>
	<div class="container">
		<div id="mentList">

			<div id=resultArea>

				<c:forEach var="bb" items="${yerim}" varStatus="vs">
					<c:if test="${bb.seq==Seq}">

						<div
							style="border-bottom: 1px solid darkgray; margin-bottom: 15px;">
							<div>댓글 작성자: ${bb.pid}</div>

							<div id='content${vs.index}'>${bb.content}</div>

							<c:if test="${bb.pid==ploginID}">

								<div align="right">
									<a href="#" id='${vs.index}'
										onclick="mUpdatef('${bb.mno}', '${vs.index}', '${bb.content}'); return false;">수정</a>
								</div>
							</c:if>

							<c:if test="${bb.pid==ploginID||loginID!=null}">
								<div align="right">
									<a href="#" id='${vs.index}'
										onclick="mdelete('${bb.mno}', '${vs.index}'); return false;">삭제</a>
								</div>
							</c:if>

							<div>${bb.regdate}</div>
						</div>

					</c:if>
				</c:forEach>

			</div>
		</div>
	</div>

</body>
</html>