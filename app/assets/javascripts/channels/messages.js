App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(renderMessage(data));//this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + "Call Me Ishmael" + ": </b>"  "</p>";
  }
});
