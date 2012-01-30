TownHall140.Models.Participant = Backbone.Model.extend
  initialize: ->
    app.get('session').addEventListener 'streamCreated', $.proxy @onStreamCreate, @
    @set { question: new TownHall140.Models.Question }
    $.ajax
      url: "/shows/#{app.get('show').id}/questions/#{@id}/latest"
      dataType: "json"
      success: (response) =>
        if response
          @get('question').set response
      error: (error) =>
        # TODO Error getting question


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
