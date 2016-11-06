$(document).on('turbolinks:load', function() {
  submitNewMessage();
});

$(document).ready(function() {
    $("#sideBarOpener").click(function(){
        $("#sideBarOpener").hide();
        $("#sidebar").width(250);
        $("#container").css({left: 250});
        $("#container").width($(window).width() - 250);
    });
    $("#closeBtn").click(function() {
        $("#sidebar").width(0);
        $("#container").css({left: 0});
        $("#container").width($(window).width());
        setTimeout(function() {
            $("#sideBarOpener").show();
        }, 500);
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
