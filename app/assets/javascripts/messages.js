$(window).load(function() {
  $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight});
});

function openEditForm() {
    $('#editForm').fadeIn("swing");
}

function closeEditForm() {
    $('#editForm').fadeOut("swing");
}
