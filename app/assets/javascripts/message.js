$(function () {
  var scrollElement = window.document.documentElement;
  var toBottom = scrollElement.scrollHeight - scrollElement.clientHeight;
  window.scroll(0, toBottom);
});
