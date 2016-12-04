$(window).load(function() {
  $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight});
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

// Open message area
}
function openMessageBox(){
    $("#messageBoxOpener").hide();
    $("#inputForm").height(200);
    setTimeout(function() {
      $("#messageContainer").css({bottom: 200});
      $("#messageBoxCloser").show();
    }, 500);
}

// Close message area
function closeMessageBox() {
    $("#messageBoxCloser").hide();
    $("#inputForm").height(0);
    $("#messageContainer").css({bottom: 0});
    setTimeout(function() {
        $("#messageBoxOpener").show();
    }, 500);
}
