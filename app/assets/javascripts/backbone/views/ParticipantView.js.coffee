TownHall140.Views.ParticipantView = Backbone.View.extend
  initialize: ->
    @model.bind 'change:id', $.proxy @onIdChange, @
    @model.bind 'change:state', $.proxy @onStateChange, @

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

  render: ->
    @el.html @template

    if @model.get('stream')
      subscriber = app.get('session').subscribe @model.get('stream'), "videoContainer"
      @model.set
        subscriber: subscriber
      @setAudioSubscribe()
    else
      app.get('session').publish "videoContainer"

  setAudioSubscribe: ->
    subscriber = @model.get 'subscriber'
    if subscriber?
      if @model.get('state') is 'guest' or @model.get('state') is 'host'
        @model.get('subscriber').subscribeToAudio(true)
      else
        @model.get('subscriber').subscribeToAudio(false)
