
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script> 
<script src="resources/jsLib/jquery-3.2.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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


<meta charset="UTF-8">
<title>** Notice Update **</title>
</head>
<body>

  <div id="contentForm">
         <table class="table table-bordered  table-striped" style="text-align:center; border:1px solid #dddddd">
         
         <thead>
           <tr>
               <th width="30%">업체명</th>
               <td width="70%" colspan="5">${Apple.bname}</td>
            </tr>
         </thead>
         <tbody>
<%--             <tr>
               <th width="30%" style="padding-top: 15px" >사진</th>
               <td width="70%" align="center"><img src="${Apple.mainimage}"></td>
            </tr> --%>
               <tr>
                   <th width="30%" style="padding-top: 15px" >사진</th>
                  <td colspan="5" rowspan="1" align="center"><img src="${Apple.mainimage}"></td>
                    </tr>
            
        
            <tr>
               <th style="padding-top: 15px">직종</th>
               <td  width="100%"colspan="5">${Apple.typeoccup}</td>
         </tr>
         
         <tr>
               <th width="20%">급여</th>
               <td width="80%"><fmt:formatNumber value="${Apple.pay}" pattern="##,###,###"/></td>
               <th width="20%">근무기간</th>
               <td width="80%">${Apple.period}</td>
            </tr>
            
            <tr>
               <th width="20%">요일</th>
               <td width="80%">${Apple.dow}</td>
               <th width="50%">근무시간</th>
               <td width="50%" >${Apple.timetotime}</td>
            </tr>
            
            <tr>
               <th>지역</th>
               <td colspan="5">${Apple.region}</td>
            </tr>
           
          <tr>
               <th width="10%">keyword1</th>
               <td width="20%" colspan="5">${Apple.keyword1}</td>
             </tr>
             
             <tr>
                <th width="10%" >keyword2</th>
                <td width="20%" colspan="5">${Apple.keyword2}</td>
             </tr>
               
              <tr> 
                <th width="10%" >keyword3</th>
                <td width="30%" colspan="5">${Apple.keyword3}</td>
              </tr>
            
              <tr>
               <th>마감일자</th>
               <td width="100%"colspan="5">${Apple.deadline}</td>
            </tr>
           
              <tr height="400" valign="top">
               <td width="100%" colspan="5">
             <textarea name="etc" rows="30" cols="100" readonly="readonly" >${Apple.etc}</textarea></td>
            </tr>
            
         </tbody>
          
            </table>
     
          <!-- AT: 지원가능  BT:공고마감 -->     
          <c:if test="${ploginID!=null && fCode=='AT'}" >
           <button type="button" value="지원하기" onclick="window.open('rselect?pno=${Banana.pno}','이력서 선택','width=500,height=1000,location=no,status=no,scrollbars=no');">지원하기</button>
   		  </c:if>
    
    	 <c:if test="${ploginID!=null && fCode=='BT'}" >
           <button type="button" value="공고마감" disabled="disabled">공고마감</button>
   		  </c:if>
      <br> 
  
   </div>
</body>
</html>