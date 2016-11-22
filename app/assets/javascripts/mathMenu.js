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
            <td class='mathButton' data-val='$\\delta$ '>$\\delta$</td>\
            <td class='mathButton' data-val='$\\alpha$ '>$\\alpha$</td>\
            <td class='mathButton' data-val='$\\zeta$ '>$\\zeta$</td>\
            <td class='mathButton' data-val='$\\eta$ '>$\\eta$</td>\
            <td class='mathButton' data-val='$\\iota$ '>$\\iota$</td>\
            <td class='mathButton' data-val='$\\kappa$ '>$\\kappa$</td>\
            <td class='mathButton' data-val='$\\lambda$ '>$\\lambda$</td>\
            <td class='mathButton' data-val='$\\mu$ '>$\\mu$</td>\
            <td class='mathButton' data-val='$\\nu$ '>$\\nu$</td>\
            <td class='mathButton' data-val='$\\xi$ '>$\\xi$</td>\
            <td class='mathButton' data-val='$\\pi$ '>$\\pi$</td>\
            <td class='mathButton' data-val='$\\sigma$ '>$\\sigma$</td>\
            <td class='mathButton' data-val='$\\tau$ '>$\\tau$</td>\
            <td class='mathButton' data-val='$\\upsilon$ '>$\\upsilon$</td>\
            <td class='mathButton' data-val='$\\phi$ '>$\\phi$</td>\
            <td class='mathButton' data-val='$\\chi$ '>$\\chi$</td>\
            <td class='mathButton' data-val='$\\psi$ '>$\\psi$</td>\
            <td class='mathButton' data-val='$\\omega$ '>$\\omega$</td>\
        </tr>");
    }

    renderAllButtons();
}

function renderTyping() {
  $('#mathTyping').text($('#message_content').val());
  renderMath(document.getElementById('mathTyping'));
};
