<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma"> -->
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<meta name="format-detection" content="telephone=no" />
     <link rel="icon" href="resources/images/favicon.ico">
     <link rel="shortcut icon" href="images/favicon.ico" />
     <link rel="stylesheet" href="resources/css/slippry.css">
     <link rel="stylesheet" href="resources/css/elastislide.css" />
     <link rel="stylesheet" href="resources/css/style.css">
     <script src="resources/js/jquery.js"></script>
     <script src="resources/js/jquery-migrate-1.1.1.js"></script>
     <script src="resources/js/script.js"></script> 
     <script src="resources/js/superfish.js"></script>
     <script src="resources/js/jquery.equalheights.js"></script>
     <script src="resources/js/jquery.easing.1.3.js"></script>
     <script src="resources/js/slippry.js"></script>
     <script src="resources/jsLib/axlogin.js"></script>  
<style>
/*   a {text-decoration: none;}
  span {font-family: "a옛날목욕탕B";} */
</style>
<body>
	<div class="container_12">
		<div class="grid_12">
			<div align="center">
				<a href="mainf"><img src="resources/image/albaexit.png"></a>
				<c:if test="${kloginID!=null}">
					<div align="right" style="font-size: 13px; margin-top: 10px;">${kloginID}
						님 <a href="logout"><img src="resources/image/logout.gif"></a>&nbsp;&nbsp;
					</div>
				</c:if>
			</div>

			<div class="menu_block">
				<nav class="horizontal-nav full-width horizontalNav-notprocessed">
					<ul class="sf-menu">

						<li><a href="noticef"><font color="#B8B8B8">공고 등록</font></a></li>
						<li><a href="nlist2"><font color="#B8B8B8">나의 공고
									목록</font></a></li>
						<li><a href="rlist2"><font color="#B8B8B8">이력서 검색</font></a></li>
						<li><a href="mrlist"><font color="#B8B8B8">지원 현황</font></a></li>
						<li><a href="kdetail"><font color="#B8B8B8">마이페이지</font></a></li>
						<li><a href="krelist"><font color="#B8B8B8">예약 조회</font></a></li>
					</ul>
				</nav>
				<div class="clear"></div>
			</div>
			<br>

		</div>
	</div>

</body>
</html>