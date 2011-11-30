TownHall140.Models.Participant = Backbone.Model.extend
  initialize: ->
    app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @

  defaults:
    state: "publish"

  onStreamCreate: (event) ->
    stream = event.streams[0]
    if @id is stream.connection.data and stream.connection.connectionId is app.get('session').connection.connectionId
      
      if app.get('role') is "moderator"
        state = "host"
      else
        state = "queue"

      @set
        stream: stream
        state: state
