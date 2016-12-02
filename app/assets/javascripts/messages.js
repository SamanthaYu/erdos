$(window).load(function() {
  $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight});
});

$(document).on("click", '#editmessage_submit', function () {
    closeEditForm();
});

function closeEditForm() {
    $('#editForm').fadeOut("swing");
}
