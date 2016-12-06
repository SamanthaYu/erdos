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

function closeWolframAlphaForm() {
    $('#wolframAlphaForm').fadeOut("swing");
    $('#information').html("");
    return false;
}

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

// Expand message area for drawing
function expandMessageBox(){
    $("#messageContainer").css({bottom: 210});
    $("#messageBoxExpander").hide();
    $("#messageBoxMinimizer").show();
    $("#inputForm").height(202);

    setTimeout(function() {
        $("#mathTyping").height(90);
    }, 20);

    scrollBottom();
}

// Minimize message area
function minimizeMessagebox() {
    $("#messageContainer").css({bottom: 135});
    $("#messageBoxMinimizer").hide();
    $("#messageBoxExpander").show();
    $("#inputForm").height(130);

    setTimeout(function() {
        $("#mathTyping").height(22);
    }, 20);
    scrollBottom();
}

// Open message area
function openMessageBox(){
    minimizeMessagebox();
    $("#messageBoxOpener").hide();
    $("#messageBoxCloser").show();
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
