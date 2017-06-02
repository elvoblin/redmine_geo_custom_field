RedmineGeoCustomField = {
  initMap: function(elementId, center, zoom){

    var centerPosition;
    centerPosition = this.positionFromValue(center);

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
  },

  positionFromValue(value){
    var p;
    var _position;
    p = value.split(',');
    _position = new google.maps.LatLng(parseFloat(p[0]), parseFloat(p[1]));
    if (isNaN(_position.lat()) || isNaN(_position.lng())){
      return null;
    }
    return _position;
  },

  positonToValue: function(position){
    return position.lat().toString().substring(0,10) + ', ' + position.lng().toString().substring(0,10);
  }
}
