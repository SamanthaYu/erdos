App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden');
    $('#messages').append(this.renderMessage(data));
    scrollBottom();
    renderLastMessage();
    renderLastUsername();
    return;
  },

  renderMessage: function(data) {
    var retmess='';
    var timestamp=data.timestamp;
    var avatarlink='<span class="userAvatar"><img src="'+data.avatarurl+'"></span>'
    if (data.currentuser==data.poster){
      retmess+='<div id="currentUserMessage" class="message">';
      retmess+='<div class="messageHeader"><p>' + avatarlink +'<span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+='<span class="timeStamp">' + timestamp + '</span></p>';
    }
    if (data.currentuser!=data.poster){
      retmess+='<div id="otherUserMessage" class="message">';
      retmess+='<div class="messageHeader"><p>' + avatarlink +'<span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+='<span class="timeStamp">' + timestamp + '</span></p>';
    }

    retmess+='</div><div class="messageContent">'+data.message + '</div></div>';
    return retmess;
    //return "<p> <b>" + data.poster + ": </b>" + data.message + "</p>";
  }
});
