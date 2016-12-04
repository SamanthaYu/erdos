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

$(document).on("click", '#imgUpload_submit', function () {
    closeImgUploadForm();
});

$(document).on("click", '#message_content', function () {
    clearImgUploadForm();
});

function closeEditForm() {
    $('#editForm').fadeOut("swing");
    return false;
}

function closeDeleteForm() {
    $('#deleteForm').fadeOut("swing");
    return false;
}

function closeImgUploadForm() {
    $('#imgUploadForm').fadeOut("swing");
    //$('#imgUploadForm').html("");
    return false;
}

function clearImgUploadForm() {
    $('#imgUploadForm').fadeOut("swing");
    $('#imgUploadForm').html("");
    return false;
}
