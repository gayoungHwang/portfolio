<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 구인자 회원가입 </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/inCheck3.js"></script>
<script src="resources/jsLib/axlogin2.js"></script>
<script>

function idDupCheck() {
   
   if (idCheck()==false) return ;
   
// window.open()
//=> 자바스크립트에서 새창을 띄워주는 함수
//=> window.open ("[요청명]", "[창이름 또는 로딩되는 창]", "[창 속성]");
   var url='kidcheck?kid='+$('#kid').val();
   window.open(url,"_blank"
      ,"toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=600,height=300");
}; // idDupCheck 
$(function(){
   $('#kid').change(function() {
      document.getElementById('sss').disabled="disabled";
   }) // change
}) //ready

function idCheck(){
   alert("중복 된 ID인지 확인하시겠습니까?");
// id 확인   
   var kid=$('#kid').val();
   // id : 길이확인 (4이하 오류)
   if (kid.length<4) {
      $('#iMessage').text('ID 를 4글자 이상 정확하게 입력 하세요 ~~**') ;
      $('#kid').focus() ;  // 해당태그에 focus In
      return false ;
   }else if (kid.replace(/[a-z.0-9]/gi,'').length>0) {
      $('#iMessage').text('ID 를 영문자와 숫자로만 정확하게 입력 하세요 ~~~') ;
      $('#kid').focus() ;  // 해당태그에 focus In
      return false ;
   }
      $('#iMessage').text('') ;
      return true ;
    
}

// 2. 입력 오류 : 
//=> 입력 했는지 여부 확인하기
//=> password ~ weight
//** 실습 => input Tag 에 id 부여하고 function 작성

</script>
<style>
 td>span {
      color:red; font-style: italic; font-size:x-small;
      }
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
</head>

<body>
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

  <div align="center"id="resultArea" >
  <br><br><br> 
      
<form id=myForm action="kjoin" method="post" enctype="multipart/form-data">
<!-- => enctype="multipart/form-data" : 화일 upload 를 가능하게 해줌 -->
<table>
<tr height="40"><td bgcolor="#FFE5C2">아이디</td>
   <td><input type="text" id="kid" name="kid" value="">
      <input type="button" value="ID 중복확인" onclick="idDupCheck()"><br>
   <span id=iMessage></span></td></tr>
<tr height="40"><td bgcolor="#FFE5C2">비밀번호</td>
   <td><input type="password" id="password" name="kpw" value=""><br>
   <span id=pMessage></span></td></tr>
<tr height="40"><td bgcolor="silver">비밀번호 확인</td>
   <td><input type="password" id="password2" name="kpw2"><br>
   <span id=pwMessage></span></td></tr>
<tr height="40"><td bgcolor="#FFE5C2">성명</td>
   <td><input type="text" id="name" name="kname" value=""><br>
   <span id=nMessage></span></td></tr>
<tr height="40"><td bgcolor="#FFE5C2">업장명</td>
   <td><input type="text" id="bname" name="bname" value=""><br>
   </td></tr>
<tr height="40"><td bgcolor="#FFE5C2" >사업자번호</td>
   <td><input type="text" id="bNumber" name="bNumber" value=""><br>
   </td></tr>
   
<tr height="40"><td bgcolor="#FFE5C2">주소</td>
   <td><input type="text" id="addr" name="addr" value="">  
<br></td></tr>
<tr height="40"><td bgcolor="#FFE5C2">이메일</td>
   <td><input type="text" id="kemail" name="email" value=""><br>
   <span id="kemail_check"></span></td></tr>

<tr><td></td><td><input type="submit" value="가입" onclick="return insertCheck()"
               disabled="disabled" id="sss">
&nbsp;&nbsp;&nbsp;



</table>
</form>
</div>
<!-- End page content -->
</div>

</body>
</html>