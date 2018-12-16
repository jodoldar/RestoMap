initMap = function(lat, lng) {
    var myCoords = L.latLng(lat,lng);

    var mapOptions = {
        center: myCoords,
        zoom: 15
    };

    var map = L.map('map',mapOptions);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    L.marker(myCoords).addTo(map)
}