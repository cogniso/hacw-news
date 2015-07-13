// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .
//= require jquery
//= require jquery_ujs

jQuery(function() {
  // Hide the button when the page loads
  $("#story_comment_submit").hide();
  
  // This runs a function when the body field is focused
  $("#story_comment_body").focus(function() {
    // Slide down the button.
    $("#story_comment_submit").slideDown();
  }).blur(function() {
    // If the text area user leaves the text area (blur)
    // and there's no text in it then...
    if ($(this).val() == "") {
      // ... slide the button back up to hide it.
      $("#story_comment_submit").slideUp();
    }
  });

  // AJAX voting
  $(".js-vote").click(function(e) {
    e.preventDefault();
    $.ajax({
      dataType: 'json',
      method: 'post',
      url: $(this).attr('href'),
      success: function(data) {
        // Deactivate the voting link
        $(this).addClass('has-voted');
        // Update the number of points
        $(this).parents('.js-story').first('.js-points').innerHTML(data.points);
      },
      error: function() {
        alert("There was an error");
      }
    })
  });
});
