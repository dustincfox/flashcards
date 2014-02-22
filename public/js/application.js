$(document).ready(function() {
  $("#login").hide()
  $('.login-button').on("click", function(e) {
    e.preventDefault;
    $("#login").toggle()
  });

  $('#question-form').on('submit', function(event){
    event.preventDefault();
    var data = ($("#answer").serialize())
    var path = window.location.pathname;
    var route = (path + "/outcome")
    $.post(route, data, function(response){
      $("#result_container").html(response);
    });
  });


});
