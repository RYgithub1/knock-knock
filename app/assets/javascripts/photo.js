$(document).on("turbolinks:load", function () {
  const buildFileFieldIcon = function (index) {
    const html = `<div class="jsFileGroupIcon" data-indexIcon="${index}">
              <label class="jsFileLabelIcon" for="about_photos_attributes_${index}_image">
              <input class="jsFileIcon" type="file" name="about[photos_attributes][${index}][image]" id="about_photos_attributes_${index}_image">
              <div class="jsRemoveIcon">delete icon</div>
              </label></div>`;
    return html;
  };

  const buildImgIcon = function (tIndex, bUrl) {
    const html = `<img data-indexIcon="${tIndex}" src="${bUrl}" width="100px" height="100px">`;
    return html;
  };
  let fileIndexIcon = [1, 2];

  lastIndexIcon = $(".jsFileGroupIcon:last").data("indexIcon");
  fileIndexIcon.splice(0, lastIndexIcon);
  $(".hiddenDestroyIcon").hide();

  // ==== 新規と編集 ================================
  $("#image-boxIcon").on("change", ".jsFileIcon", function (e) {
    const targetIndex = $(this).parent().parent().data("indexIcon");
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if ((img = $(`img[data-indexIcon="${targetIndex}"]`).get(0))) {
      img.setAttribute("src", blobUrl);
    } else {
      $("#previewsIcon").append(buildImgIcon(targetIndex, blobUrl));
      // $("#image-boxIcon").append(buildFileFieldIcon(fileIndexIcon[0]));

      fileIndexIcon.shift();
      fileIndexIcon.push(fileIndexIcon[fileIndexIcon.length - 1] + 1);
    }
  });

  // ==== 削除 =========================================
  $("#image-boxIcon").on("click", ".jsRemoveIcon", function () {
    const targetIndex = $(this).parent().parent().data("indexIcon");
    const hiddenCheck = $(
      `input[data-indexIcon="${targetIndex}"].hiddenDestroyIcon`
    );
    if (hiddenCheck) hiddenCheck.prop("checked", true);

    $(`img[data-indexIcon="${targetIndex}"]`).remove();
    $(this).parent().parent().remove();

    if ($(".jsFileIcon").length == 0)
      $("#image-boxIcon").append(buildFileFieldIcon(fileIndexIcon[0]));
  });
});
