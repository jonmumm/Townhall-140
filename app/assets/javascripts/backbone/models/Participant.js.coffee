TownHall140.Models.Participant = Backbone.Model.extend
  initialize: ->
    app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @

  defaults:
    id: "myPublisher"
    state: "publish"

  onStreamCreate: (event) ->
    stream = event.streams[0]
    if @id is "myPublisher" and stream.connection.connectionId is app.get('session').connection.connectionId
      
      if app.get('is_moderator')
        state = "host"
      else
        state = "queue"

      @set
        id: stream.streamId
        stream: stream
        state: state
