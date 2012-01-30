TownHall140.Views.ParticipantView = Backbone.View.extend
  initialize: ->
    @model.bind 'change:id', $.proxy @onIdChange, @
    @model.bind 'change:state', $.proxy @onStateChange, @
    @model.get('question').bind 'change', $.proxy @onQuestionChange, @

  template: JST["backbone/templates/participant"]

  events:
    "click .remove": "onRemoveClick"
    "click .tostage": "onToStageClick"
    "click .offstage": "offStageClick"

  onRemoveClick: ->
    $(document).trigger 'remove', @model

  onToStageClick: ->
    $(document).trigger 'toStage', @model

  offStageClick: ->
    $(document).trigger 'offStage', @model

  onIdChange: (model) ->
    @el.attr 'id', model.id

  onStateChange: (model, collection) ->
    @el.removeClass()
    @el.addClass(model.get('state'))
    @setAudioSubscribe()

  onQuestionChange: (model) ->
    $(".question", @el).html model.get('body')

  render: ->
    @el.html @template

    if @model.get('stream')
      subscriber = app.get('session').subscribe @model.get('stream'), "videoContainer"
      @model.set
        subscriber: subscriber
      @setAudioSubscribe()
    else
      publisher = app.get('session').publish "videoContainer"
      @model.set
        publisher: publisher

  setAudioSubscribe: ->
    subscriber = @model.get 'subscriber'
    if subscriber?
      if @model.get('state') is 'guest' or @model.get('state') is 'host'
        @model.get('subscriber').subscribeToAudio(true)
      else
        @model.get('subscriber').subscribeToAudio(false)
