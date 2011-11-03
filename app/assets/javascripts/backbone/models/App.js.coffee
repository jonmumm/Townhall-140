Showjo.Models.App = Backbone.Model.extend
  start: ->
    @get('session').connect @get('opentok_api_key'), @get('opentok_token')
