$(document).on("turbolinks:load", () => {
  // 画像用のinputを生成する関数
  const buildFileField = (index) => {
    const html = `<div class="jsFileGroup" data-index="${index}">
                <label class="jsFileLabel" for="about_pictures_attributes_${index}_image">
                <input class="jsFile" type="file" name="about[pictures_attributes][${index}][image]" id="about_pictures_attributes_${index}_image">
                <div class="jsRemove">delete picture</div>
                </label></div>`;
    return html;
  };

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  $("#image-box").on("change", ".jsFile", function (e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $("#image-box").append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });

  $("#image-box").on("click", ".jsRemove", function () {
    $(this).parent().parent().remove();
    // $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($(".jsFile").length == 0)
      $("#image-box").append(buildFileField(fileIndex[0]));
  });
});
