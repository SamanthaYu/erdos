document.addEventListener("turbolinks:load", function() {
  $('#message_content').keyup(function() {
    renderTyping();
  });

  $('.mathButton').click(function() {
    $('#message_content').focus();
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

    renderTyping();
  });
});

function renderTyping() {
  $('#mathTyping').text($('#message_content').val());
  renderMath(document.getElementById('mathTyping'));
};
