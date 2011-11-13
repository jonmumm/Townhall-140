TownHall140.Models.Event = Backbone.Model.extend
  initialize: ->
    @updateParticipant()
    @bind "change:state", @onStateChange

  onStateChange: ->
    @updateParticipant()

  updateParticipant: ->
    event = app.get('participants').get(@id)
    event.set( { state: @get('state') } ) unless not event?
