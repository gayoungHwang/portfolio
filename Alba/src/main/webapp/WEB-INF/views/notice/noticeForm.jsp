<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 구인자 공고 **</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/axment.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
   $(function() {
      $('.search-addr').on('click', function() {
         new daum.Postcode({
            oncomplete : function(data) {
               const region = data.roadAddress;
               document.getElementById("region").value = region;
            }
         }).open();
      });
   });
</script>

</head>
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
}
</style>
<body>


   <form id=NoticeForm action="ninsert" method="post"
      enctype="multipart/form-data">
      <div id="contentForm">
         <table class="table table-bordered">
            <thead>
               <tr>
                  <th colspan="9">공고 등록</th>
               </tr>
            </thead>
            <tr>
               <th>업체명</th>
               <td><input type="text" id="bname" name="bname" value="" required><br></td>
            </tr>
            <tr>
               <th>업체이미지</th>
               <td><input type="file" name="mainimagef" required></td>
            </tr>
            <tr>
               <th>급여</th>
               <td><input type="number" id="pay" name="pay" value="" required><br></td>
            </tr>
            <tr>
               <th>근무시간</th>
               <td><select name=timetotime>
                     <option value="1-3시간">1-3시간</option>
                     <option value="3-6시간">3-6시간</option>
                     <option value="6-8시간">6-8시간</option>
                     <option value="10시간이상">10시간이상</option>
               </select></td>
            </tr>
            <tr>
               <th>직종</th>
               <td><select name=typeoccup>
                     <option value="매장관리">매장관리</option>
                     <option value="서비스">서비스</option>
                     <option value="교육">교육</option>
                     <option value="생산">생산</option>
                     <option value="사무">사무</option>
                     <option value="주방">주방</option>
                     <option value="서빙">서빙</option>
                     <option value="영업">영업</option>
               </select></td>
            </tr>
            <tr>
               <th>근무기간</th>
               <td><select name=period>
                     <option value="하루">하루</option>
                     <option value="일주일">일주일</option>
                     <option value="1개월이상">1개월이상</option>
                     <option value="3개월이상">3개월이상</option>
                     <option value="6개월이상">6개월이상</option>
               </select></td>
            </tr>
            <tr>
               <th>근무요일</th>
               <td><select name=dow>
                     <option value="평일">평일</option>
                     <option value="주말">주말</option>
                     <option value="금,토,일">금,토,일</option>
                     <option value="월,수,금">월,수,금</option>
                     <option value="화,목">화,목</option>
               </select></td>
            </tr>

            <tr>
               <th>근무지역</th>
               <td><input type="text" class="addr road-addr" id="region"
                  name="region" value="" required> <span class="search-addr"
                  id="searchAddr">주소검색</span><br></td>
            </tr>

            <tr>
               <th>상세소개</th>
               <td><textarea name="etc" rows="10" cols="40 " required></textarea><br>
               </td>
            </tr>
            <tr>
               <th>마감일</th>
               <td><input type="date" id="deadline" name="deadline" value="" required><br>
               </td>
            </tr>

            <tr>
               <th>keyword1</th>
               <td><input type="text" id="keyword1" name="keyword1" value="" required><br>
               </td>
            </tr>
            <tr>
               <th>keyword2</th>
               <td><input type="text" id="keyword2" name="keyword2" value=""><br>
               </td>
            </tr>
            <tr>
               <th>keyword3</th>
               <td><input type="text" id="keyword3" name="keyword3" value=""><br>
               </td>
            </tr>


         </table>
         <br> <br>
         <button type="submit" value="등록">등록</button>
         &nbsp;&nbsp;&nbsp;
         <button type="reset" value="초기화">초기화</button>


      </div>
   </form>
</body>
</html>