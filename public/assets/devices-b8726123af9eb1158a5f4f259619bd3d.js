$(document).ready(function() {
  $('.availability').has(".availability:contains('Available')").addClass('availability-Available');
  $('.devices').has(".availability:contains('Unavailable')").addClass('availability-Unavailable');
});
