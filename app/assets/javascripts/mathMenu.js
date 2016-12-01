document.addEventListener("turbolinks:load", function() {
  checkButtons();

  $("#mathMenu").change(function() {  // If the user has selected a new option from the dropdown
    checkButtons();
  });

  $('#message_content').keyup(function() {
    renderTyping($('#mathTyping'), $('#message_content'));

  });

});

$(document).on("click", '#edit_link', function () {
    setTimeout( function () {
        if ($('#editmessage_content')) {
            $('#editmessage_content').keyup(function() {
                renderTyping($('#editMathTyping'), $('#editmessage_content'));
            });
        }
    }, 500);
});


$(document).on("click", '.mathButton', function() {
    enterButton($(this), $('#mathTyping'), $('#message_content'));
});

function enterButton(thisObj, renderID, contentID) {
  contentID.focus();
  var mathSymbol = thisObj.data('val');
  var content = contentID.val();

  var start = contentID[0].selectionStart;
  var end = contentID[0].selectionEnd;

  var beforeInsert = content.substr(0, start);
  var afterInsert = content.substr(end);

  var newContent = beforeInsert + mathSymbol + afterInsert;
  contentID.val(newContent);

  contentID[0].selectionStart = start + mathSymbol.length;
  contentID[0].selectionEnd = contentID[0].selectionStart;
  contentID.focus();

  renderTyping(renderID, contentID);
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
    else if ($('#mathMenu option:selected').text() == "Operators") {
      $('#mathTable').html(
        "<tr>\
            <td class='mathButton' data-val='$\\pm$ '>$\\pm$</td>\
            <td class='mathButton' data-val='$\\times$ '>$\\times$</td>\
            <td class='mathButton' data-val='$\\div$ '>$\\div$</td>\
            <td class='mathButton' data-val='$\\neq$ '>$\\neq$</td>\
            <td class='mathButton' data-val='$\\leq$ '>$\\leq$</td>\
            <td class='mathButton' data-val='$\\geq$ '>$\\geq$</td>\
            <td class='mathButton' data-val='$\\ll$ '>$\\ll$</td>\
            <td class='mathButton' data-val='$\\gg$ '>$\\gg$</td>\
            <td class='mathButton' data-val='$\\subset$ '>$\\subset$</td>\
            <td class='mathButton' data-val='$\\supset$ '>$\\supset$</td>\
            <td class='mathButton' data-val='$\\subseteq$ '>$\\subseteq$</td>\
            <td class='mathButton' data-val='$\\supseteq$ '>$\\supseteq$</td>\
            <td class='mathButton' data-val='$\\nsubseteq$ '>$\\nsubseteq$</td>\
            <td class='mathButton' data-val='$\\nsupseteq$ '>$\\nsupseteq$</td>\
            <td class='mathButton' data-val='$\\equiv$ '>$\\equiv$</td>\
            <td class='mathButton' data-val='$\\approx$ '>$\\approx$</td>\
            <td class='mathButton' data-val='$\\propto$ '>$\\propto$</td>\
            <td class='mathButton' data-val='$\\neq$ '>$\\neq$</td>\
            <td class='mathButton' data-val='$\\neg$ '>$\\neg$</td>\
            <td class='mathButton' data-val='$\\in$ '>$\\in$</td>\
            <td class='mathButton' data-val='$\\notin$ '>$\\notin$</td>\
            <td class='mathButton' data-val='$\\perp$ '>$\\perp$</td>\
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

function renderTyping(renderID, contentID) {
  renderID.text(contentID.val());
  if (contentID.attr("id") === "message_content") {
      renderMath(document.getElementById('mathTyping'));
  }
  else if (contentID.attr("id") === "editmessage_content") {
      renderMath(document.getElementById('editMathTyping'));
  }
};
