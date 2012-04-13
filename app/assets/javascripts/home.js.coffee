jQuery ->
  $("#map_canvas").css('width' , $("#main-wrapper").width())

  $(window).on 'resize', ->
    $("#map_canvas").css('width' , $("#main-wrapper").width())

