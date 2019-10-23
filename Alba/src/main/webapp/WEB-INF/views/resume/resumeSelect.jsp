<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>

<head>
    <meta charset="utf-8"/>
<title>Insert title here</title>

<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script> 
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>   
</head>
<style>
 table{border:1px solid #E6E6E6; border-collapse:collapse; width:80%;}
*{font-family: 'Roboto', sans-serif;}

@keyframes click-wave {
  0% {
    height: 15px;
    width: 15px;
    opacity: 0.35;
    position: relative;
  }
  
  100% {
    height: 100px;
    width: 100px;
    margin-left: -40px;
    margin-top: -40px;
    opacity: 0;
  }
}

#option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 4.33333px;
  right: 0;
  bottom: 0;
  left: 0;
  height: 15px;
  width: 15px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
#option-input:hover {
  background: #9faab7;
}
#option-input:checked {
  background: #40e0d0;
}
#option-input:checked::before {
  height: 15px;
  width: 15px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 13.66667px;
  text-align: center;
  line-height: 15px;
}
#option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #40e0d0;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
}
</style>


<script>

   function check_only(chk){
      
      var obj = document.getElementsByName("userno");
      for(var i=0; i<obj.length; i++){
         if(obj[i] != chk){
            obj[i].checked = false;
         }
      }
   }
   

   
    $(document).ready(function () {
           $('#checkBtn').click(function () {
              var userno = $('input[name="userno"]:checked').val();
               $.ajax({
                 type:'Post',
                 url:'ainsert',
                 data: {
                    userno:userno
                 },
                 success:function(data){
                    if(data.fCode=='AS'){
                       swal("지원 하셨습니다!");
                       
                    }
                    else if(data.fCode=='AF'){
                       swal("이미 지원하셨습니다!!");
                    }
                 } 
              }); // ajax
           }); // click   
       });
   



</script>

<body>
<div align="center">
제출할 이력서를 선택하세요

<table id="example-table-3" class="table table-bordered table-hover text-center" >   
<thead>
            <tr>
               <th>이력서 번호</th>
               <th>직종 </th>
               <th>제목</th>            
            </tr>
</thead>
<c:forEach var="rr" items="${Apple}">
<c:if test="${rr.pno==Pno}">
         <tbody>            
            <tr align="center">
               <td><input type="checkbox" id="option-input checkbox" name="userno" onclick="check_only(this)" value="${rr.userno}">${rr.userno}</td>
               <td>${rr.typeoccup}</td>
               <td>${rr.title}</td>   
            </tr>
         </tbody>
 </c:if>
</c:forEach>
</table>
 <button type="button" value="확인" id=checkBtn >확인</button>




   
   </div>
</body>
</html>