// ===== location from abouts#show =================================
function getPosition() {
  var watchId = navigator.geolocation.watchPosition(
    // ----- 《First Argument : Success to get》 -----------------------------
    function successFunction(position) {
      alert("Success to get !");
      $.ajax({
        type: "GET",
        url: "/abouts/location",
        data: {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
        },
        dataType: "html",
        // option: "html","json","script","text"
      });
      navigator.geolocation.clearWatch(watchId);
    },
    // ----- 《Second Argument : Failed to get》 -----------------------------
    function errorFunction(error) {
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
      navigator.geolocation.clearWatch(watchId);
    },
    // ----- 《Third Argument》高精度,最大待ち時間60秒,キャッシュ有効期間0秒 --------
    {
      enableHighAccuracy: true,
      timeout: 60000,
      maximumAge: 0,
    }
  );
}
