TownHall140.Models.App = Backbone.Model.extend
  setup: ->
    @set
      participants: new TownHall140.Collections.ParticipantCollection

  start: ->
    TB.setLogLevel(TB.DEBUG);
    @get('session').connect @get('opentok_api_key'), @get('opentok_token')
