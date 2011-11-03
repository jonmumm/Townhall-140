Showjo.Collections.ParticipantCollection = Backbone.Collection.extend
  initialize: ->
    $(document).bind 'startShow', $.proxy @onStartShow, @
    $(document).bind 'joinShow', $.proxy @onJoinShow, @

  model: Showjo.Models.Participant

  onStartShow: ->
    @add new Showjo.Models.Participant

  onJoinShow: ->
    @add new Showjo.Models.Participant
