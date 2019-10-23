<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구 직 자 화 면</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>   
<script src="resources/jsLib/axlogin2.js"></script>
<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script> 
<!-- <script src="http://code.jquery.com/jquery.com/jquery-latest.js"></script> -->
<script>
  $(function(){
	  $("#find_pid_btn").click(function(){
		  location.href="find_pid_form";
	  })
	  
  })
  
  $(function(){
	  $("#find_ppw_btn").click(function(){
		  location.href="find_ppw_form";
	  })
	  
  })

</script>
<style>
body,h1,h2,h3,h4,h5,h6 {font: "a옛날목욕탕B";}
span {font: "a옛날목욕탕B";}
</style>
</head>
<br><br>
<body>

<div id="resultArea">
<br><br><br><br><br>
<c:if test="${fail=='idError'}">
	<script>
	   swal('','아이디를  확인하세요.','error');
		$('#pid').focus();
	</script>
</c:if>
<c:if test="${fail1=='true'}">
	<script>
	   swal('','이메일 인증을 확인해주세요','error');
		$('#pid').focus();
	</script>
</c:if>
<c:if test="${fail=='pwError'}">
	<script>
	   swal('','패스워드를 확인하세요','error');
		$('#ppw').focus();
	</script>
</c:if>
<div class="w3-content w3-container w3-margin-top" style="max-width:900px;margin-top:100px;">
	<div class="w3-container w3-card-4">
		<div>
 			<form action="plogin" method="post">
 		<p>
 		 <label>ID</label>
 			<span class="w3-right w3-button w3-hover-white" title="아이디 찾기" id="find_pid_btn">
				<i class="fa fa-exclamation-triangle w3-hover-text-red w3-large"></i>
			</span>
    		<input class="w3-input" type="text" name="pid" id="pid" placeholder="아이디" required >
    	</p>
    	
    	<p>
 		 <label>Password</label>
 			<span class="w3-right w3-button w3-hover-white" title="비밀번호 찾기" id="find_ppw_btn">
				<i class="fa fa-exclamation-triangle w3-hover-text-red w3-large"></i>
			</span>
    		<input class="w3-input" type="password" name="ppw" id="ppw" placeholder="비밀번호" required >
    	</p>
    	
    	
   <span><input type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="로그인" ></span>
    <a href="agreef"><input type=button class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value='구직자 회원가입'></a>&nbsp;&nbsp;
</form>


</div>
</div>
</div>
</div>

</body>
</html>