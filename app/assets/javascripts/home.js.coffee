jQuery ->
  $("#map-canvas").width($("#main-wrapper").width())

  $(window).on 'resize', ->
    $("#map_canvas").css('width' , $("#main-wrapper").width())

