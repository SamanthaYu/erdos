function wolframAlpha(messageId, informationDiv) {
    $("#"+messageId).text($("#"+messageId).attr('content'));
    renderThisMessage(messageId);

    var inputUrl = $("#"+messageId).attr('content');
    inputUrl = inputUrl.replace(/[$,]/g, "");	// Removes all $; it will replace /$ with / (not what should happen)

    var urlified = inputUrl.split(' ').join('+');
    var wolfram = "http://api.wolframalpha.com/v2/query?input=" + urlified + "&appid=8WX3PP-5UVAT8YAY7";
    var proxy = 'https://cors-anywhere.herokuapp.com/';	// To bypass the CORS policy (cross-origin resource sharing)

    $("#"+informationDiv).append("<a href='http://www.wolframalpha.com/input/?i=" + inputUrl + "'' target='_blank'>View in Wolfram Alpha</a>")

    $.ajax({
        type: "GET",
        url: proxy + wolfram,
        dataType: "xml",
        success: function(result) {
            $("#"+informationDiv).append("<br/></br>Computing...<br/></br>");
            $(result).find("didyoumean").each(function() {
                $("#"+informationDiv).append('Wolfram asks, "Did you mean: "' + $(this).html() + '?<br/>');
            });

            $(result).find("pod").each(function() {
                $("#"+informationDiv).append("<b>" + $(this).attr('title') + "</b>" + "<br />");

                $(this).find("img").each(function() {
                  $("#"+informationDiv).append("<img src='"+$(this).attr('src')+"'alt='"+$(this).attr('alt')+"'title ='"+$(this).attr('title')+"'width='"+$(this).attr('width')+"'height='"+$(this).attr('height')+"'</img><br />");
                  alert('img');
                });
            });
            $("#"+informationDiv).append("</br>Computing Done!<br/");
        },
        error: function() {
            $("#"+informationDiv).append("<br/>Sorry an error occurred.")
        }
    });
}
