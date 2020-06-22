$(document).on("turbolinks:load", function () {
  // 画像用のinputを生成する関数
  const buildFileField = function (index) {
    const html = `<div class="jsFileGroup" data-index="${index}">
                <label class="jsFileLabel" for="about_pictures_attributes_${index}_image">
                <input class="jsFile" type="file" name="about[pictures_attributes][${index}][image]" id="about_pictures_attributes_${index}_image">
                <div class="jsRemove">← delete left picture</div>
                </label></div>`;
    return html;
  };

  const buildImg = function (tIndex, bUrl) {
    const html = `<img data-index="${tIndex}" src="${bUrl}" width="100px" height="100px">`;
    return html;
  };

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1, 2, 3, 4];

  // ページ読み込み時に、既に使われているindexを除外
  lastIndex = $(".jsFileGroup:last").data("index");
  fileIndex.splice(0, lastIndex);
  $(".hiddenDestroy").hide();

  // ===== 新規abouts作成時と編集時 ==================
  $("#image-box").on("change", ".jsFile", function (e) {
    const targetIndex = $(this).parent().parent().data("index");
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if ((img = $(`img[data-index="${targetIndex}"]`).get(0))) {
      img.setAttribute("src", blobUrl);
    } else {
      $("#previews").append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $("#image-box").append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // ===== 削除時 ==================
  $("#image-box").on("click", ".jsRemove", function () {
    const targetIndex = $(this).parent().parent().data("index");
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hiddenDestroy`);
    // 削除ボタン押下時、該当indexが振られたへチェックボックスへチェックtrue
    if (hiddenCheck) hiddenCheck.prop("checked", true);

    $(`img[data-index="${targetIndex}"]`).remove();
    $(this).parent().parent().remove();

    // 画像入力欄が0個にならないようにappend
    if ($(".jsFile").length == 0)
      $("#image-box").append(buildFileField(fileIndex[0]));
  });
});
