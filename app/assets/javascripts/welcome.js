$(document).ready(function(){
    $('#welcomeLogo').mapster({
        scaleMap: true,
        fillColor: 'ffffff',
        fillOpacity: 0.3
    });
    $("#button2").click(function(){
        $(".welcomePage").fadeOut("swing", function(){
            $(".loginForm").fadeIn("swing");
        });
    });
    $("#returnBtn").click(function(){
        $(".loginForm").fadeOut("swing", function(){
            $(".welcomePage").fadeIn("swing");
        });
    });
});
