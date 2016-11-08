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
    $('#messages').scrollTop($('#messages').height());
'}
