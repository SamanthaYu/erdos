document.addEventListener("turbolinks:load", function() {

  checkButtons("chatMathMenu", $("#chatMathTable"));
  renderTyping($('#mathTyping'), $('#message_content'));

  $("#chatMathMenu").change(function() {  // If the user has selected a new option from the dropdown
    checkButtons("chatMathMenu", $("#chatMathTable"));
  });

  $('#message_content').keyup(function() {
    renderTyping($('#mathTyping'), $('#message_content'));
  });

});

$(document).on("click", '#edit_link', function () {
    $ (document).ajaxComplete( function () {
        checkButtons("editMathMenu", $("#editMathTable"));
        renderTyping($('#editMathTyping'), $('#editmessage_content'));

        $("#editMathMenu").change(function() {  // If the user has selected a new option from the dropdown
          checkButtons("editMathMenu", $("#editMathTable"));
        });

        if ($('#editmessage_content')) {
            $('#editmessage_content').keyup(function() {
                renderTyping($('#editMathTyping'), $('#editmessage_content'));
            });
        }
    });

});


$(document).on("click", '.mathButton', function() {
    if ($(this).attr("id") === "chatMathMenuButton") {
        enterButton($(this), $('#mathTyping'), $('#message_content'));
    }
    else if ($(this).attr("id") === "editMathMenuButton") {
        enterButton($(this), $('#editMathTyping'), $('#editmessage_content'));
    }
});

function enterButton(thisObj, renderObj, contentObj) {
  contentObj.focus();
  var mathSymbol = thisObj.data('val');
  var content = contentObj.val();

  var start = contentObj[0].selectionStart;
  var end = contentObj[0].selectionEnd;

  var beforeInsert = content.substr(0, start);
  var afterInsert = content.substr(end);

  var newContent = beforeInsert + mathSymbol + afterInsert;
  contentObj.val(newContent);

  contentObj[0].selectionStart = start + mathSymbol.length;
  contentObj[0].selectionEnd = contentObj[0].selectionStart;
  contentObj.focus();

  renderTyping(renderObj, contentObj);
}

function checkButtons(menu, table) {
    if ($('#'+menu+' option:selected').text() == "Default") {
      table.html(
        "<tr>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\int$ '>$\\int$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\sum$ '>$\\sum$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\prod$ '>$\\prod$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\pm$ '>$\\pm$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\times$ '>$\\times$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\div$ '>$\\div$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\exists$ '>$\\exists$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\forall$ '>$\\forall$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\neg$ '>$\\neg$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\pi$ '>$\\pi$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\Delta$ '>$\\Delta$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\infty$ '>$\\infty$</td>\
        </tr>");
    }
    else if ($('#'+menu+' option:selected').text() == "Operators") {
     table.html(
        "<tr>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\pm$ '>$\\pm$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\times$ '>$\\times$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\div$ '>$\\div$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\neq$ '>$\\neq$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\leq$ '>$\\leq$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\geq$ '>$\\geq$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\ll$ '>$\\ll$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\gg$ '>$\\gg$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\subset$ '>$\\subset$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\supset$ '>$\\supset$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\subseteq$ '>$\\subseteq$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\supseteq$ '>$\\supseteq$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\nsubseteq$ '>$\\nsubseteq$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\nsupseteq$ '>$\\nsupseteq$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\equiv$ '>$\\equiv$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\approx$ '>$\\approx$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\propto$ '>$\\propto$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\neq$ '>$\\neq$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\neg$ '>$\\neg$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\in$ '>$\\in$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\notin$ '>$\\notin$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\perp$ '>$\\perp$</td>\
        </tr>");
    }
    else if ($('#'+menu+' option:selected').text() == "Greek Letters") {
     table.html(
        "<tr>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\alpha$ '>$\\alpha$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\beta$ '>$\\beta$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\gamma$ '>$\\gamma$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\delta$ '>$\\delta$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\alpha$ '>$\\alpha$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\zeta$ '>$\\zeta$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\eta$ '>$\\eta$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\iota$ '>$\\iota$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\kappa$ '>$\\kappa$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\lambda$ '>$\\lambda$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\mu$ '>$\\mu$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\nu$ '>$\\nu$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\xi$ '>$\\xi$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\pi$ '>$\\pi$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\sigma$ '>$\\sigma$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\tau$ '>$\\tau$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\upsilon$ '>$\\upsilon$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\phi$ '>$\\phi$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\chi$ '>$\\chi$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\psi$ '>$\\psi$</td>\
            <td class='mathButton' id='"+menu+"Button"+"'data-val='$\\omega$ '>$\\omega$</td>\
        </tr>");
    }

    renderAllButtons();
}

function renderTyping(renderObj, contentObj) {
  if (renderObj && renderObj) {
    renderObj.text(contentObj.val());
    if (contentObj.attr("id") === "message_content") {
        renderMath(document.getElementById('mathTyping'));
    }
    else if (contentObj.attr("id") === "editmessage_content") {
        renderMath(document.getElementById('editMathTyping'));
    }
  }
};
