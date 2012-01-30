TownHall140.Views.QuestionModalView = Backbone.View.extend
  initialize: ->
    $(document).bind 'enterQuestion', $.proxy @onEnterQuestion, @
    $(".submit", @el).click $.proxy @onSubmitClick, @
    $("input", @el).keypress $.proxy @onInputKey, @
    @el.bind 'hide', @onModalHide

  onEnterQuestion: ->
    @render()

  onSubmitClick: ->
    @postMessage $("input", @el).val()

  onInputKey: (event) ->
    if event.keyCode == 13
      @postMessage $("input", @el).val()

  onModalHide: ->
    $(document).trigger 'joinCancelled'

  render: ->
    @el.modal
      backdrop: true
      show: true

  postMessage: (message) =>
    show_id = app.get('show').id

    if message isnt "" and not submitting
      submitting = true
      $.ajax
        type: "post"
        url: "/shows/#{show_id}/questions"
        data:
          body: message
        success: (response) =>
          $("#questionModal").modal('hide')
          $(document).trigger 'enterShow'
          submitting = false
        error: (error) =>
          submitting = false
          # Show some error  

