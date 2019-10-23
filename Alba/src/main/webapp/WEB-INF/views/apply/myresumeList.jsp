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
<!------ Include the above in your HEAD tag ---------->
 <style>
  
    #container {
 
      width: 30%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }

  #custom-search-input{
  
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
   
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
   
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{

    font-size: 15px;
}
    /* Bootstrap 수정 */
    
    .table > thead {
      background-color: #FFE5C2;
    }
   
    .table-hover > tbody > tr:hover {
      background-color: #FDF5E6;
    }
     .table > thead > tr > th {
      text-align: center;
       color: black;
    }
    
      .table > tbody > tr > td {
      text-align: center;
      color: black;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
   
  </style>
  <script>
  $(function(){
      var userno = $('#userno').val();
      $('.detail').click(function(){
         location.href='krdetail?userno='+userno;
      });    
    })
  
     $(document).ready(function () {
	        $('.btnsuccess').click(function () {
	        	var userno = $(this).attr("data-userno");
	        	var bno = $(this).attr("data-bno");
	            $.ajax({
	              type:'Post',
	              url:'oinsert',
	              data: {
	            	  userno:userno,
	            	  bno:bno
	              },
	              success:function(data){
	                 if(data.fCode=='AF'){
	                	 swal("합격버튼을 선택하셨습니다!");
	                	 
	                 }
	                 else if(data.fCode=='AS'){
	                	 swal("불합격버튼을 선택하셨습니다!");
	                 }	             
	              } 
	           }); // ajax
	        }); // click   
	    });
	
    
    
    
  </script>
<meta charset="UTF-8">
<title>우리회사 지원한 이력서</title>
</head>
<body>
<div id="container" class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;width:1000px;">

   
 <form action="oinsert" method=post>
 
<table class="table table-striped table-bordered table-hover" >
<thead>
<tr>
   <th width="5%">이름</th>
   <th width="5%">나이</th>
   <th width="5%">성별</th>
   <th width="5%">연락처</th>
   <th colspan="4" width="10%">조회</th>
</tr>
</thead>
<tbody>
<c:forEach var="mr" items="${Apple}">

<c:if test="${mr.kno==Kno}">
		   <input type="hidden" class="userno" name="userno" value="${mr.userno}">
	       <input type="hidden" class="bno" name="bno" value="${mr.bno}">
   <tr>
   
    
   <td class="detail">${mr.pname}</td>  
   <td class="detail">${mr.age}</td>
   <td class="detail">${mr.gender}</td>
   <td class="detail">${mr.phone}</td>
   

   <td colspan="2"><button type="button" value="합격" data-userno="${mr.userno}" data-bno="${mr.bno}" class="btnsuccess">합격</button></td>
   

   <td colspan="2"><button type="button" value="불합격"data-userno="${mr.userno}" data-bno="${mr.bno}" class="btnfail">불합격</button></td>
  
   </tr>
</c:if>
</c:forEach>
</tbody>
</table><br><br>
 </form>  
<a href="#" onclick="history.back()"><button value='뒤로 가기'>뒤로 가기</button></a><br><br>
<br>
</div>
</body>
</html>