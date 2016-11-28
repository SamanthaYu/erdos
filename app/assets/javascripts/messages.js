$(window).load(function() {
  $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight});
});

function closeEditForm() {
    $('#editForm').fadeOut("swing");
}
