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
//= require jquery_ujs
//= require turbolinks
//= require_tree ./channels
//= require chatrooms
//= require math
//= require welcome
//= require_tree .

$(document).on('turbolinks:load', function(){
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
