TownHall140.Collections.EventManager = Backbone.Collection.extend
  initialize: ->
    show_id = app.get 'show_id'

    $(document).bind 'toStage', $.proxy @onToStage, @
    $(document).bind 'offStage', $.proxy @onOffStage, @

    $.getJSON "/event/current", { show_id: app.get 'show_id' }, $.proxy @onEventsInit, @

    app.get('pusher').subscribe("#{show_id}").bind 'state', $.proxy @onEventNew, @

    if app.get('is_moderator')
      app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @

  onEventsInit: (events) ->
    for event in events
      @processEvent event

  onEventNew: (event) ->
    @processEvent event

  processEvent: (event) ->
    if @get event.stream_id
      @get(event.stream_id).set { state: event.state }
    else
      @add new TownHall140.Models.Event
        id: event.stream_id
        state: event.state

  onToStage: (event, participant) ->
    @postEvent participant.id, "guest"

  onOffStage: (event, participant) ->
    @postEvent participant.id, "queue"

  onStreamCreate: (event) ->
    stream = event.streams[0]
    if stream.connection.connectionId is app.get('session').connection.connectionId
      state = "host"
    else
      state = "queue"

    @postEvent stream.streamId, state

  postEvent: (stream_id, state) ->
    $.ajax
      type: "post"
      url: "/event"
      data:
        show_id: app.get 'show_id'
        stream_id: stream_id
        state: state

