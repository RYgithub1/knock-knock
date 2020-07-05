// ===== Constant ==============================================
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
var currentInfoWindow = null;

// ===== Function【1】 ==========================================
function initMap() {
  // ----- Area and Option ------------------------------
  var mapArea = document.getElementById("map");
  var mapOption = {
    center: mapCenter,
    zoom: 6,
    gestureHandling: "greedy", // PCzoom(ctrl/comm*scroll)_or_Mobile(2fingers)
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
    markerEvent(i);
  }
}

// ===== Function【2】 ==========================================
function markerEvent(i) {
  google.maps.event.addListener(mapMarker[i], "mouseover", function () {
    // ````` Content ```````````````````
    mapInfoWindow[i] = new google.maps.InfoWindow({
      content:
        '<div class="infoWindow">' +
        "<h5>NAME : <b>" +
        gon.nameArray[i] +
        "</b></h5>" +
        '<h5>CLICK : <a id="url" href="/abouts/' +
        gon.aboutIdArray[i] +
        '" target="_blank">About ME</a></h5>' +
        "</div>" +
        "<h5>I'd like to : <i>" +
        gon.invArray[i] +
        "</i></h5>",
    });
    // ````` CurrentInfoWindow `````````
    if (currentInfoWindow) {
      currentInfoWindow.close();
    }
    mapInfoWindow[i].open(map, mapMarker[i]);
    currentInfoWindow = mapInfoWindow[i];
  });
}
