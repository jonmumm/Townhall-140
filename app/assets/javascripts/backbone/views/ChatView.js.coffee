TownHall140.Views.ChatView = Backbone.View.extend
  initialize: ->
    app.get('pusher').bind 'state', $.proxy @onChatNew, @
    $(".submit", @el).click $.proxy @onSubmitClick, @
    $("input", @el).keypress $.proxy @onInputKey, @

  onSubmitClick: ->
    @postMessage $("input", @el).val()

  onInputKey: (event) ->
    if event.keyCode == 13
      @postMessage $("input", @el).val()

  postMessage: (message) ->
    if message isnt ""
      $.ajax
        type: "post"
        url: "/shows/#{show_id}/chats"
        data:
          message: message
        success: (response) ->
          console.log response
        error: (error) ->
          console.log error

      $("input", @el).val("")
