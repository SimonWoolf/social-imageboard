$(document).ready ->
  $('#backtotop').click ->
    $('html, body').animate({ scrollTop: 0 }, 'fast')

  $(window).scroll ->
    if $(this).scrollTop() > 100
      $('#backtotop').fadeIn()
    else
      $('#backtotop').fadeOut()
