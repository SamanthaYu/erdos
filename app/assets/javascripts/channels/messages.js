App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    if ($('h1').text()===data.chatroomname){
      $("#messages").removeClass('hidden');
      $('#messages').append(this.renderMessage(data));
      scrollBottom();
      renderLastMessage();
      renderLastUsername();
    }
    return;
  },

  renderMessage: function(data) {
    var retmess='';
    var timestamp=data.timestamp;//LocalTime.relativeTimeAgo(new Date(data.timestamp));
    var avatarlink1='<span class="userAvatar" id="currentUserAvatar"><img src="'+data.avatarurl+'"></span>';
    var avatarlink2='<span class="userAvatar" id="otherUserAvatar"><img src="'+data.avatarurl+'"></span>';

    if ($('.username') == data.poster){
      retmess+='<div id="currentUserMessage" class="message">';
      retmess+='<div class="messageHeader"><p><span class="timeStamp" id="currentUserTime">' + timestamp + '</span><span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+=avatarlink1+'</p>';
    }
    else {
      retmess+='<div id="otherUserMessage" class="message">';
      retmess+='<div class="messageHeader"><p>'+ avatarlink2 +'<span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+='<span class="timeStamp">' + timestamp + '</span></p>';
    }

    retmess+='</div><div class="messageContent">'+data.message + '</div></div>';
    return retmess;
    //return "<p> <b>" + data.poster + ": </b>" + data.message + "</p>";
  }
});
