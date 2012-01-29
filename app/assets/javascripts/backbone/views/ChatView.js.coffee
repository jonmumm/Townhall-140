TownHall140.Views.ChatView = Backbone.View.extend
  initialize: ->
    app.get('pusher').bind 'chat', $.proxy @onChatNew, @
    $(".submit", @el).click $.proxy @onSubmitClick, @
    $("input", @el).keypress $.proxy @onInputKey, @

  template: JST["backbone/templates/chat"]

  onSubmitClick: ->
    @postMessage $("input", @el).val()

  onInputKey: (event) ->
    if event.keyCode == 13
      @postMessage $("input", @el).val()

  onChatNew: (event) ->
    div = $(".messages", @el)
    div.append @template event
    div.prop { scrollTop: div.prop "scrollHeight" }

  postMessage: (message) ->
    show_id = app.get('show').id

    if message isnt ""
      $.ajax
        type: "post"
        url: "/shows/#{show_id}/chats"
        data:
          message: message
        error: (error) ->
          $(document).trigger 'loginRequired'

      $("input", @el).val("")
