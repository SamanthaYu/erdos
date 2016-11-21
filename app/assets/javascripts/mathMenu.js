document.addEventListener("turbolinks:load", function() {
  $('.mathButton').click(function() {
    var mathSymbol = $(this).data('val');
    var content = $('#message_content').val();

    var start = $('#message_content')[0].selectionStart;
    var end = $('#message_content')[0].selectionEnd;

    var beforeInsert = content.substr(0, start);
    var afterInsert = content.substr(end);

    var newContent = beforeInsert + mathSymbol + afterInsert;
    $('#message_content').val(newContent);

    $('#message_content')[0].selectionStart = start + mathSymbol.length;
    $('#message_content')[0].selectionEnd = $('#message_content')[0].selectionStart;
    $('#message_content').focus();
  });
});

function updateRender() {
  document.getElementById('#mathRender').value = document.getElementById('#message_content').value;
};
