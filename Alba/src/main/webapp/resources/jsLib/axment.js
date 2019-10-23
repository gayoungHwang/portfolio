$(function(){
   $('#commentlist').click(function(){
      $.ajax({
         type:'Post',
         url:'minsert',
         data: {
            content:$('#contentreg').val(),
            seq:$('#seq').val()
            },
         success:function(result){
            $('#resultArea').html(result);
         } // success
      }); // ajax
   }); // click
   
  
  
});     

function Update(mno, index){ 
      
         $.ajax({
            type:'Post',
            url:'mupdate',
            data: {
               mno:mno,
               content:$('#content2').val()
               },
            success:function(result){
               location.reload();
               /*$('#content'+index).html();*/
            } // success
         }); // ajax
};

function mUpdatef(mno, idx, content) {
	   var yyy = $(window).scrollTop();
       var textBoxHtml = "<input type=\"text\" id=\"content2\" value=\"" + content + "\"></input>";
       var submitBtnHtml = "<input type=\"button\" value=\"수정\" onclick=\"Update('"+mno+"','"+idx+"')\">";
      $('#content'+idx).html(textBoxHtml + submitBtnHtml);
      $('#content2').focus();
      $(window).scrollTop(yyy) ;
    /*  var yValue = $('img').attr('height');
      $(window).scrollTop(yValue) ;*/
   }; 

function mdelete(mno, idx){
    $.ajax({
        type:'Post',
        url:'mdelete',
        data: {
           mno:mno,
           content:$('#content2').val()
           },
        success:function(result){
           location.reload();
         
        } // success
     }); // ajax
	
	
};
	
	

   