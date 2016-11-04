App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    alert("alright");
    see();
    renderMath(data);

    return "<p> <b>" + "Call Me Ishmael" + ": </b>" + renderMath(data) + "</p>";
  }
});
