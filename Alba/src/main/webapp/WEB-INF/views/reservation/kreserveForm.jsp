<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>예약</title>
    <link rel=" shortcut icon" href="resources/image/favicon.ico">
   <link href='resources/jsLib/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/jsLib/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='resources/jsLib/moment.min.js'></script>
<script src='resources/jsLib/jquery-3.2.1.min.js'></script>
<script src='resources/jsLib/fullcalendar.min.js'></script>
<script src='resources/jsLib/ko.js'></script>
<script src='resources/jsLib/jquery.bpopup.min.js'></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/main.css">
<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script> 
 <style>

.reserveClickWindow
    {
    width:700px;
    height:730px;
    border-radius:15px;
    background-color:#fff;
    position: absolute;
    left:50%;
    top:50%;
    display:none;
    z-index:1;
}
  </style>

</head>

<script type="text/javascript">
$(document).ready(function() {
   var test=[];
   
   for(var i=0, test=[]; i<${size}; i++){
         test.push(
            {title:$("#rtime"+i).val()+" "+$("#pname"+i).val()+$('#state'+i).val(),start:$('#day'+i).val(),textColor:"#6799FF",color:"#00ff0010",index:i}
         );
      }
   $('#calendar').fullCalendar({
      header: {
         left: 'prev,next, today',
         center: 'title',
         right: 'month,listWeek'
      },
      navLinks: true, 
      selectable: true,
      editable: true,
      eventLimit: true, 
      locale: "ko",
      defaultView: "month",//월간->디폴트값
      events: test,   
      
      eventClick: function(calEvent,jsEvent,view){ 
           alert("fff="+$('#ano'+calEvent.index).val()+$('#pno'+calEvent.index).val());
             $.ajax({
                type: 'Post',
                url: 'redetail',
                 data: {
                   ano:$('#ano'+calEvent.index).val(),
                   pno:$('#pno'+calEvent.index).val()           
                },
                success: function(data){

                   $('#rno').html(data.reDetail.rno);
                   $('#bname').html(data.reDetail.bname);
                   $('#pname').html(data.reDetail.pname);
                   $('#phone').html(data.reDetail.phone);
                   $('#day').html(data.reDetail.day);
                   $('#detailrtime').html(data.reDetail.rtime);
                   $('#writing').html(data.reDetail.writing);                
                   $('.reserveClickWindow').bPopup();
                   
                } // success
             }); // ajax
          } //eventClick 
   });     
 
   $('.selectApproval').click(function(){
	   var rno = document.getElementById("rno").innerHTML;
	   $.ajax({
		   type:'post',
		   url:'selectApproval',
		   data:{
			   rno:rno
		   },
		   success: function(data){
			   if(data.fCode=="UAS"){
				   swal("승인하셨습니다.");
				   location.reload();
			   }
		   }
	   })
   })
   
   $('.selectRefuse').click(function(){
	   var rno = document.getElementById("rno").innerHTML;
	   $.ajax({
		   type:'post',
		   url:'selectRefuse',
		   data:{
			   rno:rno
		   },
		   success: function(data){
			   if(data.fCode=="URS"){
				   swal("거부하셨습니다.");
				   location.reload();
			   }
		   }
	   })
   })
});


function Finish1(){
  $('.reserveClickWindow').bPopup().close();
}



</script>
<body>
    <div class="container">
      <!--   <!-- 일자 클릭시 메뉴오픈 -->

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>

 <div class="Calendar">
    </div>   
       <div class="reserveClickWindow">        
            <div class="modal-header" align="left">
                      <h4 class="modal-title" align="center"><b>예약 상세보기</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="Finish1()" >
                        <span aria-hidden="true">&times;</span></button>                     
                    </div>
                   
             <div style='width:100%; height:30px;  margin-top:40px'>  
                   <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>업체명</b></div>
                   <div style='width:60%; float:right'>
                   <span id=bname></span>
                   </div>       
           </div>
       
           <div style='width:100%; height:30px;  margin-top:10px'>  
                   <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>이름</b></div>
                   <div style='width:60%; float:right'>
                    <span id=pname></span>
                   </div>       
           </div>
            <div style='width:100%; height:30px;  margin-top:10px'>  
                   <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>핸드폰 번호</b></div>
                   <div style='width:60%; float:right'>
                      <span id=phone></span>
                   </div>       
            </div>
            
            <div style='width:100%; height:30px;  margin-top:10px'>
                 <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>예약 날짜</b></div>
                 <div style='width:60%; float:right'>
                   <span id=day></span>
                 </div>      
            </div>
           
            <div style='width:100%; height:30px;  margin-top:10px'>
                 <div style='width:40%; float:left; padding-left:50px; color:#5CD1E5'><b>예약 시간</b></div>
                 <span id=detailrtime></span>  
            </div> 
                  
             <div style='width:100%; height:30px; margin-top:10px'>     
                   <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>남기는 말</b></div>
                   <div style='width:60%; float:right'> 
                   <textarea rows="13" cols="40" class="inputModal" name="edit-desc" readonly="readonly" id="writing">
                   </textarea>
                    
            </div>
             <span id="rno" style="display:none;"></span>    

            <div style='width:100%; text-align:right; height:80px; margin-bottom:80px; margin-top:80px' class="modal-footer">
            <button type="button" class="btn btn-primary selectApproval">예약 승인</button> 
             <button type="button" class="btn btn-primary selectRefuse">예약 거부</button> 
            </div>           
   </div>        
   
<c:forEach var="res" items="${reservecalendar}" varStatus="vs">

 <input type="hidden" id="pname${vs.index}" value="${res.pname}">
  
 <input type="hidden" id="rtime${vs.index}" value="${res.rtime}">

 <input type="hidden" id="state${vs.index}" value="${res.state}">
 
 <input type="hidden" id="day${vs.index}" value="${res.day}"> 
 
 <input type="hidden" id="ano${vs.index}" value="${res.ano}">
 <br>
 <input type="hidden" id="pno${vs.index}" value="${res.pno}">
 <br>
 
</c:forEach>
       
        </div>
        </div>
        </body>


</html>