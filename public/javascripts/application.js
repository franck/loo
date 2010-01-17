$(function(){
  
  $("td.player").hover(
    function(){
     $(this).find(".info").show();
    },
    function(){
      $(this).find(".info").hide();
    }
  );
  
});