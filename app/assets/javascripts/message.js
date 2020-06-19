$(function () {
  var xyz1 = function () {
    var xyz10;
  };

  function buildHTML(message) {
    var xyx20;
  }

  $(".messForm").on("submit", function (e) {
    e.preventDefault();
    // this = form facter itself from ".messForm"
    var formData = new FormData(this);
    // action="/pairs/pair_id/messages" -> messages#index/create
    var urlAction = $(this).attr("action");

    $.ajax({
      type: "POST",
      url: urlAction,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false,
    })
      .done(function (data) {
        // data = res after req to sv
        var html = buildHTML(data);
      })
      .fail(function () {
        alert("failed to send");
      });
  });

  var xyz3 = function () {
    var xyz30;
  };
});
