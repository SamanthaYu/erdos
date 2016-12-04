function wolframAlpha(messageId) {
    var inputUrl = $(messageId).text();
    inputUrl.replace("$", "");	// So it will replace /$ with / (not what should happen)

    var urlified = inputUrl.split(' ').join('+');
    var wolfram = "http://api.wolframalpha.com/v2/query?input=" + urlified + "&appid=8WX3PP-5UVAT8YAY7";
    var proxy = 'https://cors-anywhere.herokuapp.com/';	// To bypass the CORS policy (cross-origin resource sharing)

    $(messageId).append("<br/>Computing...")
    $(messageId).append("<a href='http://www.wolframalpha.com/input/?i=" + inputUrl + "'' target='_blank'>View in Wolfram Alpha</a><br />")

    $.ajax({
        type: "GET",
        url: proxy + wolfram,
        dataType: "xml",
        success: function(result) {
            $(result).find("pod").each(function() {
                $(messageId).append("<b>" + $(this).attr('title') + "</b>" + "<br />");
                
                $(this).find("img").each(function() {
                    $(messageId).append("<img src = '" + $(this).attr('src') + "' alt = '" + $(this).attr('alt') + "' title = '" + $(this).attr('title') + "' width = '" + $(this).attr('width') + "' height = '" + $(this).attr('height') + "'</img><br />");
                });

                $(messageId).append("<br/>");
                scrollBottom();
            });
        }
    });
}
