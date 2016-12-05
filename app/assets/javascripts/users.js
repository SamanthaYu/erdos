$(document).on("click", "#closeBtn1", function() {
    window.location.href = "/";
});

function showGuestLogin(formID){
    $("#"+formID).fadeOut("swing", function(){
        $("#guestLogin").fadeIn("swing");
    });
}

function closeGuestLogin(formID){
    $("#guestLogin").fadeOut("swing", function(){
        $("#"+formID).fadeIn("swing");
    });
}
