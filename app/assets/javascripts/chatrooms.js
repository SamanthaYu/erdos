$(document).on('turbolinks:load', function() {
  submitNewMessage();
  scrollBottom();
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

function scrollBottom() {
  $("messageContainer").scrollTop($('#messages').last().scrollHeight);

  return;
      //$("#messageContainer").animate({ scrollTop: $('#message').last().scrollHeight });
      //$("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight });
}
