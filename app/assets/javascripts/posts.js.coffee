# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  # back to top
  $('#backtotop').click ->
    $('html, body').animate({ scrollTop: 0 }, 'fast')

  $(window).scroll ->
    if $(this).scrollTop() > 100
      $('#backtotop').fadeIn()
    else
      $('#backtotop').fadeOut()

  # filter by tag
  $('#tagfilter').keyup ->
    $('.panel').show()
    tagList = $('#tagfilter').val()
                            .toLowerCase()
                            .split(/[\s,]+/)
    for tag in tagList
      negative = (tag.charAt(0) == '-')
      tag = tag.slice(1) if negative
      $('.panel').filter ->
        indexOfTag = $('p.taglist', this).html().indexOf(tag)
        if negative then indexOfTag > 0 else indexOfTag < 0
      .hide()

  #inputting tags
  $('#post_tagstring').inputosaurus
    width : '100%'
