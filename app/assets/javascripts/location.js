// ===== location from abouts#show =================================
function getPosition() {
  navigator.geolocation.getCurrentPosition(
    // 《第１引数》取得に成功
    function successFunction(position) {
      alert(
        "緯度:" + position.coords.latitude + ",経度" + position.coords.longitude
      );
      // window.location.href =
      //   "/abouts/search_location?latitude=" +
      //   position.coords.latitude +
      //   "&longitude=" +
      //   position.coords.longitude;
      $.ajax({
        url: "/abouts/search_location",
        type: "GET",
        dataType: "html",
        data: {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
          // ----
          // user_id: gon.currentUserAbout.user_id,
        },
      });
      // sakae-ue---------------------------------------

      // console.log(gon.currentUserAbout);
      // gon.currentUserAbout.latitude = position.coords.latitude;
      // gon.currentUserAbout.longitude = position.coords.longitude;
      // console.log(gon.currentUserAbout.latitude);
      // console.log(gon.currentUserAbout.longitude);
      // console.log(gon.currentUserAbout);
      // console.log(gon.currentUserPhotos);
      // console.log(gon.currentUserPictures);
      // console.log(gon.currentUserAbout);
      //  ---------------------------------shia--------------------
      // $.ajax({
      //   type: "PATCH",
      //   url: "/abouts/update",
      //   // url: "/posts",
      //   // url: "/categories",
      //   // url: '/tasks.json',
      //   // url: '/tasks',
      //   // url: "/abouts",
      //   // url: "/abouts/create"
      //   // url: "/chairs/#{id}.json",
      //   // ーーーok__アクセス先
      //   data: {
      //     // form,
      //     latitude: gon.currentUserAbout.latitude,
      //     longitude: gon.currentUserAbout.longitude,
      //     // sex: gon.currentUserAbout.sex,
      //     // body: gon.currentUserAbout.body,
      //     // address: gon.currentUserAbout.address,
      //     // birthday: gon.currentUserAbout.birthday,
      //     // tag_list: gon.currentUserAbout.tag_list,
      //     // nation_id: gon.currentUserAbout.nation_id,
      //     // invitation: gon.currentUserAbout.invitation,
      //     // recommendation: gon.currentUserAbout.recommendation,
      //     // id: gon.currentUserAbout.id,
      //     // updated_at: gon.currentUserAbout.updated_at,
      //     // created_at: gon.currentUserAbout.created_at,
      //     // user_id: gon.currentUserAbout.user_id,

      //     // about_id: gon.currentUserPhotos.about_id,
      //     // id: gon.currentUserPhotos.id,
      //     // created_at: gon.currentUserPhotos.created_at,
      //     // image: gon.currentUserPhotos.image,
      //     // updated_at: gon.currentUserPhotos.updated_at,

      //     // gon.currentUserPictures
      //     // gon.currentUserPictures
      //     // gon.currentUserPictures
      //     // gon.currentUserPictures
      //   },
      //   // ーーーーkey: Value; okそう,params!
      //   // dataType: "html",
      //   // dataType: "text",
      //   dataType: "json",
      //   // dataType: "script",
      // });
      // ---------------ue ---------------------------------------
      // latitude.innerHTML = position.coords.latitude;
      // document.getElementById("latitude").innerHTML = position.coords.latitude;
      // longitude.innerHTML = position.coords.longitude;
      // document.getElementById("longitude").innerHTML = position.coords.longitude;
      //   .done(function (data) {
      //     alert("Saved: " + data);
      //   })
      //   .fail(function () {
      //     alert("no save");
      //   });
      // var lat = position.coords.latitude;
      // var lng = position.coords.longitude;
      // console.log(position);
      // geocodeLatLng(lat, lng);
      // about.latitude = position.coords.latitude;
      // about.longitude = position.coords.longitude;
      // var gl_text = "緯度：" + position.coords.latitude + "<br>";
      // gl_text += "経度：" + position.coords.longitude + "<br>";
      // gl_text += "高度：" + position.coords.altitude + "<br>";
    },
    // 《第２引数》取得に失敗
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
    },
    // 《第３引数》高精度,60秒,30秒
    {
      enableHighAccuracy: true,
      timeout: 60000,
      maximumAge: 30000,
    }
  );
}
