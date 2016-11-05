$(document).on('turbolinks:load', function() {
  submitNewMessage();
});

$(document).ready(function() {
    $("#sidebar").hover(
        function(){
        $("#sidebar").css("background-color", "#55c6aa");
    }, function() {
        $("#sidebar").css("background-color", "#182031");
    });
    $("#sidebar").click(function() {
        $("#sidebar").width(250);
        $("#container").css({left: 250});
    });
    if ($("#sidebar").width() == 250) {
        $("#sidebar").click(function() {
            $("#sidebar").width(10);
            $("#container").css({left: 10});
        });
    }
});

function closeSidebar() {
    $("#sidebar").style.width = "10px";
    $("#container").style.left = "10px";
}

function submitNewMessage(){
  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val(" ")
        return false;
     }
  });
}
