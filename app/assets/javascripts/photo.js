$(document).on("turbolinks:load", function () {
  const buildFileField = function (index) {
    const html = `<div class="jsFileGroupIcon" data-index="${index}">
              <label class="jsFileLabelIcon" for="about_photos_attributes_${index}_image">
              <input class="jsFileIcon" type="file" name="about[photos_attributes][${index}][image]" id="about_photos_attributes_${index}_image">
              <div class="jsRemoveIcon">delete icon</div>
              </label></div>;`;
    return html;
  };

  const buildImg = function (tIndex, bUrl) {
    const html = `<img data-index="${tIndex}" src="${bUrl}" width="100px" height="100px">`;
    return html;
  };
  let fileIndex = [1, 2, 3, 4, 5];

  lastIndex = $(".jsFileGroupIcon:last").data("index");
  fileIndex.splice(0, lastIndex);
  $(".hiddenDestroyIcon").hide();

  // ==== 新規と編集 ================================
  $("#image-boxIcon").on("change", ".jsFileIcon", function (e) {
    const targetIndex = $(this).parent().parent().data("index");
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if ((img = $(`img[data-index="${targetIndex}"]`).get(0))) {
      img.setAttribute("src", blobUrl);
    } else {
      $("#previewsIcon").append(buildImg(targetIndex, blobUrl));
      $("#image-boxIcon").append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // ==== 削除 =========================================
  $("#image-boxIcon").on("click", ".jsRemoveIcon", function () {
    const targetIndex = $(this).parent().parent().data("index");
    const hiddenCheck = $(
      `input[data-index="${targetIndex}"].hiddenDestroyIcon`
    );
    if (hiddenCheck) hiddenCheck.prop("checked", true);

    $(`img[data-index="${targetIndex}"]`).remove();
    $(this).parent().parent().remove();

    if ($(".jsFileIcon").length == 0)
      $("#image-boxIcon").append(buildFileField(fileIndex[0]));
  });
});
