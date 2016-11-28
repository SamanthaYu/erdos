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

    if ($('#currentUser').attr('name') == data.poster){
      retmess+='<div id="currentUserMessage" class="message"><div class="messageHeader"><p>';
      retmess+='<a href="'+data.editlink+'" data-remote="true" style="float:left">edit</a>';
      retmess+='<span class="timeStamp" id="currentUserTime'+data.id+'">' + timestamp + '</span><span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+=avatarlink1+'</p>';
    }
    else {
      retmess+='<div id="otherUserMessage" class="message">';
      retmess+='<div class="messageHeader"><p>'+ avatarlink2 +'<span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+='<span class="timeStamp">' + timestamp + '</span></p>';
    }

    retmess+='</div><div id="messageContent'+data.id+'">'+data.message + '</div></div>';
    return retmess;
    //return "<p> <b>" + data.poster + ": </b>" + data.message + "</p>";
  }
});
