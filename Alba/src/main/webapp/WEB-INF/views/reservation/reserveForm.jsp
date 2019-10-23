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
  .dayClickWindow
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
            {title:$("#rtime"+i).val()+" "+$("#pname"+i).val()+$('#state'+i).val(),start:$('#start'+i).val(),textColor:"#6799FF",color:"#00ff0010",index:i}
         );
      }
   $('#calendar').fullCalendar({
      header: {
         left: 'prev,next, today',
         center: 'title',
         right: 'month,listWeek'
      },
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      locale: "ko",
      defaultView: "month",//월간->디폴트값
      events: test,
      dayClick: function(date, jsEvent, view) {
         document.getElementById('date').valueAsDate = new Date(date.format());
         var d = new Date();
         if(d<date){
            $('.dayClickWindow').bPopup();
         }
      },
      
      eventClick: function(calEvent,jsEvent,view){ 
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
                	$('#start').html(data.reDetail.start);
                	$('#detailrtime').html(data.reDetail.rtime);
                	$('#writing').html(data.reDetail.writing); 
                	if(data.reDetail.pno==${Pno}){
                	   $('.reserveClickWindow').bPopup();
                	}
                } // success
          	}); // ajax
          } //eventClick 
   });
   
   $('.SaveReserve').click(function(){
      var ano = $(this).attr("data-ano");
      var pno = $(this).attr("data-pno");
      
      $.ajax({
         type: 'Post',
         url: 'reinsert',
         data: {
            pno:pno,
            ano:ano,
            start:$('#date').val(),
            writing:$('#edit-desc').val(),
            rtime:$('#insertrtime').val()
         },
         success: function(data){
        	if(data.fCode=="RES")
        	{
        		alert("정상 처리되었습니다.");
            	location.reload();
        	} else if(data.fCode=="REF"){
        		swal("이미 예약하셨습니다");
        	} else if(data.fCode=="REF2"){
        		swal("이미 예약된 시간입니다\n다른시간을 선택해주세요");
        	}
         }   
      }); //ajax
   }); // click
   
   $('.DeleteReserve').click(function(){
       var rno = document.getElementById("rno").innerHTML;
       $.ajax({
          type: 'Post',
          url: 'redelete',
          data: {
             rno:rno                     
          },
          success: function(data){
        	  if(data.fCode=="DES")
          	{
        		swal("삭제 되었습니다.");
              	location.reload();
          	} else if(data.fCode=="DEF"){
          		swal("다시 시도해주세요");
          	}	
          }
     }); //ajax  
 }); //click  
   });
 

function Finish(){
  $('.dayClickWindow').bPopup().close();
}

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
       <div class="dayClickWindow">
            <div class="modal-header" align="left">
                      <h4 class="modal-title" align="center"><b>예약 신청</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="Finish()" >
                        <span aria-hidden="true">&times;</span></button>                     
                    </div>
             <div style='width:100%; height:30px;  margin-top:40px'>  
                   <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>업체명</b></div>
                   <div style='width:60%; float:right'>
                   ${Bname}
                   </div>       
           </div>
       
           <div style='width:100%; height:30px;  margin-top:10px'>  
                   <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>이름</b></div>
                   <div style='width:60%; float:right'>
                      ${Pname}
                   </div>       
           </div>
          
            <div style='width:100%; height:30px;  margin-top:10px'>  
                   <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>핸드폰 번호</b></div>
                   <div style='width:60%; float:right'>
                      ${Phone}
                   </div>       
            </div>
            
            <div style='width:100%; height:30px;  margin-top:10px'>
                 <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>예약 날짜</b></div>
                 <div style='width:60%; float:right'>
                    <input type='date' id='date' disabled="disabled">
                 </div>      
            </div>
           
            <div style='width:100%; height:30px;  margin-top:10px'>
                 <div style='width:40%; float:left; padding-left:50px; color:#5CD1E5'><b>예약 시간</b></div>
                 <select id=insertrtime style='width:60%; width:200px;'>
                   <option value="10:00">10:00</option>
                   <option value="13:00">13:00</option>
                   <option value="18:00">18:00</option>                
                 </select>      
            </div> 
                  
            <div style='width:100%; height:30px; margin-top:10px'>     
                   <div style='width:30%; float:left; padding-left:50px; color:#5CD1E5'><b>남기는 말</b></div>
                   <div style='width:60%; float:right'> <textarea rows="13" cols="40" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                    
                   </div>
            </div>
            <div style='width:100%; text-align:center; height:80px; margin-bottom:80px; margin-top:40px' class="modal-footer">
             
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary SaveReserve" data-pno="${Pno}" data-ano="${Ano}" >등록</button>
            </div>            
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
                   <span id=start></span>
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
            <div style='width:100%; text-align:center; height:80px; margin-bottom:80px; margin-top:80px' class="modal-footer">
            <button type="button" class="btn btn-primary DeleteReserve">예약 취소</button> 
           
            </div> 
            </div>           
   </div>        
   
<c:forEach var="res" items="${reservecalendar}" varStatus="vs">
  <c:if test="${res.pno==Pno}"> 
 <input type="hidden" id="pname${vs.index}" value="${res.pname}">
  </c:if>
  
  <c:if test="${res.pno!=Pno}">
  <input type="hidden" id="pname${vs.index}" value="예약 불가능">
 </c:if>
  
 <input type="hidden" id="rtime${vs.index}" value="${res.rtime}">
 
 <c:if test="${res.pno==Pno}"> 
 <input type="hidden" id="state${vs.index}" value="${res.state}">
 </c:if>
 
 <c:if test="${res.pno!=Pno}">
 <input type="hidden" id="state${vs.index}" value=" ">
 </c:if>
 
 <input type="hidden" id="start${vs.index}" value="${res.start}"> 
 
 <input type="hidden" id="ano${vs.index}" value="${res.ano}">
 <br>
 <input type="hidden" id="pno${vs.index}" value="${res.pno}">
 <br>
 
</c:forEach>
       
        </div>
        </body>
    
    <!-- /.container -->

</html>