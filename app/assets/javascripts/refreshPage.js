document.addEventListener("turbolinks:load", function() {
    renderAllMessages();
    renderAllUsernames();
});

function openSidebar(){
    $("#sideBarOpener").hide();
    $("#sidebar").width(250);
    $("#container").css({left: 250});
    $("#container").width($(window).width() - 250);
};
function closeSidebar() {
    $("#sidebar").width(0);
    $("#container").css({left: 0});
    $("#container").width($(window).width());
    setTimeout(function() {
        $("#sideBarOpener").show();
    }, 500);
};
