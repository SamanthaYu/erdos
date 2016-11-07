App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));//"<p>"+ data.message + "</p>");//this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + "Call Me Ishmael" + ": </b>" +data.message+ "</p>";
  }
});
