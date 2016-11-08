App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));//"<p>"+ data.message + "</p>");//this.renderMessage(data));
  },

  renderMessage: function(data) {
    var retmess='';
    var timestamp=data.timestamp;

    if (data.currentuser==data.poster){
      retmess+='<div id="currentUserMessage" class="message">';
      retmess+='<div class="messageHeader"><p><span id="currentUserTime" class="timeStamp">' + timestamp + '</span>';
      retmess+='<span class="username"><strong>'+data.poster+'</strong></span></p>';
    }
    if (data.currentuser!=data.poster){
      retmess+='<div id="otherUserMessage" class="message">';
      retmess+='<div class="messageHeader"><p><span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+='<span class="timeStamp">' + timestamp + '</span></p>';
    }

    retmess+='</div><div class="messageContent">'+data.message + '</div></div>';
    return retmess;
    //return "<p> <b>" + data.poster + ": </b>" + data.message + "</p>";
  }
});
