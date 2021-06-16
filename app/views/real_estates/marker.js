mapboxgl.accessToken = "<%=ENV['MAPBOX_API_KEY']%>";

var map = new mapboxgl.Map({
container: 'map',
style: 'mapbox://styles/mapbox/streets-v11',
center: [3, 43],
zoom: 5
});
 
let dataset_marker = document.getElementById("marker").value;

const markers = JSON.parse(dataset_marker)
console.log(markers[0]);
markers.forEach(function (marker) {
  var el = document.createElement('div');
  el.className = 'marker';
  el.style.backgroundImage =
  "url(https://png.pngtree.com/png-vector/20190115/ourmid/pngtree-vector-location-icon-png-image_317888.jpg)";
  el.style.width = '64px';
  el.style.height = '64px';
  el.style.backgroundSize = '100%';

  el.addEventListener('click', function () {
  window.alert(marker.properties.message);
  });
  new mapboxgl.Marker(el)
  .setLngLat(marker.coordinates)
  .addTo(map);
});