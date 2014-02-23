$(document).ready(function() {
   $("#progressbar").progressbar({})
    $("#login").hide()
    $('.login-button').on("click", function(e) {
        e.preventDefault;
        $("#login").toggle()
    });
    // Progress bar & % correct
    $(window).load(function() {
        $incorrect = parseInt($('.incorrect').attr("id"))
        $correct = parseInt($('.correct').attr("id"))
        $deck_size = parseInt($('.deck_size').attr("id"))
        $percent_score = (($correct / $deck_size) * 100)
        var answered = $correct + $incorrect
        $(".meter span").attr("style","width: " + (100 * answered/$deck_size) + "%")
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
            $("#result_container").html(response);
        });
    });
    
    $('.joke-answer').hide()
    $('.joke').hover(function() {
        $('.joke-answer').show()
    });
   

    
    



});
