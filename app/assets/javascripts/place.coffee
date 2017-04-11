
jQuery ->

lat_field = $('#place_latitude')
lng_field = $('#place_longitude')

window.initMap = ->
  map.addListener 'click', (e) ->
    updateFields e.latLng


updateFields = (latLng) ->
  lat_field.val latLng.lat()
  lng_field.val latLng.lng()
