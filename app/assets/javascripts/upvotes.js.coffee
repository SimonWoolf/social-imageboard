
$(document).ready ->
  # note: not http! actually sw://localhost...
  dispatcher = new WebSocketRails(window.location.host + '/websocket')

  channel = dispatcher.subscribe('votes')
  channel.bind 'vote', (post) ->
    # ruby-like string interpolation because coffeescript
    $(".votes_count[data-id=#{post.id}]").text(post.points)
