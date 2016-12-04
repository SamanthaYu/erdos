App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    if ($('h1').text()===data.chatroomname){
        if (data.type == "new"){
          $("#messages").removeClass('hidden');
          $('#messages').append(this.renderMessage(data));
          scrollBottom();
          renderLastMessage();
          renderLastUsername();
      }
        else if (data.type == "edit"){
            var calltag="messageContent"+data.id;
            var calltimetag="currentUserTime"+data.id;
            $("#"+calltag).replaceWith('<div id="messageContent'+data.id+'" class="messageContent">'+data.message+'</div>');
            $("#"+calltimetag).replaceWith('<span class="currentUserTime" id="currentUserTime'+data.id+'">'+data.createtimestamp+', last edited: '+data.edittimestamp+'</span>');
            renderThisMessage(calltag);
        }
        else {
            var parenttag = $("#messageContent"+data.id).parent();
            parenttag.fadeOut("swing");
        }
    }
    return;
  },

  renderMessage: function(data) {
    var retmess='';
    var timestamp=data.timestamp;//LocalTime.relativeTimeAgo(new Date(data.timestamp));
    var avatarlink1='<span class="userAvatar" id="currentUserAvatar"><img src="'+data.avatarurl+'"></span>';
    var avatarlink2='<span class="userAvatar" id="otherUserAvatar"><img src="'+data.avatarurl+'"></span>';

    if ($('#currentUser').attr('name') == data.poster){
      retmess+='<div id="currentUserMessage" class="message"><div class="messageHeader"><p><span id="messageActions" style="float:left">';
      retmess+='<a class="wolframAlphaLink">WolframAlpha</a> | ';
      retmess+='<a href="'+data.editlink+'" data-remote="true" id="edit_link">edit</a> | ';
      retmess+='<a href="'+data.deletelink+'" data-remote="true" id="delete_link">delete</a></span>';
      retmess+='<span class="currentUserTime" id="currentUserTime'+data.id+'">' + timestamp + '</span><span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+=avatarlink1+'</p>';
    }
    else {
      retmess+='<div id="otherUserMessage" class="message">';
      retmess+='<div class="messageHeader"><p>'+ avatarlink2 +'<span class="username"><strong>'+data.poster+'</strong></span>';
      retmess+='<span class="timeStamp">' + timestamp + '</span></p>';
      retmess+='<a class="wolframAlphaLink">WolframAlpha</a>';
    }

    retmess+='<div id="messageContent'+data.id+'" class="messageContent" content="<%=message.content%> "'>;
    if (data.isimage==0)
      retmess+=data.message;
    else {
      retmess+='<img src="'+data.imagemessageurl+'">';
    }
    retmess+='</div></div>';
    return retmess;
    //return "<p> <b>" + data.poster + ": </b>" + data.message + "</p>";
    }
});
