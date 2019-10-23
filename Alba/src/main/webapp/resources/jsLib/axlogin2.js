$(function(){
   
// 1.Partimer Login Form  
   $('#pploginf').click(function(){
      $.ajax({
         type:'Post',
         url:'ploginf',
         success:function(result){
            $('#resultArea').html(result);
         } 
      }); // ajax
   }); // click
   

  
// 3.King Login Form 
   
   $('#kkloginf').click(function(){
       $.ajax({
         type:'Post',
         url:'kloginf',
         success:function(result){
            $('#resultArea').html(result);
         } 
      }); // ajax
   }); // click   
   
   $('#mmainf').click(function(){
       $.ajax({
         type:'Post',
         url:'mainf',
         success:function(result){
            $('#resultArea').html(result);
         } 
      }); // ajax
   }); // click   

/*      
   $('.textLink').hover(function(){
         $(this).css({
               color: "red",
               cursor: "pointer"}); // css종료
      },function(){
         $(this).css({
               color: "gray",
               cursor: "default"}); // css종료
      }); //hover   
*/   
   
   $('#aaboutf').click(function(){
       $.ajax({
         type:'Post',
         url:'about',
         success:function(result){
            $('#resultArea').html(result);
         } 
      }); // ajax
   }); // click   

  
}) // ready