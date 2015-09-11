// Activate tooltips
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

// Make reply to tweet form appear
$(".glyphicon-share-alt").on("click", function() {
  $(this).parents(".tweet").next(".reply-form").fadeToggle();
});
