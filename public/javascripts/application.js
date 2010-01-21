/* Extend jQuery with functions for PUT and DELETE requests. */
function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback = data;
        data = {};
    }
    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
        });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});


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
  
  $(".note-suppr").live('click', function(e) {  
    var link = jQuery(this);
    
    $(".loader").show();
    $.delete_(link.attr('href'), $(this).serialize(), function(data){$(".loader").hide();}, "script");
    return false;
  });
  
  $(".info").draggable({
      stop: function(event, ui){
        var table = $("#s4"); 
        table.data("boxPositionLeft", ui.position.left);
        table.data("boxPositionTop", ui.position.top);
      }
  });
  
  
  $(".info").find(".close").click(function(){
    $(".info").hide();
    return false;
  });
  
  $("td.player").click(function(){
    $(".info").hide();
    var info = $(this).find(".info");
    var table = $("#s4");
    var top = table.data("boxPositionTop") || 65;
    var left = table.data("boxPositionLeft") || 20;
    info
      .css("top", top+"px")
      .css("left", left+"px")
      .show();
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