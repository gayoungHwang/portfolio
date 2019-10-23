<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script> 
<!------ Include the above in your HEAD tag ---------->
 <style>
  
    #container {
 
      width: 200%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }

.row {display: table-row; width:800;}
.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD; color:black;}

.col1 {width: 12%;}
.col2 {width: 15%;}
.col3 {width: 12%;}
.col4 {width: 12%;}
.col5 {width: 20%;}
.col6 {width: 12%; color:blue;}
.col7 {width: 12%; color:red;}
.col8 {width: 13%;}
 .isStandby{   }
 .notStandby{ background-color:#D5D5D5; color:gray }
</style>

  <script>
  function rdetail(index){
	     var userno = $('#userno'+index).val();
	  
	      location.href='krdetail?userno='+userno;
	       
	  }
  
     $(document).ready(function () {
        
            $('.btnsuccess').click(function () {
              var userno = $(this).attr("data-userno");
              var ano = $(this).attr("data-ano");
               $.ajax({
                 type:'Post',
                 url:'selectPass',
                 data: {
                    userno:userno,
                    ano:ano
                 },
                 success:function(data){
                    if(data.fCode=='PS'){
                       swal("합격버튼을 선택하셨습니다!");
                       var btnType = ['#btnSuccess', '#btnFail'];
                       $.each( btnType, function(idx, eachBtn){
                   $(eachBtn + ano).attr('disabled','disabled');
                   $(eachBtn + ano).addClass('notStandby');
                   $(eachBtn + ano).removeClass('isStandby');
                        });
                    }
                    else if(data.fCode=='PP'){
                       swal("다시 선택해주세요!");
                    }                
                 } 
              }); // ajax
           }); // click    
       });
   
  $(document).ready(function () {
      $('.btnfail').click(function () {
         var userno = $(this).attr("data-userno");
         var ano = $(this).attr("data-ano");
          $.ajax({
            type:'Post',
            url:'selectFail',
            data: {
               userno:userno,
               ano:ano
            },
            success:function(data){
               if(data.fCode=='PF'){
                  swal("불합격버튼을 선택하셨습니다!");  
                  var btnType = ['#btnSuccess', '#btnFail'];
                  $.each( btnType, function(idx, eachBtn){
              $(eachBtn + ano).attr('disabled','disabled');
              $(eachBtn + ano).addClass('notStandby');
              $(eachBtn + ano).removeClass('isStandby');
                   });
               }  
            } 
         }); // ajax
      }); // click   
  });
    
    
    
  </script>
<meta charset="UTF-8">
<title>업체 지원한 이력서</title>
</head>
<body>
   

<div id="container" class="w3-main w3-content w3-padding" style="max-width:1500px;margin-top:100px;width:1000px;" align="center"> 
<div class="row">
      <span class="cell col1"><b>직종</b></span>
      <span class="cell col2"><b>이름</b></span>
      <span class="cell col3"><b>나이</b></span>
      <span class="cell col4"><b>성별</b></span>
      <span class="cell col5"><b>연락처</b></span>
      <span class="cell col6">  </span>
      <span class="cell col7">  </span>
      <span class="cell col8"><b>상태</b></span>
  </div>
  

<c:forEach var="mr" items="${Apple}" varStatus="vs">
<div class="row">
<c:if test="${mr.kno==Kno}">
 <input type="hidden" id="userno${vs.index}" name="userno" value="${mr.userno}">
  
   <span onclick="rdetail(${vs.index})" class="cell col1">${mr.typeoccup}</span>  
   <span onclick="rdetail(${vs.index})" class="cell col2">${mr.pname}</span>  
   <span onclick="rdetail(${vs.index})" class="cell col3">${mr.age}</span>
   <span onclick="rdetail(${vs.index})" class="cell col4">${mr.gender}</span>
   <span onclick="rdetail(${vs.index})" class="cell col5">${mr.phone}</span>
   
   <c:if test="${mr.passcheck=='대기'}">
   <span class="cell col6" ><button id='btnSuccess${mr.ano}' type="button" value="합격" data-userno="${mr.userno}" data-ano="${mr.ano}" class="btnsuccess isStandby"><b> 합격</b></button></span>
   <span class="cell col7"><button id='btnFail${mr.ano}' type="button" value="불합격" data-userno="${mr.userno}" data-ano="${mr.ano}" class="btnfail isStandby"><b>불합격</b></button></span>
  </c:if>
  
   <c:if test="${mr.passcheck!='대기'}">
   <span class="cell col6"><button id='btnSuccess${mr.ano}' type="button" value="합격" disabled="disabled" class="notStandby"><b> 합격</b></button></span>
   <span class="cell col7"><button id='btnFail${mr.ano}' type="button" value="불합격" disabled="disabled" class="notStandby"><b>불합격</b></button></span>
  </c:if>
  
  <span class="cell col8">${mr.passcheck}</span>
  
  
</c:if>
</div>
</c:forEach>
</div>
<br><br>
 
 <div align="center">
<a href="#" onclick="history.back()"><button value='뒤로 가기'>뒤로 가기</button></a><br><br>
</div>
<br>
</body>
</html>