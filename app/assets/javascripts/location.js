// =============================================
// 緯度:35.907174399999995,経度139.4802688
// 現在地取得処理 →１回目はabout保存したタイミングでポップアップ保存 →２回目以降はログインしたタイミングで取得更新
// アバウト作成したらabouts#show 1回目 userSignedIn&@aboutpresence&latLngEnpty → ログインしたらrootだが、abouts#showの度に自動取得上書き、左記満たすかつlatLng存在しないなら許可確認あれば上書き

// if (!navigator.geolocation) {
//   // GeolocationAPIに端末が非対応
//   alert("This device can Not deal.");
// } else {
//   // GeolocationAPIに端末が対応
//   alert("This device can deal.");
//   // 現在地を取得
// }
// ----------------
function getPosition() {
  window.getPosition = function getPosition() {
    navigator.geolocation.getCurrentPosition(
      // 《第１引数》取得に成功
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
      },
      // 《第２引数》取得に失敗
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
        maximumAge: 86400000,
      }
    );
  };
}
