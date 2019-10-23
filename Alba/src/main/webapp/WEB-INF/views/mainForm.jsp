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
<script src="resources/jsLib/axlogin2.js"></script>
<style>
   * {margin:0; padding:0; border-bottom-width:0;}
   body,h1,h2,h3,h4,h5,h6 {font-family: "맑은 고딕", sans-serif}
    .w3-bar-block .w3-bar-item {padding:20px}
   div  {font-family: "맑은 고딕"}
</style>
<meta charset="UTF-8">
<title>** MainForm **</title>

</head>
<body>


<!-- Sidebar (hidden by default) -->

<div class="w3-main w3-content w3-padding" style="max-width:1200px;height:1000px;margin-top:100px">



    <h4><b>채용정보</b></h4>
    <hr>
   <c:forEach var="nn" items="${Apple}">
   
    <div class="w3-quarter w3-container w3-margin-bottom w3-hover-opacity" onclick="window.location.replace('pndetail?bno=${nn.bno}')">
      <img src="${nn.mainimage}" alt="Norway" style="width:100%" width="100" height="100">
    
      <div class="w3-container w3-white">
        <p><b>${nn.bname}</b></p>
        <p>${nn.typeoccup}</p>
        <p style="color:#B7B7B7;">${nn.region} | 시급 <fmt:formatNumber value="${nn.pay}" pattern="##,###,###"/></p> 
      </div>
        <img src="resources/image/line.png" style="width:100%" width="300">
    </div>
</c:forEach>
 </div>
 
  <script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>
</body>
</html>