function slideSwitch() {
  // $active(現在表示中の画像)、$next(次に表示する画像)
  // 【z10】active初期画像
  var $active = $("#slideshow img.active");

  // $activeの要素がない(lengthが0)の場合、$activeに最後の画像を代入
  if ($active.length == 0) $active = $("#slideshow img:last");

  // activeと同じ階層の、次の要素(画像)を指定してlength
  var $next = $active.next().length
    ? $active.next() //【z10→z9】次の画像があれば、それを代入
    : $("#slideshow img:first"); //次の画像がなければ、最初の画像へ

  // 三項演算子を使わない場合
  // if ($active.next().length) {
  //   $next = $active.next();
  // } else {
  //   $next = $("#slideshow img:first");
  // }

  // last-activeクラスを&activeに付加(addClass)
  $active.addClass("last-active");

  // 【z8→z10】次に表示する画像を、1秒かけて透明度0から1へanimateし、終了時にlast-activeを削除
  $next
    .css({ opacity: 0.0 })
    .addClass("active")
    .animate({ opacity: 1.0 }, 1000, function () {
      $active.removeClass("active last-active");
    });
}

$(function () {
  // slideSwitch()をコールして画像を切替える間隔
  setInterval("slideSwitch()", 4444);
});
