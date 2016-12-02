$(window).load(function() {
  $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight});
});

$(document).on("click", '#editmessage_submit', function () {
    closeEditForm();
});

$(document).on("click", '#deletemessage_submit', function () {
    alert($(this).parent());
    closeDeleteForm();
});

function closeEditForm() {
    $('#editForm').fadeOut("swing");
}

function closeDeleteForm() {
    $('#deleteForm').fadeOut("swing");
}
