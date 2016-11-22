// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree ./channels
//= require math
//= require mathMenu
//= require chatrooms
//= require welcome
//= require local_time
//= require_tree .

document.addEventListener("turbolinks:load", function() {
    renderAllMessages();
    renderAllUsernames();
    renderAllButtons();
    renderTyping();
});

function openSidebar(){
    $("#sideBarOpener").hide();
    $("#sideBarCloser").show();
    $("#sidebar").width(275);
    $("#container").css({left: 275});
    $("#sideBarCloser").css({left:275});
    $("#container").width($(window).width() - 275);
};
function closeSidebar() {
    $("#sidebar").width(0);
    $("#container").css({left: 0});
    $("#sideBarCloser").css({left:0});
    $("#container").width($(window).width());
    setTimeout(function() {
        $("#sideBarOpener").show();
        $("#sideBarCloser").hide();
    }, 500);
};
