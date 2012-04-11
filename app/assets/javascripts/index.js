//clickable function for current window change
jQuery(function(){
  jQuery("#home_controller li, #knowledges_controller #lesson_plans td, #knowledges_controller #knowledges td[class='knowledges_title']").click(function() {
    if (jQuery(this).find("a").length > 0) {
      window.location = jQuery(this).find("a").attr("href");
    };
    return false;
  });
});

//clickable function for new window
jQuery(function(){
  jQuery("").click(function() {
    if (jQuery(this).find("a").length > 0) {
      window.open(jQuery(this).find("a").attr("href"));
    };
    return false;
  });
});

//clickable function for running script - TK
jQuery(function(){
  jQuery("").click(function() {
    if (jQuery(this).find("a").length > 0) {
      window.location = jQuery(this).find("a").attr("href");    
    };
    return false;
  });
});

function remove_fields (link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("div").hide();
}

function add_knowledge_fields (link, fields) {
  var id = new Date().getTime();
  var reg_exp = new RegExp("new_knowledge", "g");
  $(link).parent().before(fields.replace(reg_exp, id));
}

