// var map;
// var mapCenter;
// var mapMarker;
// var mapInfoWindow;
// `````````````````````````````````````````
console.log(gon.nameArray);
console.log(gon.aboutIdArray);
console.log(gon.aboutIdArray[2]);
console.log(gon.latArray);
console.log(gon.lngArray);
console.log(gon.invArray);
console.log(parseFloat(gon.latArray));

var currentUserLat = parseFloat(gon.latArray[0]);
var currentUserLng = parseFloat(gon.lngArray[0]);

function initMap() {
  var mapArea = document.getElementById("map");
  var mapCenter = {
    // lat: 35.659482,
    // lng: 139.700553,
    lat: currentUserLat,
    lng: currentUserLng,
  };
  var mapOption = {
    center: mapCenter,
    zoom: 8,
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

  // ----- MAP ----------------------------------------
  var mapIs = new google.maps.Map(mapArea, mapOption);

  // ----- marker -------------------------------------
  var mapMarker = new google.maps.Marker({
    position: mapCenter,
    map: mapIs,
    title: "cheak me",
    animation: google.maps.Animation.DROP,
    icon: {
      url: "https://maps.google.com/mapfiles/ms/micons/red-dot.png",
      scaledSize: new google.maps.Size(50, 50),
    },
    label: {
      text: "kk!",
      color: "blue",
      fontSize: "20px",
      fontWeight: "bold",
    },
  });

  // ------ infoWindow --------------------------------
  var infoWindowContent =
    '<div id="content">' +
    '<h1 id="firstHeading" class="firstHeading">Tokyoだ</h1>' +
    '<div id="bodyContent">' +
    "<p><b>Tokyo</b>は人多い</p>" +
    "<%= user.username %>" +
    '<a href="/abouts/<%= about.id %>">' +
    "<li>Info Window</li>" +
    "<li>Open</li>" +
    "<li>Close</li>" +
    '<p>詳細はこちら: <a id="url" href="http://www.tokyo-skytree.jp/" target="_blank">www.tokyo-skytree.jp</a></p>' +
    '<p id="lat">35.710033</p>' +
    '<p id="lng">139.810716</p>' +
    "</div>" +
    "</div>";
  var mapInfoWindow = new google.maps.InfoWindow({
    content: infoWindowContent,
  });

  // ----- addListener --------------------------------
  google.maps.event.addListener(mapMarker, "mouseover", function () {
    mapInfoWindow.open(mapIs, mapMarker);
  });
}
