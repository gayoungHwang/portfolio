
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/axment.js"></script>
<script>
   $(function() {
      $('.search-addr').on('click', function() {
         new daum.Postcode({
            oncomplete : function(data) {
               const addr = data.roadAddress;
               document.getElementById("addr").value = addr;
            }
         }).open();
      });
   });
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
   color: black;
}
</style>
<meta charset="UTF-8">
<title>** Resume Detail **</title>
</head>
<body>


   <form action="krdetail" method="post" enctype="multipart/form-data">
      <div id="contentForm">
         <input type="text" name="userno" value="${Apple.userno}"
            hidden="true">
         <table class="table table-bordered"
            style="text-align: center; border: 1px solid #dddddd">
            <thead>
               <tr>
                  <th colspan="9">이력서</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td rowspan="1" colspan="9">${Apple.title}</td>
               <tr>
                  <td colspan="3" rowspan="4"><img src="${Apple.uploadfile}">
                     <br></td>
                  <td rowspan="1"><b>성명</b></td>
                  <td colspan="2">${Apple.pname}</td>
                  <td><b>성별</b></td>
                  <td colspan="2">${Apple.gender}</td>
               </tr>

               <tr>

                  <td rowspan="1"><b>나이</b></td>
                  <td colspan="2">${Apple.age}</td>
                  <td><b>연락처</b></td>
                  <td colspan="2">${Apple.phone}</td>
               </tr>

               <tr>
                  <td rowspan="1"><b>주소</b></td>
                  <td colspan="5">${Apple.addr}</td>
               </tr>

               <tr>
                  <td rowspan="1"><b>학력</b></td>
                  <td colspan="2">${Apple.academic}</td>
               
                  <td rowspan="1"><b>경력</b></td>
                  <td colspan="2">${Apple.career}</td>
               </tr>

            <tr>
               <th colspan="9">희망 근무</th>
               </tr>
               <tr>
                  <td rowspan="1" colspan="2"><b>직종</b></td>
                  <td colspan="7">${Apple.typeoccup}</td>
               </tr>
               <tr>
                  <td rowspan="1" colspan="2"><b>기간</b></td>
                  <td colspan="2">${Apple.period}</td>
                  <td rowspan="1" colspan="2"><b>요일</b></td>
                  <td colspan="3">${Apple.dow}</td>
               </tr>
               <tr>
                  <td rowspan="1" colspan="2"><b>시간</b></td>
                  <td colspan="2">${Apple.timetotime}</td>
                  <td rowspan="1" colspan="2"><b>지역</b></td>
                  <td colspan="3">${Apple.region}</td>
               </tr>
 <thead>
               <tr>
                  <th colspan="9">자기소개서</th>
               </tr>
               <tr >
                 <td colspan="9">
                  <textarea name="selfinfo" rows="30" cols="120" readonly="readonly">${Apple.selfinfo}</textarea> </td> 
            
               </tr>
            </thead>
            </tbody>
         </table>
         <a href="#" onclick="history.back()"><button type=button>뒤로가기</button></a>
         <br> <br>

      </div>

   </form>
   <br>
   <br>


</body>
</html>