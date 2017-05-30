RedmineGeoCustomField = {
  initMap: function(elementId, center, zoom){

    var centerPosition;
    var ca = center.split(",");

    centerPosition = new google.maps.LatLng(parseFloat(ca[0]), parseFloat(ca[1]));

    var map = new google.maps.Map(document.getElementById(elementId), {
      zoom: zoom,
      center: centerPosition
    });

    return map;
  },

  placeMarkerInMapCenter(map){

    var markerPosition = map.getCenter();
    var marker = new google.maps.Marker({map: map});

    map.setCenter(markerPosition);
    marker.setPosition(markerPosition);
    return marker;
  }
}
