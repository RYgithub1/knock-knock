// ===== Divided Cases and Constants ================================
if (gon.currentUserLat && gon.currentUserLng) {
  var centerLat = parseFloat(gon.currentUserLat);
  var centerLng = parseFloat(gon.currentUserLng);
} else {
  var centerLat = 35.659482;
  var centerLng = 139.700553;
}
var mapCenter = { lat: centerLat, lng: centerLng };

var mapMarker = [];
var mapInfoWindow = [];
var infoWindowContent = [];

// ===== Function expression ========================================
function initMap() {
  var mapArea = document.getElementById("map");
  var mapOption = {
    center: mapCenter,
    zoom: 6,
    // PCzoom(ctrl/comm*scroll)_or_Mobile(2fingers)
    gestureHandling: "greedy",
    mapTypeControlOptions: {
      position: google.maps.ControlPosition.TOP_LEFT,
    },
    fullscreenControlOptions: {
      position: google.maps.ControlPosition.TOP_RIGHT,
    },
    streetViewControlOptions: {
      position: google.maps.ControlPosition.RIGHT_TOP,
    },
    zoomControlOptions: {
      position: google.maps.ControlPosition.RIGHT_TOP,
    },
    styles: [
      {
        featureType: "all",
        elementType: "all",
        stylers: [{ weight: 1 }, { lightness: -5 }, { saturation: 3 }],
      },
    ],
  };

  // ----- MAP ------------------------------------------
  var mapIs = new google.maps.Map(mapArea, mapOption);

  // ----- Location -------------------------------------
  for (var i = 0; i < gon.nameArray.length; i++) {
    // ````` Marker ````````````````````
    mapMarker[i] = new google.maps.Marker({
      position: new google.maps.LatLng(
        parseFloat(gon.latArray[i]),
        parseFloat(gon.lngArray[i])
      ),
      map: mapIs,
      title: "poke me",
      animation: google.maps.Animation.DROP,
      icon: {
        url: "https://maps.google.com/mapfiles/ms/micons/red-dot.png",
        scaledSize: new google.maps.Size(50, 50),
      },
      label: {
        text: "knock!",
        color: "blue",
        fontSize: "20px",
        fontWeight: "bold",
      },
    });
    // ````` InfoWindow ````````````````
    infoWindowContent[i] =
      '<div class="infoWindow">' +
      "<h4><b>Name : </b>" +
      gon.nameArray[i] +
      "</h4>" +
      "<h5><b>About : </b>" +
      gon.aboutIdArray[i] +
      "</h5>" +
      "</div>";

    // ````` infoWindow発火 ```````````````
    mapInfoWindow[i] = new google.maps.InfoWindow({
      content: infoWindowContent[i],
    });
    // ````` markerEvent ```````````````
    markerEvent(i);
  }
}
var currentInfoWindow = null;
function markerEvent(i) {
  google.maps.event.addListener(mapMarker[i], "mouseover", function () {
    if (currentInfoWindow) {
      currentInfoWindow.close();
    }
    mapInfoWindow[i].open(map, mapMarker[i]);
    currentInfoWindow = mapInfoWindow[i];
  });
}
