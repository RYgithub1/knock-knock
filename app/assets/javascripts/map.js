// var map;
// var mapCenter;
// var mapMarker;
// var mapInfoWindow;

function initMap() {
  var mapArea = document.getElementById("map");
  var mapCenter = { lat: 35.681272, lng: 139.766946 };
  var mapOption = {
    center: mapCenter,
    zoom: 12,
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
    // -- 下記指定しないとエラーゆえ --
    // '<img src="画像のパス">' +
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
