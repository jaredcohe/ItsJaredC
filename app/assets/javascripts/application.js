// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

/* 

/for changing link to AJAX link
$(function() {
  $("#knowledges th a, #knowledges .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
});

$(function() {
	$("#knowledges_search").submit(function() {
		$.get(this.action, $(this).serialize(), null, "script");
		console.log(this);
		console.log(this.action);
		console.log($(this).serialize());
		return false;
		});	
});
*/

function add_lesson_to_log (link, user_id, lesson_plantation_id) {
  //http://api.jquery.com/jQuery.ajax/
  console.log(link);
  console.log(link.href);
  console.log(user_id);
  console.log(lesson_plantation_id);

  if (user_id>0)
    {
      var request = $.ajax({
        type: "POST",
        url: "/logs",
        data: { log : { user_id : user_id, lesson_plantation_id: lesson_plantation_id, status : "1" } }
      });
      request.done(function() {
        // xxx - make this a notice, not alert
        alert("Added to to-do list.");
      });
    } 
  else
    {
      window.location = "/sign_up";
      // xxx - how to pass parameter lesson_plantation_id with window.location
      //alert("Log in or create account to save item to to-do list.");
    };
}

function add_knowledge_to_log (link, user_id, knowledge_id) {
  //http://api.jquery.com/jQuery.ajax/
  console.log(link);
  console.log(link.href);
  console.log(user_id);
  console.log(knowledge_id);

  if (user_id>0)
    {
      var request = $.ajax({
        type: "POST",
        url: "/logs",
        data: { log : { user_id : user_id, knowledge_id: knowledge_id, status : "1" } }
      });
      request.done(function() {
        alert("Added to to-do list.");
      });
    } 
  else
    {
      window.location = "/sign_up";
      // xxx - how to pass parameter knowledge_id with window.location
      //alert("Log in or create account to save item to to-do list.");
    };
}

// AJAX for search
$(function() {
	$("#knowledges_search input").keyup(function() {
	  $.get($("#knowledges_search").attr("action"), $("#knowledges_search").serialize(), null, "script");
	  return false;
	});
});