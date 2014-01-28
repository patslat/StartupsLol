$(function () {
  var $ideaText = $('#idea-text'),
      $hitMe = $('#hit-me');
  $hitMe.on('click', function (e) {
    e.preventDefault()
    $.ajax({
      url: '/idea',
      success: function (data) {
        $ideaText.html(data.idea)
      }
    });
  });
})
