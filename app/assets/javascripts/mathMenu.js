document.addEventListener("turbolinks:load", function() {
  checkButtons();

  $("#mathMenu").change(function() {  // If the user has selected a new option from the dropdown
    checkButtons();
  });

  $('#message_content').keyup(function() {
    renderTyping();
  });
});

$(document).on("click", '.mathButton', function() {
  enterButton($(this));
});

function enterButton(thisObj) {
  $('#message_content').focus();
  var mathSymbol = thisObj.data('val');
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
}

function checkButtons() {
    if ($('#mathMenu option:selected').text() == "Default") {
      $('#mathTable').html(
        "<tr>\
            <td class='mathButton' data-val='$\\int$ '>$\\int$</td>\
            <td class='mathButton' data-val='$\\pm$ '>$\\pm$</td>\
            <td class='mathButton' data-val='$\\exists$ '>$\\exists$</td>\
        </tr>");
    }
    else if ($('#mathMenu option:selected').text() == "Greek Letters") {
      $('#mathTable').html(
        "<tr>\
            <td class='mathButton' data-val='$\\alpha$ '>$\\alpha$</td>\
            <td class='mathButton' data-val='$\\beta$ '>$\\beta$</td>\
            <td class='mathButton' data-val='$\\gamma$ '>$\\gamma$</td>\
        </tr>");
    }

    renderAllButtons();
}

function renderTyping() {
  $('#mathTyping').text($('#message_content').val());
  renderMath(document.getElementById('mathTyping'));
};
