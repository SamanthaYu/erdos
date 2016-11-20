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
//= require_tree .

document.addEventListener("turbolinks:load", function() {
    renderAllMessages();
    renderAllUsernames();
    renderAllButtons();

    $('.mathButton').click(function() {
      var mathSymbol = $(this).data('val');
      var content = $('#message_content').val();

      var start = $('#message_content')[0].selectionStart;
      var end = $('#message_content')[0].selectionEnd;

      var newContent = content.substr(0, start) + mathSymbol + content.substr(end);
      $('#message_content').val(newContent);

      $('#message_content')[0].selectionStart = start + mathSymbol.length;
      $('#message_content')[0].selectionEnd = $('#message_content')[0].selectionStart;
      $('#message_content').focus();
    });
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
