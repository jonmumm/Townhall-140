$(document).ready ->
  console.log 'ready'
  $("#msg").change ->
    console.log 'hi'

  $(".tweetForm textarea").keypress (event) ->
    msg = event.target.value

    $(".tweetForm #submitButton").attr "href", (i, val) ->
      return "https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg)
