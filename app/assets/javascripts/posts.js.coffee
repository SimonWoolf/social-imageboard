# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#tagfilter').keyup ->
    $('.panel').show()
    $('.panel').filter (i) ->
      filter = $('#tagfilter').val().toLowerCase()
      $('p.taglist', this).html().indexOf(filter) < 0
    .hide();
