<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about 폼</title>
<style>
 h3 { animation-name:textColorAnimation;
         animation-duration:2s;
         animation-iteration-count:infinite;
}

@keyframes textColorAnimation {
   0% { color:pink;}
   30% { color:orange;}
   100% { color: coral;}
}
</style>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>   
<script src="resources/jsLib/axlogin2.js"></script>
<body>
<div class="w3-main w3-content w3-padding" style="max-width:1200px;height:1000px;margin-top:100px">

<h1><b>About us</b></h1>
<hr>
<div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-third">
          <img src="resources/image/hyejin.jpg" alt="Hyejin" style="width:100%">
    	  <h3>Hyejin Kim</h3>
     	  <p>shflxpf701@naver.com</p>
    
    </div>
    <div class="w3-third">
  		   <img src="resources/image/yerim.jpg" alt="Yerim" style="width:100%">
    	   <h3>Yerim lee</h3>
      	   <p>leeyerim96@naver.com</p>
    </div>
    <div class="w3-third">
     	  <img src="resources/image/gayoung.jpg" alt="Gayoung" style="width:100%">
    	  <h3>Gayoung Hwang</h3>
     	  <p>hi2729@naver.com</p>
    </div>
    </div>
</div>
</body>
</html>