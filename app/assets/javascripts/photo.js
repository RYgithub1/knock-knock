$(document).on("turbolinks:load", function () {
  // 画像用のinputを生成する関数
  const buildFileField = function (index) {
    const html = `<div class="jsFileGroupIcon" data-indexicon="${index}">
                <label class="jsFileLabelIcon" for="about_photos_attributes_${index}_image">
                <input class="jsFileIcon" type="file" name="about[photos_attributes][${index}][image]" id="about_photos_attributes_${index}_image">
                <div class="jsRemoveIcon">delete icon image</div>
                </label></div>`;
    return html;
  };

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  $("#image-boxIcon").on("change", ".jsFileIcon", function (e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $("#image-boxIcon").append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  $("#image-boxIcon").on("click", ".jsRemoveIcon", function () {
    $(this).parent().parent().remove();
    // $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($(".jsFileIcon").length == 0)
      $("#image-boxIcon").append(buildFileField(fileIndex[0]));
  });
});
