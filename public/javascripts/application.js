$(function(){
  
  jQuery.ajaxSetup({ 
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
  });
  
  $(".info").find(".close").click(function(){
    $(".info").hide();
    return false;
  });
  
  $("td.player").click(function(){
    $(".info").hide();
    $(this).find(".info").show();
  });
  
  $(".more-notes").click(function(){
    var link = jQuery(this);
    
    $.get(link.attr('href'), $(this).serialize(), function(data){
      
    }, "script");
    return false;
  })
  
  // $("td.player").hover(
  //     function(){
  //      $(this).find(".info").show();
  //     },
  //     function(){
  //       $(this).find(".info").hide();
  //     }
  //   );
  
});