jQuery(function(){
  jQuery("#home_controller li").click(function() {
    if (jQuery(this).find("a").length > 0) {
      window.location = jQuery(this).find("a").attr("href");    
    };
    return false;
  });
});
