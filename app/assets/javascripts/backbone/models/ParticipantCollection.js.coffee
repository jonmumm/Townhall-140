TownHall140.Collections.ParticipantCollection = Backbone.Collection.extend
  initialize: ->
    $(document).bind 'startShow', $.proxy @onStartShow, @
    $(document).bind 'joinShow', $.proxy @onJoinShow, @

    app.get('session').addEventListener 'sessionConnected', $.proxy @onSessionConnect, @
    app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @

  model: TownHall140.Models.Participant

  onStartShow: ->
    @add new TownHall140.Models.Participant

  onJoinShow: ->
    @add new TownHall140.Models.Participant

  onSessionConnect: (event) ->
    for stream in event.streams
      @addParticipant stream

  onStreamCreate: (event) ->
    for stream in event.streams
      @addParticipant stream

  addParticipant: (stream) ->
    if stream.connection.connectionId isnt app.get('session').connection.connectionId
      @add new TownHall140.Models.Participant
        id: stream.streamId
        stream: stream
        state: "queue"
