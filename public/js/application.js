$(document).ready(function() {
    $("#login").hide()
    $('.login-button').on("click", function(e) {
        e.preventDefault;
        $("#login").toggle()
    });
    // Progress bar & % correct
    $(window).load(function() {
        $correct = $('.correct').attr("id")
        $p = parseInt($('.correct').attr("id"))
        $b = parseInt($('.deck_size').attr("id"))
        $(".num").text(($p/$b * 100) + '%')
    })

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
    $('.joke-answer').hide()
    $('.joke').hover(function() {
        $('.joke-answer').show()
    });
   

    
    



});
