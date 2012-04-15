jQuery ->
  $("#map_canvas").css('width' , $("#main-wrapper").width())
  $("#route_details").hide()

  $(window).on 'resize', ->
    $("#map_canvas").css('width' , $("#main-wrapper").width())

