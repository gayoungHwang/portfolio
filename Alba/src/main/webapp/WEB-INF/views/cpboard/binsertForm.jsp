<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 글 등록 하기</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<style>
#contentForm {
	width: 40%;
	margin: 0 auto;
	padding-top: 12%;
}

.table>thead>tr>th, .table>tbody>tr>th {
	background-color: #FFE5C2;
	text-align: center;
}
</style>

</head>

<body>

	<form action="binsert" method="post">
		<div id="contentForm">

			<input type="hidden" name="pid" value="${hyejin.pid}">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">

				<thead>
					<tr>
						<th width="30%">작성자</th>
						<td width="70%">${ploginID}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="padding-top: 15px">제목</th>
						<td><input type="text" name="title" value="${hyejin.title}"
							class="form-control" aria-describedby="basic-addon1"></td>
					</tr>

					<tr height="400" valign="top">
						<td colspan="4"><textarea name="content" rows="30" cols="100"
								placeholder="글 내용을 입력하세요"></textarea></td>
					</tr>

				</tbody>

			</table>
			<div align="right">

				<input type="submit" value="글등록">&nbsp; <a href="blist"><input
					type="button" value="글목록"></a>&nbsp;

			</div>
		</div>
	</form>
	<br>

</body>
</html>