$(window).load(function() {
  if ($('#messageContainer')[0]) {
    $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight});
  }
});

$(document).on("click", '#editmessage_submit', function () {
    closeEditForm();
});

$(document).on("click", '#deletemessage_submit', function () {
    closeDeleteForm();
});

function closeEditForm() {
    $('#editForm').fadeOut("swing");
    return false;
}

function closeDeleteForm() {
    $('#deleteForm').fadeOut("swing");
    return false;
}
