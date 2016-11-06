$(document).on('turbolinks:load', function() {
  submitNewMessage();
});

$(document).ready(function() {
    $("#arrow").click(function() {
        $("#sidebar").width(250);
        $("#container").css({left: 250});
        $("#container").width($(window).width() - 250);
    });
    $("#closeBtn").click(function() {
        $("#sidebar").width(0);
        $("#container").css({left: 0});
        $("#container").width($(window).width());
    });
});

function submitNewMessage(){
  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val(" ")
        return false;
     }
  });
}
