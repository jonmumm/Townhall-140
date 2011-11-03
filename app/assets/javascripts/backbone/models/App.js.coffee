Showjo.Models.App = Backbone.Model.extend
  initialize: ->
    @set
      participants: new Showjo.Collections.ParticipantCollection

  start: ->
    @get('session').connect @get('opentok_api_key'), @get('opentok_token')
