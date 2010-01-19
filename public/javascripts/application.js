$(function(){
  
  jQuery.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
  });


  // Ajaxidy form new_note
  var options = {
    beforeSubmit:  showLoader, 
    success:       hideLoader,
    dataType: 'script', // to user create.js.erb
    resetForm: true
  };
  $('.new_note').ajaxForm(options);
  
  function showLoader(formData, jqForm, options){
    for (var i=0; i < formData.length; i++) { 
      if (!formData[i].value) { 
        alert('La note ne peut pas être vide'); 
        return false; 
      } 
    }
    $(".loader").show();
    return true;
  }
  
  function hideLoader(){
    $(".loader").hide();
    return true
  }
  
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