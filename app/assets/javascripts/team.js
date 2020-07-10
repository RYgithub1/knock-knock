// ===== modal window for Our Team ========================
$(function () {
  $("#jsModalOpen").on("click", function () {
    $(".jsModal").fadeIn();
    return false;
  });
  $("#jsModalClose").on("click", function () {
    $(".jsModal").fadeOut();
    return false;
  });
});
