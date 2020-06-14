// var map;
// var mapCenter;
// var mapMarker;
// var mapInfoWindow;

function initMap() {
  var mapArea = document.getElementById("map");
  var mapCenter = { lat: -34.397, lng: 150.644 };
  var mapOption = {
    center: mapCenter,
    zoom: 8,
    // PCズーム(ctrl/command +スクロール)orMobile(地図移動指2本)
    gestureHandling: "greedy",
    // 設置場所変更
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
  };

  // map itself
  var map = new google.maps.Map(mapArea, mapOption);

  // marker
  var mapMarker = new google.maps.Marker({
    position: mapCenter,
    map: map,
  });

  // infoWindow
  var mapInfoWindow = new google.maps.InfoWindow({
    content: '<div class="sample">TAM 大阪</div>',
    // content: "marker InfoWindow",
  });

  // mouseover
  // mapMarker.addListener("mouseover", function () {
  //   mapInfoWindow.open(map, mapMarker);
  // });
  google.maps.event.addListener(mapMarker, "mouseover", function () {
    mapInfoWindow.open(map, mapMarker);
  });

  // mouseout
  google.maps.event.addListener(mapMarker, "mouseout", function () {
    mapInfoWindow.close();
  });

  // var markerOptions = {
  //   map: map,
  //   position: mapPosition,
  //   icon: "{マーカー画像へのパス}",
  // };
  // var marker = new google.maps.Marker(markerOptions);
}
