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
    alert(val);
    val++;
    counter.replaceWith('<span class="notificationCounter" id="counter">'+data.counter+'</span>');
    return;
  },

  renderNotification: function(data) {
    var retmess='';
    retmess+='<li>'+data.event+'<span class="timeStamp">'+data.timestamp+'</span></li>';
    return retmess;
  }
});
