TownHall140.Collections.EventManager = Backbone.Collection.extend
  initialize: ->
    show_id = app.get('show').id

    $(document).bind 'toStage', $.proxy @onToStage, @
    $(document).bind 'offStage', $.proxy @onOffStage, @

    $.getJSON "/shows/#{show_id}/events", $.proxy @onEventsInit, @

    app.get('pusher').bind 'state', $.proxy @onEventNew, @

    if app.get('role') is "moderator"
      app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @

  onEventsInit: (events) ->
    for event in events
      @processEvent event

  onEventNew: (event) ->
    @processEvent event

  processEvent: (event) ->
    if @get event.user_id
      @get(event.user_id).set { state: event.state }
    else
      @add new TownHall140.Models.Event
        id: event.user_id
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

    @postEvent stream.connection.data, state

  postEvent: (user_id, state) ->
    show_id = app.get('show').id
    event =
      user_id: user_id
      state: state

    $.ajax
      type: "post"
      url: "/shows/#{show_id}/events"
      data:
        event: event
