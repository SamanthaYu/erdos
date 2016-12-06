App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    var elementToPrepend = '<div class="notificationMessage" style="background-color: #eee">'+this.renderNotification(data)+'</div>';

    $(elementToPrepend).hide().prependTo('#notificationsBody').fadeIn("swing");
    renderRecentNotification();

    var val = data.counter;
    if ($('h1').attr("content") === data.chatroomname || $('h1').text() === data.receiver+"'s Notifications"){
      return;
    }
    if ( val >= 0 && val <= 100){
      var counter = $('#counter');
      if (val == 100) {
          counter.replaceWith('<span class="notificationCounter" id="counter">99+</span>');
      }
      else {
        counter.replaceWith('<span class="notificationCounter" id="counter">'+val+'</span>');
      }
    }
    return;
  },

  renderNotification: function(data) {
    var retmess='';
    retmess+='<span class="glyphicon glyphicon-comment"></span>';
    retmess+='<a href="'+data.chatroomlink+'">'+data.event+'</a>';
    retmess+='<span class="timeStamp">'+data.timestamp+'</span>';
    if (data.imagemessageurl == "THISISNOTANIMAGE"){
      retmess+='<ul>'+data.sender+': '+data.message+'</ul></span>';
    }
    else {
      retmess+='<img src="'+data.imagemessageurl+'" style="max-width: 100%; padding:10px;">';
    }
    return retmess;
  }
});
