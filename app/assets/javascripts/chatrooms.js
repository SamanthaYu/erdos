document.addEventListener("turbolinks:load", function() {
  submitNewMessage();
  scrollBottom();
  renderLastMessage();
  renderLastUsername();
  renderTyping();
})

function submitNewMessage(){
  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val("")
        return false;
     }
  });
}

function scrollBottom() {
    //$("messageContainer").scrollTop($('#messageContainer').last().scrollHeight);
    $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight });
    //$("#messageContainer").animate({ scrollTop: $('#message').last().scrollHeight });
}
