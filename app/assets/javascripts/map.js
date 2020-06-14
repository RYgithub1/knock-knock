// var map;
// var mapCenter;
// var mapMarker;
// var mapInfoWindow;

function initMap() {
  var mapArea = document.getElementById("map");
  var mapCenter = { lat: -34.397, lng: 150.644 };
  // var lat = parseFloat(document.getElementById('lat').textContent);
  // var lng = parseFloat(document.getElementById('lng').textContent)

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
    styles: [
      {
        featureType: "all",
        elementType: "all",
        stylers: [{ weight: 1 }, { lightness: -5 }, { saturation: 3 }],
      },
    ],
  };

  // ----- 地図の生成 -----
  var map = new google.maps.Map(mapArea, mapOption);

  // ----- marker -----
  // var image = 'bullets/_st_zzzzzzl SSS.gif';
  var mapMarker = new google.maps.Marker({
    position: mapCenter,
    // current_userとaboutsを繰り返しで指定
    map: map,
    title: "here is",
    animation: google.maps.Animation.DROP,
    icon: {
      url: "https://maps.google.com/mapfiles/ms/micons/red-dot.png",
      scaledSize: new google.maps.Size(50, 50),
    },
    label: {
      text: "knock",
      color: "black",
      fontSize: "20px",
      fontWeight: "bold",
    },
  });

  // ------ infoWindow ------
  var infoWindowContent =
    '<div id="content">' +
    '<h1 id="firstHeading" class="firstHeading">Tokyoだ</h1>' +
    '<div id="bodyContent">' +
    "<p><b>Tokyo</b>は人多い</p>" +
    '<img src="画像のパス">' +
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

  // ----- addListener -----
  // google.maps.event.addListener(mapMarker, "mouseover", function () {
  //   mapInfoWindow.open(map, mapMarker);
  // });
  mapMarker.addListener("mouseover", function () {
    mapInfoWindow.open(map, mapMarker);
  });
  // mapMarker.addListener("position_changed", function () {
  //   mapInfoWindow.close();
  // });
  // infoWindow.addListener("position_changed", function () {
  //   marker.setMap(null); //マーカーを削除
  // });
}
