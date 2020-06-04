// var map;

function initMap() {
  var mapArea = document.getElementById("map");
  var mapPin = { lat: -34.397, lng: 150.644 };
  var mapOption = {
    center: mapPin,
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

  var map = new google.maps.Map(mapArea, mapOption);

  // var markerOptions = {
  //   map: map,
  //   position: mapPosition,
  //   icon: "{マーカー画像へのパス}",
  // };
  // var marker = new google.maps.Marker(markerOptions);
}
