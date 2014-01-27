
$(document).ready ->
  # note: not http! actually sw://localhost...
  dispatcher = new WebSocketRails(window.location.host + '/websocket')

  channel = dispatcher.subscribe('votes')
  channel.bind 'vote', (article) ->
    # ruby-like string interpolation because coffeescript
    console.log(article.upvotes)
    $(".upvotes[data-id=#{article.id}]").text(article.upvotes)
