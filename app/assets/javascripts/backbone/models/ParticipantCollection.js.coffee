TownHall140.Collections.ParticipantCollection = Backbone.Collection.extend
  initialize: ->
    $(document).bind 'startShow', $.proxy @onStartShow, @
    $(document).bind 'stopShow', $.proxy @onStopShow, @
    $(document).bind 'joinShow', $.proxy @onJoinShow, @
    $(document).bind 'leaveShow', $.proxy @onLeaveShow, @
    $(document).bind 'remove', $.proxy @onRemove, @

    app.get('session').addEventListener 'sessionConnected', $.proxy @onSessionConnect, @
    app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @
    app.get('session').addEventListener 'streamDestroyed', $.proxy @onStreamDestroy, @

  model: TownHall140.Models.Participant

  onStartShow: ->
    @add new TownHall140.Models.Participant
      id: app.get("session").connection.data

  onStopShow: ->
    # TODO

  onJoinShow: ->
    if app.get('role') is "publisher"
      @add new TownHall140.Models.Participant
        id: app.get("session").connection.data
    else
      $(document).trigger 'loginRequired'

  onLeaveShow: ->
    # TODO

  onSessionConnect: (event) ->
    for stream in event.streams
      @addParticipant stream

  onStreamCreate: (event) ->
    for stream in event.streams
      @addParticipant stream

  onStreamDestroy: (event) ->
    participant = @get event.streams[0].connection.data
    @remove participant

  onRemove: (event, participant) ->
    session = app.get('session')
    session.forceUnpublish participant.id

  addParticipant: (stream) ->
    if stream.connection.connectionId isnt app.get('session').connection.connectionId
      event = app.get('events').get(stream.connection.data)
      if event?
        state = event.get 'state'
      else
        state = 'queue'
      @add new TownHall140.Models.Participant
        id: stream.connection.data
        stream: stream
        state: state
