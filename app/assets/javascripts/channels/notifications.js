App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#notificationList').prepend(this.renderNotification(data));

    var counter = $('#counter');
    var val = data.counter;
    counter.replaceWith('<span class="notificationCounter" id="counter">'+val+'</span>');
    return;
  },

  renderNotification: function(data) {
    var retmess='';
    retmess+='<li><span style="background-color: #eee"><a href="'+data.chatroomlink+'">'+data.event+'</a></span>';
    retmess+='<span class="timeStamp">'+data.timestamp+'</span></li>';
    retmess+='<ul>'+data.content+'</ul>';
    return retmess;
  }
});
