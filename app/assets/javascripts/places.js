function showMap(lat, lng) {
    var myCoords = L.latLng(lat,lng);

    var mapOptions = {
        center: myCoords,
        zoom: 15
    };

    var map = L.map('showMap',mapOptions);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    L.marker(myCoords).addTo(map)
}

function indexMap(lat, lng, places) {
    var myCoords = L.latLng(lat,lng);

    var mapOptions = {
        center: myCoords,
        zoom: 10
    };

    var map = L.map('indexMap',mapOptions);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    for (const place in places) {
        L.marker(place).addTo(map)
    }
}

var createMarker;

function createMap(lat, lng) {
    var latitude = document.getElementById('place_latitude').value = lat;
    var longitude = document.getElementById('place_longitude').value = lng;

    var myCoords = L.latLng(lat,lng);

    var mapOptions = {
        center: myCoords,
        zoom: 10
    };

    var map = L.map('createMap',mapOptions);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    createMarker = L.marker(myCoords, {draggable: true});
    createMarker.addTo(map);

    createMarker.on('drag', function(){
        latlng = createMarker.getLatLng();
        document.getElementById('place_latitude').value = latlng.lat;
        document.getElementById('place_longitude').value = latlng.lng;
    });
}

// refresh marker position and recenter map on marker
function refreshMarker(){
    var lat = document.getElementById('place_latitude').value;
    var lng = document.getElementById('place_longitude').value;
    var myCoords = L.latLng(lat, lng);
    createMarker.setLatLng(myCoords).update();
    map.panTo(createMarker.getLatLng());   
}


