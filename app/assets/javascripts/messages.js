$(window).load(function() {
  $("#messageContainer").animate({ scrollTop: $('#messageContainer')[0].scrollHeight});
});

function openMessageBox(){
    $("#messageBoxOpener").hide();
    $("#inputForm").height(200);
    setTimeout(function() {
      $("#messageContainer").css({bottom: 200});
    }, 500);
};
function closeMessageBox() {
    $("#inputForm").height(0);
    $("#messageContainer").css({bottom: 0});
    setTimeout(function() {
        $("#messageBoxOpener").show();
    }, 500);
};
