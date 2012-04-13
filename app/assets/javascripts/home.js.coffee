jQuery ->
  $("#map-canvas").width($("#main-wrapper").width())

  $(window).on 'resize', ->
    $("#map-container-wide iframe").width($("body").width())
    google.maps.event.trigger(map, "resize");
