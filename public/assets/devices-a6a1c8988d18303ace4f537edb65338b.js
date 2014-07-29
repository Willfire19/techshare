$(document).ready(function() {
  $('.devices').('.availability').has(".availability:contains('Available')").addClass('availability-Available');
  $('.devices').has(".availability:contains('Unavailable')").addClass('availability-Unavailable');
});
