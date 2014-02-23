$(document).ready(function() {
    $("#login").hide()
    $('.login-button').on("click", function(e) {
        e.preventDefault;
        $("#login").toggle()
    });

    $('#question-form').on('submit', function(event) {
        event.preventDefault();
        var data = ($("#answer").serialize())
        //console.log(data)
        var path = window.location.pathname;
        //console.log(path)
        var route = (path + "/outcome")
        //console.log
        $.post(route, data, function(response) {
            //console.log("reponse:" + response)
            $("#result_container").html(response);
        });
    });


});
