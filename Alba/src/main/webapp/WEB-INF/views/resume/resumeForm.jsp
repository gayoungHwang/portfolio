<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 이력서 등록 **</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<script src="resources/jsLib/axment.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){
   $('.search-addr').on('click',function(){
      new daum.Postcode({
         oncomplete: function(data){
            const addr = data.roadAddress;
            document.getElementById("addr").value= addr;   
         }
      }).open();
   });
});
</script>
</head>
<style>
      #container {
 
      width: 30%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
   
   
/* #contentForm {
   width: 40%;
   margin: 0 auto;
   padding-top: 12%;
} */

.table>thead>tr>th, .table>tbody>tr>th {
   background-color: #FFE5C2;
   text-align: center;
    color: black;
}
   
      .table> tbody> tr > td {
      text-align: center;
      color: black;
    }
   
 input {width: 100%;  margin:center;} 
</style>
<body>
<div id="container" class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;width:1000px;">
<form id=ResumeForm action="rinsert" method="post" enctype="multipart/form-data">
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px;width:1000px;">
<!-- => enctype="multipart/form-data" : 화일 upload 를 가능하게 해줌 -->
<table class="table table-bordered">
<thead>
<tr>
<th colspan="9" >이력서</th>
</tr>
</thead>

<tr><td rowspan="1" colspan="20"><input type="text" style="border:none;" name="title" value="" placeholder="제목을 창의적으로 입력하세요" required></td></tr>
<tr>
 <td colspan="2" rowspan="4"><input type="file" name="uploadfilef" style="width: 60%;"  required><br>3*4cm</td>
 <td rowspan="1">성명</td>
 <td colspan="2"><input type="text" id="pname" style="border:none;" name="pname" value=""  required></td>
 <td>성별</td>
 <td colspan="2"><select name=gender>
      <option value="여">여</option>
      <option value="남">남</option>
     </select></td> 
 </tr>   
 
<tr>
 <td rowspan="1">나이</td>
 <td colspan="2"><input type="text" id="age" name="age" style="border:none;" value=""  required ></td>
 <td>연락처</td>
 <td colspan="2"><input type="text" id="phone" name="phone" style="border:none;" value=""  required></td>
</tr>
 
<tr>
 <td rowspan="1" >주소</td>
 <td colspan="5"><input type="text" class="addr road-addr" id="addr" name="addr"  style="border:none" value=""  required>
 <span class="search-addr" id="searchAddr" >주소검색</span></td>
</tr>

<tr>
 <td rowspan="1" >학력</td>
 <td colspan="2"> <select name=academic>
     <option value="중졸">중졸</option>
      <option value="고졸">고졸</option>
      <option value="전문대졸">전문대졸</option>
      <option value="4년제졸">4년제졸</option>
     </select></td>
 <td> 경력 </td>
 <td colspan="2"> <input type="text" id="career" name="career" style="border:none" value="" required></td>
</tr>
<tr>
<th colspan="9">희망 근무</th>
</tr>
<tr>
 <td rowspan="1" colspan="2">직종</td>
 <td colspan="7"><select name=typeoccup>
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
 <td rowspan="1" colspan="2">기간</td>
 <td colspan="2"> <select name=period>
      <option value="하루">하루</option>
      <option value="일주일">일주일</option>
      <option value="1개월이상">1개월이상</option>
      <option value="3개월이상">3개월이상</option>
      <option value="6개월이상">6개월이상</option>
     </select></td>
 <td rowspan="1" colspan="2">요일</td>
 <td colspan="3"><select name=dow>
      <option value="평일">평일</option>
      <option value="주말">주말</option>
      <option value="금,토,일">금,토,일</option>
      <option value="월,수,금">월,수,금</option>
      <option value="화,목">화,목</option>
     </select></td>
</tr>
<tr>
 <td rowspan="1" colspan="2">시간</td>
 <td colspan="2"><select name=timetotime>
      <option value="1-3시간">1-3시간</option>
      <option value="3-6시간">3-6시간</option>
      <option value="6-8시간">6-8시간</option>
      <option value="10시간이상">10시간이상</option>
      </select></td>
 <td rowspan="1" colspan="2">지역</td>
 <td colspan="3"><select name=region>
      <option value="서울">서울</option>
      <option value="경기">경기</option>
      <option value="강원">강원</option>
      <option value="인천">인천</option>
      <option value="충남">충남</option>
      <option value="충북">충북</option>
      <option value="경남">경남</option>
      <option value="경북">경북</option>
      <option value="전남">전남</option>
      <option value="전북">전북</option>
      <option value="광주">광주</option>
      <option value="대구">대구</option>
      <option value="대전">대전</option>
      <option value="세종">세종</option>
      <option value="울산">울산</option>
      <option value="부산">부산</option>
      <option value="제주">제주</option>
     </select></td>
 </tr>

 <tr>
<th colspan="9" >자기소개서</th>
</tr>
 <tr>
     <td colspan="9">
   <textarea name="selfinfo" rows="30" cols="140" placeholder="지원동기 및 성격 등에 대해 서술하시오(1000글자이내)"></textarea> </td> 
            
  </tr>

</table>
<br>

<br><br>
<div align="center">
<button type="submit" value="등록">등록</button>
&nbsp;&nbsp;&nbsp;
<button type="reset" value="초기화">초기화</button>
  &nbsp;&nbsp;&nbsp;            
<a href="#" onclick="history.back()"><button value='뒤로가기'>뒤로가기</button></a>
<br>
</div>
</div>
</form>

</div>
</body>
</html>