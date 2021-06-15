const mapElement = document.getElementById('map');
mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
var map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v11',
  center: [3.501873,44.517611],
  zoom: 8,
});

const markers= JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker)=> {
    new maxpboxg.Marker()
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(new mapboxgl.Popup({ offset: 25})
      .setHTML( "<h1> Hello World!</h1>"
      ))
      .addTo(map);
})