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
    console.log('submit')

  onModalHide: ->
    $(document).trigger 'joinCancelled'

  render: ->
    @el.modal
      backdrop: true
      show: true
