// var map;
// var mapCenter;
// var mapMarker;
// var mapInfoWindow;

function initMap() {
  // var mapArea = document.getElementById("map");
  // var mapCenter = { lat: 35.681272, lng: 139.766946 };
  // var mapOption = {
  //   center: mapCenter,
  //   zoom: 8,
  //   // PCzoom(ctrl/comm*scroll)_or_Mobile(2fingers)
  //   gestureHandling: "greedy",
  //   mapTypeControlOptions: {
  //     position: google.maps.ControlPosition.TOP_LEFT,
  //   },
  //   fullscreenControlOptions: {
  //     position: google.maps.ControlPosition.TOP_RIGHT,
  //   },
  //   streetViewControlOptions: {
  //     position: google.maps.ControlPosition.RIGHT_TOP,
  //   },
  //   zoomControlOptions: {
  //     position: google.maps.ControlPosition.RIGHT_TOP,
  //   },
  //   styles: [
  //     {
  //       featureType: "all",
  //       elementType: "all",
  //       stylers: [{ weight: 1 }, { lightness: -5 }, { saturation: 3 }],
  //     },
  //   ],
  // };

  // // ----- MAP ----------------------------------------
  // var mapIs = new google.maps.Map(mapArea, mapOption);

  // // ----- marker -------------------------------------
  // var mapMarker = new google.maps.Marker({
  //   position: mapCenter,
  //   map: mapIs,
  //   title: "cheak me",
  //   animation: google.maps.Animation.DROP,
  //   icon: {
  //     url: "https://maps.google.com/mapfiles/ms/micons/red-dot.png",
  //     scaledSize: new google.maps.Size(50, 50),
  //   },
  //   label: {
  //     text: "kk!",
  //     color: "blue",
  //     fontSize: "20px",
  //     fontWeight: "bold",
  //   },
  // });

  // // ------ infoWindow --------------------------------
  // var infoWindowContent =
  //   '<div id="content">' +
  //   '<h1 id="firstHeading" class="firstHeading">Tokyoだ</h1>' +
  //   '<div id="bodyContent">' +
  //   "<p><b>Tokyo</b>は人多い</p>" +
  //   // -- 下記指定しないとエラーゆえ --
  //   // '<img src="画像のパス">' +
  //   "<li>Info Window</li>" +
  //   "<li>Open</li>" +
  //   "<li>Close</li>" +
  //   '<p>詳細はこちら: <a id="url" href="http://www.tokyo-skytree.jp/" target="_blank">www.tokyo-skytree.jp</a></p>' +
  //   '<p id="lat">35.710033</p>' +
  //   '<p id="lng">139.810716</p>' +
  //   "</div>" +
  //   "</div>";
  // var mapInfoWindow = new google.maps.InfoWindow({
  //   content: infoWindowContent,
  // });

  // // ----- addListener --------------------------------
  // google.maps.event.addListener(mapMarker, "mouseover", function () {
  //   mapInfoWindow.open(mapIs, mapMarker);
  // });

  // =============================================
  // 緯度:35.907174399999995,経度139.4802688
  // 現在地取得処理 →１回目はabout保存したタイミングでポップアップ保存 →２回目以降はログインしたタイミングで取得更新
  // アバウト作成したらabouts#show 1回目 userSignedIn&@aboutpresence&latLngEnpty → ログインしたらrootだが、abouts#showの度に自動取得上書き、左記満たすかつlatLng存在しないなら許可確認あれば上書き
  // function getPosition() {
  // window.getPosition = function getPosition() {
  // };
  if (!navigator.geolocation) {
    // GeolocationAPIに端末が非対応
    alert("This device can Not deal.");
  } else {
    // GeolocationAPIに端末が対応
    alert("This device can deal.");
    // 現在地を取得
    navigator.geolocation.getCurrentPosition(
      // 《第１引数》取得に成功した場合 successRes
      function successCallback(position) {
        alert(
          "緯度:" +
            position.coords.latitude +
            ",経度" +
            position.coords.longitude
        );
        // var gl_text = "緯度：" + position.coords.latitude + "<br>";
        // gl_text += "経度：" + position.coords.longitude + "<br>";
        // gl_text += "高度：" + position.coords.altitude + "<br>";
        // gl_text += "緯度・経度の誤差：" + position.coords.accuracy + "<br>";
        // gl_text += "高度の誤差：" + position.coords.altitudeAccuracy + "<br>";
        // gl_text += "方角：" + position.coords.heading + "<br>";
        // gl_text += "速度：" + position.coords.speed + "<br>";
        // document.getElementById("show_result").innerHTML = gl_text;
        // alert(show_result);
      },
      // 《第２引数》取得に失敗した場合 errorRes
      function errorCallback(error) {
        switch (error.code) {
          case 1: //PERMISSION_DENIED
            alert("No permission to get current place info.");
            break;
          case 2: //POSITION_UNAVAILABLE
            alert("Couldn't get current place.");
            break;
          case 3: //TIMEOUT
            alert("Time Out.");
            break;
          default:
            alert("Other Error(ERROR CODE:" + error.code + ").");
            break;
        }
      },
      // 《第３引数》高精度,1分,24時間
      {
        enableHighAccuracy: true,
        timeout: 60000,
        // maximumAge: 86400000,
      }
    );
  }
}
