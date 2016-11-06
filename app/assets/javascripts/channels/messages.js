App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#message").removeClass('hidden')
    return $('#message').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + "Call Me Ishmael" + ": </b>" + data.message + "</p>";
  }
});
