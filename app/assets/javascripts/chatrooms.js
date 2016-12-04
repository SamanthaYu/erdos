document.addEventListener("turbolinks:load", function() {
  submitNewMessage();
//  submitImageMessage();
  scrollBottom();
  renderLastMessage();
  renderLastUsername();
  renderTyping();
})

function submitNewMessage(){

  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {

      $('#message_content').val("")
        $('#message_submit').click();
        return false;
     }
  });
}

/*
function submitImageMessage(){
  $("#imgmessage").change(function(){
      $('#imgmessage_submit').click();
      $("#imgmessage").html($('#imgmessage').val());
      return false;
  });
}*/

function scrollBottom() {
    //$("messageContainer").scrollTop($('#messageContainer').last().scrollHeight);
    $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight });
    //$("#messageContainer").animate({ scrollTop: $('#message').last().scrollHeight });
}
