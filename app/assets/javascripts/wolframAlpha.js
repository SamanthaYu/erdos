function wolframAlpha(messageId) {
    var inputUrl = $(messageId).attr('content');
    inputUrl = inputUrl.replace(/[$,]/g, "");	// Removes all $; it will replace /$ with / (not what should happen)

alert(inputUrl);
    var urlified = inputUrl.split(' ').join('+');
    var wolfram = "http://api.wolframalpha.com/v2/query?input=" + urlified + "&appid=8WX3PP-5UVAT8YAY7";
    var proxy = 'https://cors-anywhere.herokuapp.com/';	// To bypass the CORS policy (cross-origin resource sharing)

    $(messageId).append("<br/><a href='http://www.wolframalpha.com/input/?i=" + inputUrl + "'' target='_blank'>View in Wolfram Alpha</a>")

    $.ajax({
        type: "GET",
        url: proxy + wolfram,
        dataType: "xml",
        success: function(result) {
            $(messageId).append("<br/>Computing...<br/>")
            var oldContent = $(messageId).attr('content');

            $(result).find("pod").each(function() {
                $(messageId).append("<b>" + $(this).attr('title') + "</b>" + "<br />");

                $(this).find("img").each(function() {
                    $(messageId).append("<img src = '" + $(this).attr('src') + "' alt = '" + $(this).attr('alt') + "' title = '" + $(this).attr('title') + "' width = '" + $(this).attr('width') + "' height = '" + $(this).attr('height') + "'</img><br />");
                });
            });
        },
        error: function() {
            $(messageId).append("<br/>Sorry an error occurred.")
        }
    });
}
